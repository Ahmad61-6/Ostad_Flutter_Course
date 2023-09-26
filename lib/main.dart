import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
      runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Products> products = [
  Products("Product 1", 20.00),
  Products("Product 2", 20.00),
  Products("Product 3", 20.00),
  Products("Product 4", 20.00),
  Products("Product 5", 20.00),
  Products("Product 6", 20.00),
  Products("Product 7", 20.00),
  Products("Product 8", 20.00),
  Products("Product 9", 20.00),
  Products("Product 10", 20.00),
  Products("Product 11", 20.00),
  Products("Product 12", 20.00),
  Products("Product 13", 20.00),
  Products("Product 14", 20.00),
  Products("Product 15", 20.00),
  Products("Product 16", 20.00),
  Products("Product 17", 20.00),
  Products("Product 18", 20.00),
  Products("Product 19", 20.00),
  Products("Product 20", 20.00),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(onPressed: () { 
        Navigator.push(context, MaterialPageRoute(builder: (context)=> CartPage()));
      },
        child: Icon(Icons.shopping_cart),
      ),
      body: ListView.separated(itemCount: products.length,
        itemBuilder: (context,index){
          Products product = products[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(product.name),
              subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Counter: ${product.quantity}',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  ),
                  ElevatedButton(onPressed: (){

                  }, child: Text('Buy now'))
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
          );
        },
        ),
    );
  }
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
      ),
    );
  }
}




class Products {
  String name;
  double price;
  int totalProductCount = 0;
  int quantity = 0;

  Products(this.name, this.price);
}

