import 'package:hoooks_riverpod/data/models/products.dart';

class Catalog {
  static List<Product> getProducts() {
    return [
      Product(id: 1, name: 'Колбаса', price: 350),
      Product(id: 2, name: 'Хлеб', price: 70),
      Product(id: 3, name: 'Вода', price: 50),
      Product(id: 4, name: 'Майонез', price: 140),
      Product(id: 5, name: 'Соль', price: 80),
    ];
  }
}
