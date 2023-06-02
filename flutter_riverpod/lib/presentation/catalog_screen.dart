import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpood/business_logic/app_provider.dart';
import 'package:flutter_riverpood/presentation/basket.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Riverpod'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final catalog = ref.watch(catalogProvider).when(
                data: (value) => value,
                error: (error, stackTrace) => [],
                loading: () => [],
              );
          final cart = ref.watch(cartProvider);
          return ListView.builder(
            itemCount: catalog.length,
            itemBuilder: (context, index) {
              final product = catalog[index];
              return ListTile(
                title: Text(product.name),
                subtitle: Text(product.price.toString()),
                trailing: const Icon(Icons.add_shopping_cart),
                onTap: () {
                  cart.addItem(product);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: Builder(
        builder: (context) => GestureDetector(
          onTap: () => Navigator.pushNamed(context, FoodBasket.routeName),
          child: Consumer(
            builder: (context, ref, child) {
              final cart = ref.watch(cartProvider);
              return Container(
                height: 30,
                width: 170,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text('Товаров в корзине ${cart.itemCount}'),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
