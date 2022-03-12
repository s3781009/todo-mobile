import 'package:flutter/material.dart';
import 'package:mobileapp/models/todo.dart';

class CompletedTodo extends StatefulWidget {
  Todo todo;
  CompletedTodo(this.todo, {Key? key}) : super(key: key);

  @override
  _CompletedTodoState createState() => _CompletedTodoState();
}

class _CompletedTodoState extends State<CompletedTodo> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Card(
                  child: Text(widget.todo.dateCreated),
                ),
                Text(widget.todo.text),
              ] ),
        ],
      ),
    );
  }
}
