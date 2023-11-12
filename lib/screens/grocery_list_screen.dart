import 'package:flutter/material.dart';

class GroceryListScreen extends StatefulWidget {
  const GroceryListScreen({super.key});

  @override
  State<GroceryListScreen> createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
  final List groceryList = [
    {
      'title': 'Red chilli',
      'image': 'assets/images/chilli.png',
      'description': 'Lorem ipsum dolor sit amet',
      'price': 150,
    },
    {
      'title': 'Cucumber',
      'image': 'assets/images/cucumber.png',
      'description': 'Lorem ipsum dolor sit',
      'price': 200,
    },
    {
      'title': 'Tomato',
      'image': 'assets/images/tomatos.png',
      'description': 'Lorem ipsum dolor sit',
      'price': 100,
    },
    {
      'title': 'Beetroot',
      'image': 'assets/images/beetroot.png',
      'description': 'Lorem ipsum dolor sit',
      'price': 300,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Grocery List")),
        body: _buildMainWidget(context));
  }

  Widget _buildMainWidget(BuildContext context) {
    return ListView.separated(
        itemCount: groceryList.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(
              height: 10,
              thickness: 2,
            ),
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(
              groceryList[index]['image'],
              width: 50,
              height: 50,
            ),
            title: Text(groceryList[index]['title']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(groceryList[index]['description']),
                Text(
                  'PKR ${groceryList[index]['price']}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
