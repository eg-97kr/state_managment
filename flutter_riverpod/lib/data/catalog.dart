import 'package:flutter_riverpood/data/models/product_model.dart';

class Catalog {
  final List<Product> _products = [
    Product(
      id: 1,
      name: 'Хлеб',
      price: 60,
    ),
    Product(
      id: 2,
      name: 'Яйца',
      price: 120,
    ),
    Product(
      id: 3,
      name: 'Молоко',
      price: 90,
    ),
    Product(
      id: 4,
      name: 'Сыр',
      price: 250,
    ),
  ];

  List<Product> getProducts() {
    return _products;
  }
}
