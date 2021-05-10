import 'package:exquisite/screens/landing.dart';
import 'package:exquisite/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ExquisiteApp());
}

class ExquisiteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: StreamProvider<User>.value(
        value: AuthService().currentUser,
        initialData: null,
        child: MaterialApp(
          title: 'exquisite',
          theme: ThemeData(
              primaryColor: Colors.white,
              textTheme: TextTheme(title: TextStyle(color: Colors.black))),
          home: LandingPage(),
        ),
      ),
    );
    throw UnimplementedError();
  }
}
