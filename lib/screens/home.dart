import 'package:exquisite/services/auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService _a = AuthService();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(onPressed: () {
        _a.logOut();
      }),
    );
  }
}
