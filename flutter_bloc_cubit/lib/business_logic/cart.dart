import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit/data/models/products.dart';

class Cart extends Cubit<List<Product>> {
  Cart() : super([]);

  void addProduct(Product product) {
    state.add(product);
    emit(List.from(state));
  }

  int getItemCount() {
    return state.length;
  }

  double getTotalPrice() {
    return state.fold(0, (total, product) => total + product.price);
  }
}
