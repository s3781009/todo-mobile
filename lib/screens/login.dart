import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mobileapp/models/user.dart';
import 'package:mobileapp/providers/userProvider.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class Login extends StatefulWidget {
  const Login();
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isBusy = false;
  bool isLoggedIn = false;
  String? errorMessage;
  late String name;
  late String picture;
  late User user;
  late String email;
  late String jwt;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: [
        Container(
          constraints: const BoxConstraints.expand(),
          child: Image.asset('assets/images/background.jpg'),
        ),
        Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Align(
                  child: Text(
                    "a simple to do app",
                  ),
                  alignment: Alignment.centerLeft,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 40),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(360, 60),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20)
                        )
                      )
                    ),
                    onPressed: () => {
                      Provider.of<UserProvider>(
                        context,
                        listen: false).login(),
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
                           =>Home()))},
                    child: const Text("Get Started"),
                  ),
                )
              ]),
        )
      ]),
    );
  }
}
