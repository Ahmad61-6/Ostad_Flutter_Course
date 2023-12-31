import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  final List<bool> _selected = List.generate(5, (i) => false);

  @override
  Widget build(BuildContext context) {
    int getSelectedItemCount() {
      return _selected.where((isSelected) => isSelected).length;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Selection Screen"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context){
            return AlertDialog(
              title: const Text("Selected items"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Number of selected items : ${getSelectedItemCount()}"),
                ],
              ),
              actions: <Widget>[
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text('Close'))
              ],
            );
          });
        },
        child: const Icon(Icons.check),
      ),
      body: ListView.separated(itemBuilder: (context,index){
        return ListTile(
            tileColor: _selected[index] ? Colors.blue : null,
          leading: Text('Item ${index+1}'),
          onTap: (){
            setState(() {
              _selected[index] = !_selected[index];
            });
          },
        );
      }, separatorBuilder: (BuildContext context, int index){
        return Divider(
          height: 5,
        );
      }, itemCount: 5),
    );
  }
}
