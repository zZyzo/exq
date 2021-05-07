import "package:flutter/material.dart";
import 'package:exquisite/screens/auth.dart';

void main() => runApp(ExquisiteApp());

class ExquisiteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'gog',
      theme: ThemeData(
          primaryColor: Colors.white,
          textTheme: TextTheme(title: TextStyle(color: Colors.black))),
      home: AuthorizationPage(),
    );
    throw UnimplementedError();
  }
}
