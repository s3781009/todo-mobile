import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:mobileapp/models/user.dart';

import '../screens/home.dart';

class UserProvider with ChangeNotifier{
  final User _user = User(
    id: '',
      name: '',
      picture: '',
      accessToken: '',
      isLoggedIn: false,
      email: '');

  User get user=> _user;

  Future<void> login() async {

    const AUTH0_DOMAIN = 'dev-aji86obv.us.auth0.com';
    const AUTH0_CLIENT_ID = 'PhNWlZqAGsZxyowVfX42oRaCS94EkbUr';
    const AUTH0_REDIRECT_URI = 'com.auth0.mobileapp://login-callback';
    const AUTH0_ISSUER = 'https://$AUTH0_DOMAIN';
    final FlutterAppAuth appAuth = FlutterAppAuth();

    try {
      AuthorizationTokenResponse? result =
      await appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(AUTH0_CLIENT_ID, AUTH0_REDIRECT_URI,
            issuer: 'https://$AUTH0_DOMAIN',
            scopes: [
              'openid',
              'profile',
              'email'
            ],
            additionalParameters: {
              'audience': 'http://api/items'
            } //apit/items is the ONLY AUDIENCE FOR BOTH DEV AND PROD !!!!!!!!
        ),
      );
      final idToken = parseIdToken(result?.idToken);
        _user.id = idToken['sub'];
        _user.isLoggedIn = true;
        _user.name = idToken['name'];
        _user.picture = idToken['picture'];
        _user.email = idToken['email'];
        _user.accessToken = result!.accessToken!;
        notifyListeners();
      //print(profile);

    } catch (e, s) {
      print('login error: $e - stack: $s');
    }
  }

  Map<String, dynamic> parseIdToken(String? idToken) {
    final parts = idToken?.split(r'.');
    assert(parts?.length == 3);

    return jsonDecode(
        utf8.decode(base64Url.decode(base64Url.normalize(parts![1]))));
  }



}