import 'package:flutter/material.dart';

class GroceryList {
  final String title;
  final String description;
  final int price;
  final String image;

  GroceryList({
    required this.title,
    required this.image,
    required this.description,
    required this.price,
  });
}

final List<GroceryList> groceryItem = [
  GroceryList(
    title: 'Red chilli',
    image: 'assets/images/chilli.png',
    description: 'Lorem ipsum dolor sit amet',
    price: 150,
  ),
  GroceryList(
    title: 'Cucumber',
    image: 'assets/images/cucumber.png',
    description: 'Lorem ipsum dolor sit',
    price: 200,
  ),
  GroceryList(
    title: 'Tomato',
    image: 'assets/images/tomatos.png',
    description: 'Lorem ipsum dolor sit',
    price: 100,
  ),
  GroceryList(
    title: 'Beetroot',
    image: 'assets/images/beetroot.png',
    description: 'Lorem ipsum dolor sit',
    price: 300,
  )
];

class GroceryListScreen extends StatefulWidget {
  const GroceryListScreen({super.key});

  @override
  State<GroceryListScreen> createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Grocery List")),
        body: _buildMainWidget(context));
  }

  Widget _buildMainWidget(BuildContext context) {
    return ListView.separated(
        itemCount: groceryItem.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(
              height: 10,
              // thickness: 2,
            ),
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(
              groceryItem[index].image,
              width: 50,
              height: 50,
            ),
            title: Text(
              groceryItem[index].title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  groceryItem[index].description,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(
                  'PKR ${groceryItem[index].price}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GroceryDetailScreen(),
                  settings: RouteSettings(
                    arguments: groceryItem[index],
                  ),
                ),
              );
            },
          );
        });
  }
}

class GroceryDetailScreen extends StatelessWidget {
  const GroceryDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final groceryItem =
        ModalRoute.of(context)!.settings.arguments as GroceryList;

    return Scaffold(
        appBar: AppBar(
          title: Text(groceryItem.title),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(groceryItem.image),
                const SizedBox(height: 16),
                Text('Description: ${groceryItem.description}'),
                const SizedBox(height: 8),
                Text('Price: PKR ${groceryItem.price}'),
              ],
            )));
  }
}
