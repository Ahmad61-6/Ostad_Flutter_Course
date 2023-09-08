/*import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              //Greetings Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hi, Ahmad",style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('7 September, 2023',
                      style:
                        TextStyle(color: Colors.blue[200]),)
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[600],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(12),
                    child:
                    Icon(Icons.notifications,
                      color: Colors.white,),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              //search bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[600],
                  borderRadius: BorderRadius.circular(12)
                ),
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(Icons.search,
                    color: Colors.white,),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Search',
                    style:
                      TextStyle(
                        color: Colors.white,

                      ),)
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("How do you feel?",style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                  ),
                  Icon(Icons.more_horiz,color: Colors.white,),
                ],
              ),
              //Emotions******
              SizedBox(
                height: 25,
              ),
              Row(
                children: [

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
*/