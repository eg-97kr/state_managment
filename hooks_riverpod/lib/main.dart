import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hoooks_riverpod/presentation/basket.dart';
import 'package:hoooks_riverpod/presentation/catalog_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: CatalogScreen(),
        initialRoute: '/',
        routes: {
          '/cart': (context) => const FoodBasket(),
        },
      ),
    );
  }
}
