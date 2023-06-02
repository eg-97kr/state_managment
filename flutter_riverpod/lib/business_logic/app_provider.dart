import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpood/business_logic/cart.dart';
import 'package:flutter_riverpood/data/catalog.dart';
import 'package:flutter_riverpood/data/models/product_model.dart';

final catalogProvider = FutureProvider<List<Product>>((ref) async {
  final service = Catalog();
  return service.getProducts();
});

final cartProvider = ChangeNotifierProvider<Cart>((ref) => Cart());
