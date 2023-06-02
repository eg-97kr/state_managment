import 'package:flutter/material.dart';
import 'package:flutter_riverpood/data/models/product_model.dart';

class Cart extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get itemCount => _items.fold(
        0,
        (previousValue, cartItem) => previousValue + cartItem.quantity,
      );

  double get total => _items.fold(
        0,
        (previousValue, cartItem) =>
            previousValue + (cartItem.product.price * cartItem.quantity),
      );

  void addItem(Product product) {
    var cartItem = _items.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => CartItem(product: product),
    );
    cartItem.quantity++;
    if (!_items.contains(cartItem)) {
      _items.add(cartItem);
    }
    notifyListeners();
  }

  void notifyButton() {
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
