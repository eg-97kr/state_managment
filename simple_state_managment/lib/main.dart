import 'package:flutter/material.dart';
import 'package:simple_state_managment/business_logic/app_model.dart';
import 'package:simple_state_managment/business_logic/app_provider.dart';
import 'package:simple_state_managment/business_logic/cart.dart';
import 'package:simple_state_managment/data/catalog.dart';
import 'package:simple_state_managment/presentation/catalog_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final model = AppModel(
      catalog: Catalog(),
      cart: Cart(),
    );
    return AppProvider(
      model: model,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CatalogScreen(),
      ),
    );
  }
}
