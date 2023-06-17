import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_bloc/business_logic/bloc.dart';
import 'package:flutter_bloc_bloc/data/models/cart.dart';

class FoodBasket extends StatelessWidget {
  const FoodBasket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocBuilder<CartBloc, Cart>(
        builder: (context, cart) {
          return cart.totalItems == 0
              ? const Center(
                  child: Text('В вашей корзине еще нет товаров'),
                )
              : Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Товаров в корзине: ${cart.totalItems}'),
                      Text('На сумму ${cart.totalPrice} P'),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
