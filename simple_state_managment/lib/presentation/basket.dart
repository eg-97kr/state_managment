import 'package:flutter/material.dart';
import 'package:simple_state_managment/business_logic/app_provider.dart';

class FoodBasket extends StatelessWidget {
  const FoodBasket({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = AppProvider.of(context).cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: cart.itemCount == 0
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
            ),
    );
  }
}
