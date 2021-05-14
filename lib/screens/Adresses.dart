import 'package:exquisite/consts/consts.dart';
import 'package:exquisite/screens/authPage.dart';
import 'package:exquisite/main.dart';
import 'package:exquisite/screens/authPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Adresses extends StatefulWidget {
  Adresses({Key key}) : super(key: key);

  @override
  _AdressesState createState() => _AdressesState();
}

class _AdressesState extends State<Adresses> {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('exquisite', style: GoogleFonts.shadowsIntoLight(
              fontSize: 30.0, color: Colors.black),),
          elevation: 0,
          leading: Icon(Icons.menu),
          actions: <Widget>[
            Padding(padding: EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.search,
              ),
            ),
          ],
        ),

      body: Container(
        width: MediaQuery.of(context).size.width * 0.88,
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.12, top:  MediaQuery.of(context).size.height * 0.05),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          color: uLightBlue,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                title: Text('Адрес', style: TextStyle(fontSize: 16, color: Color(0xFF787878)),),
                subtitle: Padding(padding: EdgeInsets.only(top: 5), child: Text('Каюма Насыри, 44', style: TextStyle(fontSize: 20, color: Colors.black), ),
                ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 15),
                  child: Chip(
                    backgroundColor: Color(0xFFFFFFFF),
                    avatar: Icon (
                      Icons.directions_subway,
                  ),
                    label: Text('Площадь Тукая', style: TextStyle(fontSize:16, color: Color(0xFF787878)),),
                  ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5),
                    child: Chip(
                      backgroundColor: Color(0xFFFFFFFF),
                      avatar: Icon (
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      label: Text('4,3', style: TextStyle(fontSize:16, color: Color(0xFF787878)),),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
/*        decoration: new BoxDecoration(
          boxShadow: [
            new BoxShadow(
              color: Colors.black,
              blurRadius: 20.0,
            ),
          ],
        ),*/
      ),
      backgroundColor: Colors.white,
    );
  }
}
