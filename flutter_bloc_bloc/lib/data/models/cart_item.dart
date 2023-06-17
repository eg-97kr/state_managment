import 'package:flutter_bloc_bloc/data/models/products.dart';

class CartItem {
  final Product product;
  final int quantity;

  const CartItem({
    required this.product,
    required this.quantity,
  });
}
