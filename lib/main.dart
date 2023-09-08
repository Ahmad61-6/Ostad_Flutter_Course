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
      debugShowCheckedModeBanner: true,
      home: Profile(),
    );
  }

}
class Profile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.blue,
      centerTitle: true,
        toolbarHeight: 80,
        title: Text('Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network('https://cdn4.iconfinder.com/data/icons/social-messaging-ui-color-and-shapes-3/177800/129-512.png'
            ,scale: 9,),
            // Icon((Icons.person_outline),size: 50,color: Colors.green,),
            Text('Jhon Doe',style:
              TextStyle(
                fontSize: 30,
                color: Colors.green
              )
              ,),
            Text('Flutter Batch 4', style: TextStyle(
              fontSize: 22,
              color: Colors.blue,
            ),
            )

          ],
        ),
      ),
      );
  }

}