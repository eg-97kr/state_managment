import 'package:flutter_riverpood/business_logic/cart.dart';
import 'package:flutter_riverpood/data/catalog.dart';

class AppModel {
  final Catalog catalog;
  final Cart cart;

  AppModel({
    required this.catalog,
    required this.cart,
  });
}
