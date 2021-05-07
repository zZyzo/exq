import 'package:exquisite/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthorizationPage extends StatefulWidget {
  AuthorizationPage({Key key}) : super(key: key);

  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  String _email;
  String _password;

  bool _isLogin = true;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return Padding(
        padding: EdgeInsets.only(top: 120),
        child: Container(
          child: Align(
            child: Text(
              'exquisite',
              style: GoogleFonts.shadowsIntoLight(
                  fontSize: 72.0, color: Colors.black),
            ),
          ),
        ),
      );
    }

    Widget _input(Icon icon, String hint, TextEditingController controller,
        bool obscure) {
      return Container(
        padding: EdgeInsets.only(left: 60, right: 60),
        child: TextField(
          controller: controller,
          obscureText: obscure,
          style: TextStyle(fontSize: 20, color: Colors.grey),
          decoration: InputDecoration(
            enabledBorder: new OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE7EBEE)),
              borderRadius: const BorderRadius.all(
                const Radius.circular(50.0),
              ),
            ),
            hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.grey,
                letterSpacing: 1),
            hintText: hint,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF429BDB), width: 1),
              borderRadius: const BorderRadius.all(
                const Radius.circular(50.0),
              ),
            ),
          ),
        ),
      );
    }

    Widget _button(String text, void func()) {
      return RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),

        ///splashColor: uBlue,
        //highlightColor: uBlue,

        color: uBlue,
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
              fontSize: 20),
        ),
        onPressed: () {
          func();
        },
        elevation: 5,
      );
    }

    Widget _form(String label, void func()) {
      return Container(
        child: Column(
          children: <Widget>[
            if (!_isLogin)
              Padding(
                  padding: EdgeInsets.only(bottom: 10.0, top: 40.0),
                  child: _input(
                      Icon(Icons.email), 'Имя', _emailController, false)),
            Padding(
                padding:
                    EdgeInsets.only(bottom: 10.0, top: _isLogin ? 40.0 : 0),
                child: _input(
                    Icon(Icons.email), 'Email', _emailController, false)),
            Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: _input(
                    Icon(Icons.lock), 'Пароль', _passwordController, true)),
            SizedBox(height: 15.0),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Container(
                height: 70,
                width: 210,
                child: _button(label, func),
              ),
            )
          ],
        ),
      );
    }

    void _buttonAction() {
      _email = _emailController.text;
      _password = _passwordController.text;

      _emailController.clear();
      _passwordController.clear();
    }

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: <Widget>[
            _logo(),
            _isLogin
                ? Column(
                    children: <Widget>[
                      _form('Войти', _buttonAction),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: GestureDetector(
                          child: Text("Нет аккаунта? Регистрация",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF429BDB))),
                          onTap: () {
                            setState(() {
                              _isLogin = false;
                            });
                          },
                        ),
                      )
                    ],
                  )
                : Column(
                    children: <Widget>[
                      _form('Регистрация', _buttonAction),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: GestureDetector(
                          child: Text("Уже есть аккаунт? Войти",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF429BDB))),
                          onTap: () {
                            setState(() {
                              _isLogin = true;
                            });
                          },
                        ),
                      )
                    ],
                  )
          ],
        ));
    throw UnimplementedError();
  }
}
