import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit/business_logic/cart.dart';
import 'package:flutter_bloc_cubit/data/models/products.dart';

class FoodBasket extends StatelessWidget {
  const FoodBasket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocBuilder<Cart, List<Product>>(
        builder: (context, cart) {
          final itemCount = cart.length;
          final totalPrice =
              context.select((Cart cubit) => cubit.getTotalPrice());
          return itemCount == 0
              ? const Center(
                  child: Text('В вашей корзине еще нет товаров'),
                )
              : Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Товаров в корзине: $itemCount'),
                      Text('На сумму $totalPrice P'),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
