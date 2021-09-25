
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {

  Future<void> singIn(String email, String password);
  Future<void> createUser(String email, String password);
  Future<void> signOut();

}

class Auth implements BaseAuth {
  
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String email = "";


  Future<void> singIn(String uemail, String password) async {
    UserCredential user = await _firebaseAuth.signInWithEmailAndPassword(email: uemail, password: password);
    email = uemail;
    return ;
  }

  Future<void> createUser(String email, String password) async {
    UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return ;
  }

  Future<void> signOut() async {
    email = "";
    return _firebaseAuth.signOut();
  }

}