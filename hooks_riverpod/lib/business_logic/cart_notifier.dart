import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hoooks_riverpod/data/models/cart.dart';
import 'package:hoooks_riverpod/data/models/products.dart';

final cartProvider =
    StateNotifierProvider<CartNotifier, CartItem>((ref) => CartNotifier());

class CartNotifier extends StateNotifier<CartItem> {
  CartNotifier() : super(CartItem(items: []));

  void addToCart(Product product) {
    state.items!.add(product);
    state = state.copyWith(items: state.items);
  }
}
