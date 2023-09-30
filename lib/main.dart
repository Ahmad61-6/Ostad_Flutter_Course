import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      builder: (context) {
        return MaterialApp(
          title: 'Assignment 08',
          home: HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var myItems = [
    {
      "img":
      "https://media.gettyimages.com/id/1451936359/photo/lionel-messi-of-argentina-lifts-the-fifa-world-cup-qatar-2022-winners-trophy-during-the-fifa.jpg?s=612x612&w=0&k=20&c=B0UM5Hko74IGwcC2qLq5dcsZhwfgGOVaWVJyfRLAOLA=",
    },
    {
      "img":
      "https://media.gettyimages.com/id/1451936359/photo/lionel-messi-of-argentina-lifts-the-fifa-world-cup-qatar-2022-winners-trophy-during-the-fifa.jpg?s=612x612&w=0&k=20&c=B0UM5Hko74IGwcC2qLq5dcsZhwfgGOVaWVJyfRLAOLA=",
    },
    {
      "img":
      "https://media.gettyimages.com/id/1451936359/photo/lionel-messi-of-argentina-lifts-the-fifa-world-cup-qatar-2022-winners-trophy-during-the-fifa.jpg?s=612x612&w=0&k=20&c=B0UM5Hko74IGwcC2qLq5dcsZhwfgGOVaWVJyfRLAOLA=",
    },
    {
      "img":
      "https://media.gettyimages.com/id/1451936359/photo/lionel-messi-of-argentina-lifts-the-fifa-world-cup-qatar-2022-winners-trophy-during-the-fifa.jpg?s=612x612&w=0&k=20&c=B0UM5Hko74IGwcC2qLq5dcsZhwfgGOVaWVJyfRLAOLA=",
    },
    {
      "img":
      "https://media.gettyimages.com/id/1451936359/photo/lionel-messi-of-argentina-lifts-the-fifa-world-cup-qatar-2022-winners-trophy-during-the-fifa.jpg?s=612x612&w=0&k=20&c=B0UM5Hko74IGwcC2qLq5dcsZhwfgGOVaWVJyfRLAOLA=",
    },
    {
      "img":
      "https://media.gettyimages.com/id/1451936359/photo/lionel-messi-of-argentina-lifts-the-fifa-world-cup-qatar-2022-winners-trophy-during-the-fifa.jpg?s=612x612&w=0&k=20&c=B0UM5Hko74IGwcC2qLq5dcsZhwfgGOVaWVJyfRLAOLA=",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Profile"),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          final isLandscape = orientation == Orientation.landscape;
          final crossAxisCount = isLandscape ? 3 : 3;

          return isLandscape
              ? Row(
            children: [
              Expanded(
                flex: 1,
                child: ClipOval(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    child: Image.network(
                        'https://media.gettyimages.com/id/1450131991/photo/lionel-messi-of-argentina-kisses-the-fifa-world-cup-qatar-2022-winners-trophy-after-the-fifa.jpg?s=612x612&w=0&k=20&c=wliZkz5XPFqvJqs5rqt9s2sNzsfRDxF-fHHFDyOQ-LE=',
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "Messi (G.O.A.T)",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                      child: Text(
                          'Lionel Messi has conquered his final peak. Lionel Messi has shaken hands with paradise. The little boy from Rosario, Santa Fe, has just pitched up in heaven.'),
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: 0.8,
                          childAspectRatio: isLandscape ? 1.1 : .8,
                        ),
                        itemCount: myItems.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              width: double.infinity,
                              height: isLandscape ? 100 : 150,
                              child: Image.network(
                                myItems[index]['img']!,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
              : Column(
            children: [
              ClipOval(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  child: Image.network(
                      'https://media.gettyimages.com/id/1450131991/photo/lionel-messi-of-argentina-kisses-the-fifa-world-cup-qatar-2022-winners-trophy-after-the-fifa.jpg?s=612x612&w=0&k=20&c=wliZkz5XPFqvJqs5rqt9s2sNzsfRDxF-fHHFDyOQ-LE=',
                      fit: BoxFit.cover),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Messi (The G.O.A.T)",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                child: Text(
                    'Lionel Messi has conquered his final peak. Lionel Messi has shaken hands with paradise. The little boy from Rosario, Santa Fe, has just pitched up in heaven.'),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 0.8,
                    childAspectRatio: isLandscape ? 0.9 : 1.1,
                  ),
                  itemCount: myItems.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        width: double.infinity,
                        height: isLandscape ? 100 : 150,
                        child: Image.network(
                          myItems[index]['img']!,
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}