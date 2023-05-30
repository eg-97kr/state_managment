import 'package:flutter/material.dart';
import 'package:simple_state_managment/business_logic/app_provider.dart';
import 'package:simple_state_managment/presentation/basket.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    final itemsQuantity = AppProvider.of(context).catalog.products;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Simple State Managment'),
      ),
      body: ListView.builder(
        itemCount: itemsQuantity.length,
        itemBuilder: (context, index) {
          final product = itemsQuantity[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text(product.price.toString()),
            trailing: const Icon(Icons.add_shopping_cart),
            onTap: () {
              AppProvider.of(context).cart.addItem(product);
              setState(() {});
            },
          );
        },
      ),
      floatingActionButton: Builder(
        builder: (context) => GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const FoodBasket(),
            ),
          ),
          child: Container(
            height: 30,
            width: 170,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                  'Товаров в корзине ${AppProvider.of(context).cart.itemCount}'),
            ),
          ),
        ),
      ),
    );
  }
}
