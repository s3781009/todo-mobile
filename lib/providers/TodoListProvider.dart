import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:prompt_dialog/prompt_dialog.dart';
import 'package:http/http.dart' as http;
import '../models/todo.dart';

class TodoListProvider with ChangeNotifier{
  List<Todo>_completedTodoList =  [];
  List<Todo> _todoList =[];
  String _input='';
  bool _isLoading=true;

  bool get isLoading => _isLoading;
  List<Todo> get completedList=> _completedTodoList;
  List<Todo> get todoList => _todoList;


  getUserInput( BuildContext context, String userId)async{
    _input =(await prompt(
      context,
      title:const Text("add something"),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    ))!;
    addTodo(userId);
    notifyListeners();
  }
  fetchItems(String accessToken) async {
    final response = await http.get(
        Uri.parse('https://go-todo-server.herokuapp.com/api/items'),
        headers: {'Authorization': accessToken}
    );
    if (response.statusCode == 200) {
      List<Todo> todos = [];
      var todosJson = jsonDecode(response.body);
      for (var todoJson in todosJson) {
        todos.add(Todo.fromJson(todoJson));
      }
      _isLoading = false;
      _todoList = todos.where((element) => element.isCompleted == false).toList();
      _completedTodoList =
          todos.where((element) => element.isCompleted == true).toList();
    } else {
      throw Exception('Cannot get items');
    }
    notifyListeners();
  }
  addTodo(String userId){
    var  newTodo = Todo(
        DateTime.now().toString(),
        _input,
        DateTime.now().toString() + userId,
        false,
        userId);
    _todoList.add(newTodo);
  }
  deleteTodo(Todo todo){
   _todoList = _todoList.where((element) => element != todo).toList();
  notifyListeners();
  }
  completeTodo(Todo todo){
     _completedTodoList.add(todo);
        deleteTodo(todo);
  }

}