import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
      body: Center(
        child:
        Stack(
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.pink,
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.green,
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                height: 20,
                width: 20,
                color: Colors.purple,
              ),
            ),
            Positioned(
              bottom: 10,
              left: 20,
              child: Container(
                height: 15,
                width: 15,
                color: Colors.black,
              ),
            ),


          ],
        ),
      ),
    );
  }
}

