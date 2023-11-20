import 'package:flutter/material.dart';
import 'package:the_flutter_way/screens/grocery_list_screen.dart';

class GroceryListApp extends StatelessWidget {
  const GroceryListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const GroceryListScreen());
  }
}
