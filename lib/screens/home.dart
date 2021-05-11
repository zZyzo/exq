
import 'package:exquisite/services/auth.dart';
import 'package:exquisite/services/database.dart';
import 'package:exquisite/consts/consts.dart';
import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatabaseService _databaseService = DatabaseService();
  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
          child: RaisedButton(
            onPressed: (){
              setState(() {
                _authService.logOut();
              });
            },
            child: Text(
                currentName(context),

            ),
          )
      ),
    );
  }
}
