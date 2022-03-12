import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobileapp/models/todo.dart';
import 'package:mobileapp/providers/TodoListProvider.dart';
import 'package:mobileapp/providers/userProvider.dart';
import 'package:mobileapp/widgets/completedlist.dart';
import 'package:mobileapp/widgets/todolist.dart';
import 'package:mobileapp/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home( {Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(Provider.of<TodoListProvider>(context).isLoading) {
      Provider.of<TodoListProvider>(context).fetchItems(Provider
          .of<UserProvider>(context)
          .user
          .accessToken);
    }
  }
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: Drawer(
           child: ListView(
             padding: EdgeInsets.zero,
             children: const [
               DrawerHeader(
                 decoration: BoxDecoration(
                   color: Colors.blue,
                 ), child: Text("menu"),
                 
               )
             ],
           ), 
          ),
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            title: const Text("To dos"),
            centerTitle: true,
            actions: [

              Container(
                margin: const EdgeInsets.only(right: 10),
              child: CircleAvatar(
                backgroundImage: NetworkImage(user.picture),

              )
              ),
            ],
          ),
          body:  TabBarView(
            children: [
              Center(child: Todolist()),
              Center(child: CompletedList())

            ],
          ),
          bottomNavigationBar: Container(
            color: Colors.blue,
          child: const TabBar(

            tabs: [
              Tab(text: "To do", icon: Icon(Icons.book)),
              Tab(text: "Done ", icon: Icon(Icons.check))
            ],
          ),
          ),
        ));
  }
}
