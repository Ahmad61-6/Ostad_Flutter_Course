import 'package:flutter/material.dart';
import 'package:ostadapp/todo.dart';
import 'add_new_todo.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> todoList = [];

  @override
  Widget build(BuildContext context) {
    addTodo(Todo todo){
      setState(() {
        todoList.add(todo as String);
      });
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(onPressed: (){}, icon: Icon(Icons.search),color: Colors.black,),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 35,
              child: Column(
                children: [
                  AddNewTodo(
                    addTodoOnTap: (Todo todo){
                      addTodo(todo);
                    },
                  ),
                  SizedBox(height: 5,),

                ],
              ),
            ),
            Expanded(
              flex: 65,
                child: ListView.separated(
                  itemCount: todoList.length,
                    itemBuilder: (context,index){
                 return ListTile(
                   tileColor: Colors.grey,
                   leading: CircleAvatar(
                     backgroundColor: Colors.red,
                   ),
                   trailing: IconButton(
                     icon: Icon(Icons.arrow_right_alt), onPressed: () {  },
                   ),
                   onLongPress: (){

                   },

                 );
                },
                  separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    height: 5,
                    color: Colors.white,
                  );
                },
                )
            )
          ],
        ),

      ),
    );

  }
}
