import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShoppingList(),
    );
  }

}

class ShoppingList extends StatelessWidget {
  const ShoppingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('My Shopping List')),
        backgroundColor: Colors.blueAccent,
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 25),
        actions: const [
          Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: const [
          ListTile(
            leading: Icon(Icons.shopping_basket_rounded),
            title: Text('Apples'),
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket_rounded),
            title: Text('Bananas'),
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket_rounded),
            title: Text('Bread'),
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket_rounded),
            title: Text('Milk'),
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket_rounded),
            title: Text('Eggs'),
          ),
        ],
      ),
    );
  }
}

