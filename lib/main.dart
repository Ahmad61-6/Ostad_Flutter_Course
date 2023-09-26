import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  _CongratulationAlertDialog(Products product) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Congratulations !"),
            content: Text(
                "You have brought ${product.quantity} ${product.name}!!"),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK")),
            ],
          );
        });
  }

  List<Products> products = List.generate(
      20, (index) => Products('Product ${index + 1}', 20.00));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartPage(products: products)));
        },
        child: Icon(Icons.shopping_cart),
      ),
      body: ListView.separated(
        itemCount: products.length,
        itemBuilder: (context, index) {
          Products product = products[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(product.name),
              subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Counter: ${product.quantity}',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          product.quantity += 1;
                          if (product.quantity >= 5) {
                            _CongratulationAlertDialog(product);
                          }
                        });
                      },
                      child: Text('Buy now'))
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  final List<Products> products;

  CartPage({required this.products});

  @override
  Widget build(BuildContext context) {
    int totalCount = products.fold(0, (sum, item) => sum + item.quantity);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total products bought: $totalCount',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                if (products[index].quantity == 0) return SizedBox.shrink();

                return ListTile(
                  title: Text(products[index].name),
                  trailing: Text('x${products[index].quantity}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Products {
  String name;
  double price;
  int quantity = 0;

  Products(this.name, this.price);
}
