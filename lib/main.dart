import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

void main(){
runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Responsive Grid"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              xl: 3, lg: 3, md: 4, sm: 12,
                xs: 12,
                child: Container(
                  height: 100,
                  color: Colors.black,
                )
            ),
            ResponsiveGridCol(
              xl: 3, lg: 3, md: 4, sm: 12,
                xs: 12,
                child: Container(
                  height: 100,
                  color: Colors.green,
                )
            ),
            ResponsiveGridCol(
              xl: 3, lg: 3, md: 4, sm: 12,
                xs: 12,
                child: Container(
                  height: 100,
                  color: Colors.red,
                )
            ),ResponsiveGridCol(
              xl: 3, lg: 3, md: 4, sm: 12,
                xs: 12,
                child: Container(
                  height: 100,
                  color: Colors.yellow,
                )
            ),ResponsiveGridCol(
              xl: 3, lg: 3, md: 4, sm: 12,
                xs: 12,
                child: Container(
                  height: 100,
                  color: Colors.purple,
                )
            ),
            ResponsiveGridCol(
              xl: 3, lg: 3, md: 4, sm: 12,
                xs: 12,
                child: Container(
                  height: 100,
                  color: Colors.blueAccent,
                )
            ),
            ResponsiveGridCol(
              xl: 3, lg: 3, md: 4, sm: 12,
                xs: 12,
                child: Container(
                  height: 100,
                  color: Colors.grey,
                )
            ),

          ],
        ),
      ),
    );
  }
}

