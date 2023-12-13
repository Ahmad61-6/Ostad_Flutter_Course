import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
     body: ResponsiveBuilder
       (builder: (context, sizingInformation) {
         return Center(
           child: Text(sizingInformation.deviceScreenType.toString(),
             style: TextStyle(
               fontSize: 15.sp,
             ),
           ),
         );
     },

     ),
    );
  }
}

