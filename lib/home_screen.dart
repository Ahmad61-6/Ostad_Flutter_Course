import 'package:flutter/material.dart';
import 'package:ostadapp/todo.dart';
import 'package:ostadapp/update_todo.dart';
import 'add_new_todo.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> todoList = [];

  @override
  Widget build(BuildContext context) {
    addTodo(Todo todo){
      setState(() {
        todoList.add(todo);
      });
    }

    deleteTodo(int index){
      setState(() {
        todoList.removeAt(index);
      });
    }

    updateTodo(int index, String currentTitle, String currentSubTitle){
      setState(() {
        todoList[index].title=currentTitle;
        todoList[index].subTitle=currentSubTitle;
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
                  final  Todo todo = todoList[index];
                 return ListTile(
                   tileColor: Colors.grey,
                   leading: CircleAvatar(
                     backgroundColor: Colors.red,
                   ),
                   title: Text(todo.title),
                   subtitle: Text(todo.subTitle),
                   trailing: IconButton(
                     icon: Icon(Icons.arrow_right_alt), onPressed: () {  },
                   ),
                   onLongPress: (){
                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        title: Text(
                          'Alert',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0))),
                        actions: <Widget>[
                          TextButton(
                              child: Text('Edit'),
                              onPressed: () {
                                Navigator.pop(context);
                               showModalBottomSheet(context: context, builder: (context){
                                 return UpdateTodo(
                                  onUpdateTap: (String currentTile,String currentSubTitle){
                                    updateTodo(index, currentTile,currentSubTitle);
                                  }, todo: todo,
                                 );
                               });
                              }),
                          SizedBox(width: 123,),
                          TextButton(
                              child: Text('Delete'),
                              onPressed: () {
                                deleteTodo(index);
                                Navigator.of(context).pop();
                              })
                        ],
                      );
                    });
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
