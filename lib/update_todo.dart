import 'package:flutter/material.dart';
import 'package:ostadapp/style.dart';
import 'package:ostadapp/todo.dart';

class UpdateTodo extends StatefulWidget {
  const UpdateTodo({super.key, required this.todo, required this.onUpdateTap});

  final Todo todo;
 final Function(String,String) onUpdateTap;

  @override
  State<UpdateTodo> createState() => _UpdateTodoState();
}

class _UpdateTodoState extends State<UpdateTodo> {
  late TextEditingController todoTEController1 = TextEditingController(text: widget.todo.title);
  late TextEditingController todoTEController2 = TextEditingController(text: widget.todo.subTitle);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: TextFormField(
              controller: todoTEController1,
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
                Todo todo = Todo(title: todoTEController1.text.trim(),
                    subTitle: todoTEController2.text.trim()
                );
                widget.onUpdateTap(todoTEController1.text.trim(),todoTEController2.text.trim());
                Navigator.pop(context);
              }
            },
            child: Text('Edit Done'),
          )
        ],
      ),
    );
  }
}
