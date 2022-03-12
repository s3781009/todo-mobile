import 'package:flutter/material.dart';
import 'package:mobileapp/models/todo.dart';
import 'package:mobileapp/providers/TodoListProvider.dart';
import 'package:mobileapp/providers/userProvider.dart';
import 'package:mobileapp/widgets/todoItem.dart';
import 'package:prompt_dialog/prompt_dialog.dart';
import 'package:provider/provider.dart';

class Todolist extends StatefulWidget {

   Todolist( {Key? key}) : super(key: key);

  @override
  _TodolistState createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {


  @override
  Widget build(BuildContext context) {

    final todoList = Provider.of<TodoListProvider>(context);
    final todos =todoList.todoList.toList();
    final user = Provider.of<UserProvider>(context).user;
     return todoList.isLoading ? CircularProgressIndicator(): Stack(
      children: [
        SingleChildScrollView(
          child: Column(
          children:  todos.map((e) => TodoItem(e)).toList()
      ),),
        Align(
          alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: ()=>todoList.getUserInput(context, user.id),
              child: const Icon(Icons.add))
        )
      ],

    );
  }
}
