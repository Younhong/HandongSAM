import 'package:flutter/material.dart';
import 'package:flutter_app/home.dart';
import 'package:flutter_app/login.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(userID: "", email: "", url: ""),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => SignInPage(),
      fullscreenDialog: true,
    );
  }
}