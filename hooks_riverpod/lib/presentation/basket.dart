import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hoooks_riverpod/business_logic/cart_notifier.dart';

class FoodBasket extends ConsumerWidget {
  const FoodBasket({super.key});

  static const routeName = '/cart';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: cart.count == 0
          ? const Center(
              child: Text('В вашей корзине еще нет товаров'),
            )
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Товаров в корзине: ${cart.count}'),
                  Text('На сумму ${cart.total} P'),
                ],
              ),
            ),
    );
  }
}
