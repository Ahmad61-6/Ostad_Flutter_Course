import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Photos',
      color: Colors.white,
      home: PhotoGallery(),

    );
  }
}

class PhotoGallery extends StatelessWidget {
  PhotoGallery({super.key});
  List<String>image=List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    image.add("https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500");
    image.add("https://images.pexels.com/photos/2899097/pexels-photo-2899097.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500");
    image.add("https://images.pexels.com/photos/2820884/pexels-photo-2820884.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500");
    image.add("https://images.pexels.com/photos/13043589/pexels-photo-13043589.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
    image.add("https://sky.shorthandstories.com/messi-perfect-ending/assets/ckU1G7EE5Y/ap22352771589324-3677x2451.jpg");
    image.add("https://fotos.perfil.com/2022/12/18/cropped/696/696/center/lionel-messi-argentina-world-cup-win-1475660.jpg");

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Photo Gallery')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text('Welcome to My Photo Gallery!', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),),
              const SizedBox(
                height: 10,
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Search for photos...',
                  border: OutlineInputBorder(gapPadding: 10),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              GridView.builder(
                padding: const EdgeInsets.all(15),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: image.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 25, mainAxisSpacing: 25),
                itemBuilder: (context,index){
                  return  GridTile(
                    footer: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(2),
                      child: Center(
                        child: Text('Photo $index',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 10),),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('GridView Image $index clicked.'),
                          ),
                        );
                      },
                      child: SizedBox(
                        height: 140,
                        child: Image.network(image[index],fit: BoxFit.cover,),

                      ),
                    ),


                  );
                },
                scrollDirection: Axis.vertical,
              ),
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(image[index+3]),

                    ),
                    title: Text('Photo ${index+1} '),
                    subtitle: Text('Description for Photo ${index+1}'),
                  );
                },
              ),

              const SizedBox(height: 12,),

              FloatingActionButton(
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Photos Uploaded Successfully!'),
                    ),
                  );
                },
                child: const Icon(Icons.upload_rounded, weight: 10),
              )

            ],
          ),

        ),
      ),

    );
  }
}