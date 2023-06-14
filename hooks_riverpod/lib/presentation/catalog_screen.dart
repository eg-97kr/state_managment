import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hoooks_riverpod/business_logic/cart_notifier.dart';
import 'package:hoooks_riverpod/data/catalog.dart';
import 'package:hoooks_riverpod/presentation/basket.dart';

class CatalogScreen extends HookConsumerWidget {
  CatalogScreen({super.key});

  final products = Catalog.getProducts();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Hooks Riverpod'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text(product.price.toString()),
            trailing: const Icon(Icons.add_shopping_cart),
            onTap: () {
              ref.read(cartProvider.notifier).addToCart(product);
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
                  child: Text('Товаров в корзине ${cart.count}'),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
