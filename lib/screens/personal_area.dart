import 'package:exquisite/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:exquisite/screens/landing.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PersonalArea extends StatefulWidget {
  PersonalArea({Key key}) : super(key: key);

  @override
  _PersonalAreaState createState() => _PersonalAreaState();
}

class _PersonalAreaState extends State<PersonalArea> {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    var _userok = user.email;
      return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text('exquisite', style: GoogleFonts.shadowsIntoLight(fontSize: 30.0, color: Colors.black),),
            elevation: 0,
            leading: Icon(Icons.menu),
            actions: <Widget>[
              Padding(padding: EdgeInsets.only(right:20.0),
              child: Icon(
                Icons.search,
              ),
              ),
            ],
            ),
        body: SizedBox.expand(
          child: Container(
            margin: EdgeInsets.only(left:65, right: 65),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 20, bottom: 45),
                child: Text('Здравствуйте, \n $_userok', textAlign: TextAlign.center, style: TextStyle(fontSize: 24),),
              ),
              Text('Почта', textAlign: TextAlign.left, style: TextStyle(fontSize: 18),),
              SizedBox(height: 8),
              Text('$_userok', textAlign: TextAlign.left, style: TextStyle(fontSize: 18, color: Colors.black),),
              SizedBox(height: 15),
              Text('Номер телефона', textAlign: TextAlign.left, style: TextStyle(fontSize: 18),),
              SizedBox(height: 8),
              Text('+79033148657', textAlign: TextAlign.left, style: TextStyle(fontSize: 18, color: Colors.black),),
              SizedBox(height: 15),
              GestureDetector(
                child: Text("Сбросить пароль",
                  style: TextStyle(
                      fontSize: 14, color: Color(0xFF429BDB))),
          ),
                SizedBox(height: 100),
              Text('Ваш персональный код, для получения скидки в наших салонах', textAlign: TextAlign.center, style: TextStyle(fontSize: 18),),
              SizedBox(height: 25),
              Text('0002', textAlign: TextAlign.center, style: TextStyle(fontSize: 64, color: Colors.black),),
              SizedBox(height: 70),
              GestureDetector(
                child: Text("Выйти из учетной записи", textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14, color: Color(0xFF429BDB))),
              ),
        ],
        ),
              ),
        ),
        );
    }
  }
