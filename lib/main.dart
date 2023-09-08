import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '';

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
      debugShowCheckedModeBanner: true,
      home: HomePage(),
    );
  }

}
class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.green,
      toolbarHeight: 100,
      elevation: 70.0,
      centerTitle: true,
        leading: Icon(
          Icons.add_business_rounded, color: Colors.white,
        ),
        title: Text('Home',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        actions: <Widget>[
          Icon(Icons.search),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is mod 5 Assignment',style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
          RichText(text: TextSpan(
            style: TextStyle(
              fontSize: 20,
              color: Colors.amber,
            ),
            children: [
              TextSpan(
                text: 'My ',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.deepOrange
                )
              ),
              TextSpan(
                text: 'phone',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.lightBlue
                ),
              ),

              TextSpan(
                text: ' name',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.purple
                ),
              ),
              TextSpan(
                text: ' Your phone name',
              ),
            ]
          )
          )
              ],
            )
          ],
        ),
      ),
      );
  }

}