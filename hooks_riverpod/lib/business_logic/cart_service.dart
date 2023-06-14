import 'package:hoooks_riverpod/data/models/cart.dart';
import 'package:hoooks_riverpod/data/models/products.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartService {
  static CartItem cart = CartItem();

  static void addToCart(Product product) {
    cart.items!.add(product);
  }
}

class CartNotifier extends StateNotifier<CartItem> {
  CartNotifier() : super(CartItem());

  void addToCart(Product product) {
    state.items!.add(product);
    state = state.copyWith(items: state.items);
  }
}
