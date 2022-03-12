/// -----------------------------------
///          External Packages
/// -----------------------------------

import 'package:flutter/material.dart';
import 'package:mobileapp/providers/TodoListProvider.dart';
import 'package:mobileapp/providers/userProvider.dart';
import 'package:provider/provider.dart';


import 'models/user.dart';
import 'screens/login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:[
      ChangeNotifierProvider(create:(context)=>UserProvider() ),
      ChangeNotifierProvider(create: (context)=>TodoListProvider())
    ],
    child: const MaterialApp(
      title: 'my app',
      home: Login(),
    )
    );
  }
}
