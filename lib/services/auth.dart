import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';


class AuthService {
  FirebaseAuth _fAuth = FirebaseAuth.instance;
  final databaseReference = FirebaseDatabase.instance.reference();

  Future<User> register(String name, String email, String password) async {
    UserCredential userCredential = await _fAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .catchError((onError) {
          if(onError.hashCode == 265778269){
            Fluttertoast.showToast(msg: 'Слабый пароль');
            Fluttertoast.showToast(msg: 'Минимум 6 символов');
          }
          else Fluttertoast.showToast(msg: ' Проверте правильность \n введенных вами данных');
      print(onError);
    });
    User user = userCredential.user;
    if (user != null) {
      print("reg " + user.email);
      return user;
    }
    return null;
  }

  Future<User> signIn(String email, String password) async {
    UserCredential userCredential = await _fAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .catchError((onError) {
      Fluttertoast.showToast(msg: '          Не удаётся войти. Проверьте правильность введенных вами данных');
      print(onError);
    });
    User user = userCredential.user;
    if (user != null) {
      print("sign " + user.email);
      return user;
    }
    return null;
  }

  Future logOut() async {
    Fluttertoast.showToast(msg: 'Вы успешно вышли из своего аккаунта');
    print('logout ' + _fAuth.currentUser.email);
    await _fAuth.signOut();
  }

  Stream<User> get currentUser {
    return _fAuth.authStateChanges();
  }
}
