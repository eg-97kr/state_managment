import 'package:flutter/material.dart';
import 'package:simple_state_managment/business_logic/cart.dart';
import 'package:simple_state_managment/data/catalog.dart';

class AppModel extends ChangeNotifier {
  final Catalog catalog;
  final Cart cart;

  AppModel({
    required this.catalog,
    required this.cart,
  });
}
