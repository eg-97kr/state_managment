import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit/data/catalog.dart';
import 'package:flutter_bloc_cubit/business_logic/cart.dart';
import 'package:flutter_bloc_cubit/data/models/products.dart';
import 'package:flutter_bloc_cubit/presentation/basket.dart';

class CatalogScreen extends StatelessWidget {
  CatalogScreen({super.key});

  final products = Catalog.getProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Bloc(cubit)'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text(product.price.toString()),
            trailing: const Icon(Icons.add_shopping_cart),
            onTap: () => context.read<Cart>().addProduct(product),
          );
        },
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FoodBasket()),
          );
        },
        child: BlocBuilder<Cart, List<Product>>(
          builder: (context, cart) {
            final itemsCount = cart.length;
            return Container(
              height: 30,
              width: 170,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text('Товаров в корзине $itemsCount'),
              ),
            );
          },
        ),
      ),
    );
  }
}
