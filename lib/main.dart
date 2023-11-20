import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    print(size);
    Orientation ori = MediaQuery.orientationOf(context);
    print(ori);
    List<DisplayFeature> disfe = MediaQuery.displayFeaturesOf(context);
    print(disfe);
    return Scaffold(
      appBar: AppBar(
        title: Text('Intro to RD'),
      ),
      body: LayoutBuilder(
        builder: (context, constrains){
          print(constrains.maxHeight);
          if(constrains.maxHeight>500){
            return Center(
              child: Text('Too big screen'),
            );
          }
          else{
            return Center(
              child: OrientationBuilder(
                builder: (context,orientation){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(orientation == Orientation.portrait
                          ? 'Portrait'
                          : "Landscape"),
                      Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          Text('skdjfksjfkljasdkljf dsfk jksdjf kjsdkf jkfk ksdlfj klas'),
                          Text('skdjfksjfklj'),
                          Text('skdjfksjfkljasdkljf dsfk jksdjf kjsdkf jkfk ksdlfj klas'),
                          Text('skdjfksjfkljasdkljf dsfk jksdjf kjsdkf jkfk ksdlfj klas'),
                          Text('skdjfksjfkljasdkljf dsfk jksdjf kjsdkf jkfk ksdlfj klas'),
                          Text('skdjfksjfkljasd'),
                          Text('skdjfksjfkljasdkljf dsfk jksdjf kjsdkf jkfk ksdlfj klas'),
                        ],
                      )

                    ],
                  );
                },
              ),
            );
          }
        },
      ),

    );
  }
}

