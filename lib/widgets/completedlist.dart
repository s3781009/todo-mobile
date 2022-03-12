import 'package:flutter/material.dart';
import 'package:mobileapp/providers/TodoListProvider.dart';
import 'package:mobileapp/widgets/completedTodo.dart';
import 'package:provider/provider.dart';

class CompletedList extends StatefulWidget {

  CompletedList( {Key? key}) : super(key: key);

  @override
  _CompletedListState createState() => _CompletedListState();
}

class _CompletedListState extends State<CompletedList> {


  @override
  Widget build(BuildContext context) {
    final completedTodoList = Provider.of<TodoListProvider>(context).completedList;
    return  Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: completedTodoList.map((todo) => CompletedTodo(todo)).toList(),
          ),),

      ],

    );
  }
}
