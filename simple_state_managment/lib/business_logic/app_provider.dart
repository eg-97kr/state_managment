import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_state_managment/business_logic/app_model.dart';

class AppProvider extends StatelessWidget {
  final AppModel model;
  final Widget child;

  const AppProvider({
    super.key,
    required this.model,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => model,
      child: child,
    );
  }

  static AppModel of(BuildContext context) {
    return Provider.of<AppModel>(context, listen: false);
  }
}
