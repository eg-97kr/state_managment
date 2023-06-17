import 'package:flutter_bloc_bloc/data/models/products.dart';

abstract class CartEvent {}

class AddProductEvent extends CartEvent {
  final Product product;

  AddProductEvent(this.product);
}
