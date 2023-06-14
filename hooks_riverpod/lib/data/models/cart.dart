import 'package:hoooks_riverpod/data/models/products.dart';

class CartItem {
  List<Product>? items = [];

  CartItem({this.items});

  int get count => items!.length;

  double get total => items!.fold<double>(0, (sum, item) => sum + item.price);

  CartItem copyWith({List<Product>? items}) {
    return CartItem(items: items ?? this.items);
  }
}
