import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_bloc/business_logic/cart_event.dart';
import 'package:flutter_bloc_bloc/business_logic/cart.dart';
import 'package:flutter_bloc_bloc/data/models/cart_item.dart';

class CartBloc extends Bloc<CartEvent, Cart> {
  CartBloc() : super(Cart(items: [])) {
    on<AddProductEvent>((event, emit) {
      final newItems = List.of(state.items!);
      final existingIndex =
          newItems.indexWhere((item) => item.product == event.product);
      if (existingIndex != -1) {
        newItems[existingIndex] = CartItem(
            product: event.product,
            quantity: newItems[existingIndex].quantity + 1);
      } else {
        newItems.add(CartItem(product: event.product, quantity: 1));
      }
      emit(Cart(items: newItems));
    });
  }
}
