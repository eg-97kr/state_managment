import 'package:flutter_bloc_bloc/data/models/cart_item.dart';

class Cart {
  List<CartItem>? items;

  Cart({this.items});

  double get totalPrice =>
      items!.fold(0.0, (sum, item) => sum + item.product.price * item.quantity);

  int get totalItems => items!.fold(0, (sum, item) => sum + item.quantity);
}
