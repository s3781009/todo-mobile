import 'package:flutter/material.dart';
import 'package:mobileapp/models/todo.dart';
import 'package:mobileapp/providers/TodoListProvider.dart';
import 'package:mobileapp/providers/userProvider.dart';
import 'package:provider/provider.dart';

class TodoItem extends StatefulWidget {
  Todo todo;
   TodoItem(this.todo, {Key? key}) : super(key: key);

  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {

  @override

  Widget build(BuildContext context) {
    final todoList = Provider.of<TodoListProvider>(context);
    final user = Provider.of<UserProvider>(context).user;
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
          Column(
           children:[
         ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
             onPressed: ()=>todoList.deleteTodo(widget.todo),
             child: const Icon(Icons.cancel),),
         ElevatedButton(
             onPressed: ()=>todoList.completeTodo(widget.todo),
             child: const Icon(Icons.check))
         ])
       ],
     ),
    );
  }
}
