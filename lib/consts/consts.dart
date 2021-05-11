import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

const Color uBlue = Color(0xFF429BDB);
const String cName = 'exquisite';

String currentEmail(context){
  return  Provider.of<User>(context).email;
}
String currentName(context){
  return  Provider.of<User>(context).displayName;
}
