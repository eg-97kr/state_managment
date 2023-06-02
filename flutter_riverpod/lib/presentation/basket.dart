import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpood/business_logic/app_provider.dart';

class FoodBasket extends StatelessWidget {
  const FoodBasket({super.key});

  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final cart = ref.watch(cartProvider);
          return cart.itemCount == 0
              ? const Center(
                  child: Text('В вашей корзине еще нет товаров'),
                )
              : Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Товаров в корзине: ${cart.itemCount}'),
                      Text('На сумму ${cart.total} P'),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
