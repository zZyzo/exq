import 'package:exquisite/consts/consts.dart';
import 'package:exquisite/main.dart';
import 'package:exquisite/services/auth.dart';
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
    TextEditingController textController = TextEditingController();
    String pname = currentName(context);
    String pemail = currentEmail(context);
    AuthService _a = AuthService();
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Container(
          margin: EdgeInsets.only(left:65, right: 65),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 20, bottom: 45),
                child: Text('Здравствуйте, \n $pname', textAlign: TextAlign.center, style: TextStyle(fontSize: 24),),
              ),
              Text('Почта', textAlign: TextAlign.left, style: TextStyle(fontSize: 18),),
              SizedBox(height: 8),
              Text('$pemail', textAlign: TextAlign.left, style: TextStyle(fontSize: 18, color: Colors.black),),
              SizedBox(height: 15),
              Text('Номер телефона', textAlign: TextAlign.left, style: TextStyle(fontSize: 18),),
              //SizedBox(height: 0),
              TextField(
                keyboardType: TextInputType.phone,
                focusNode: FocusNode(),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  hintText: 'Введите номер телефона',
                ),
                controller: textController,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              //Text('+79033148657', textAlign: TextAlign.left, style: TextStyle(fontSize: 18, color: Colors.black),),
              SizedBox(height: 15),
              GestureDetector(
                child: Text("Сбросить пароль",
                    style: TextStyle(
                        fontSize: 14, color: uBlue)),

              ),
              SizedBox(height: 100),
              Text('Ваш персональный код, для получения скидки в наших салонах', textAlign: TextAlign.center, style:
                TextStyle(fontSize: 14, color: Color.fromRGBO(148, 148, 148, 1)),
              ),
              SizedBox(height: 15),
              Text('1337', textAlign: TextAlign.center, style: TextStyle(fontSize: 64, color: Colors.black),),
              SizedBox(height: 70),
              GestureDetector(
                child: Text("Выйти из учетной записи", textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14, color: uBlue)),
                onTap: (){
                  setState(() {
                    _a.logOut();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
