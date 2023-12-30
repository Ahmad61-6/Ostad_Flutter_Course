import 'package:flutter/material.dart';
import 'package:ostadapp/style.dart';
import 'package:ostadapp/todo.dart';


class AddNewTodo extends StatefulWidget {
  const AddNewTodo({super.key, required this.addTodoOnTap});

  final Function(Todo) addTodoOnTap;

  @override
  State<AddNewTodo> createState() => _AddNewTodoState();
}

class _AddNewTodoState extends State<AddNewTodo> {
  final TextEditingController todoTEController = TextEditingController();
  final TextEditingController todoTEController2 = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: TextFormField(
            controller: todoTEController,
            validator: (String? value){
              if(value?.isEmpty ?? true){
                return 'Enter a value';
              }
              else {
                return null;
              }
            },
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
            decoration: inputDecoration("Add Title"),
          ),
        ),
        SizedBox(height: 5,),
        Form(
          key: _formKey2,
          child: TextFormField(
            controller: todoTEController2,
            validator: (String? value){
              if(value?.isEmpty ?? true){
                return 'Enter a value';
              }
              else {
                return null;
              }
            },
            decoration: inputDecoration("Add Subtitle"),
          ),
        ),
        SizedBox(height: 5,),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              textStyle: TextStyle(fontWeight: FontWeight.bold)
          ),
          onPressed: (){
            if(_formKey.currentState!.validate()&&_formKey2.currentState!.validate()){
              Todo todo = Todo(title: todoTEController.text.trim(),
                  subTitle: todoTEController2.text.trim()
              );
              widget.addTodoOnTap(todo);
            }
          },
          child: Text('Add'),
        )
      ],
    );
  }
}
