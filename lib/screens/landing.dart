import 'package:exquisite/screens/authPage.dart';
import 'package:exquisite/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);

    final bool isLoggedIN = user != null;
    if(isLoggedIN == true && user.emailVerified == true){
      return HomePage();
    }
    else return AuthorizationPage();
  }
}
