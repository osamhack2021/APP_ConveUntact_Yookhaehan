import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> login() async {
    UserCredential credential = await auth.signInWithEmailAndPassword(
        email: "jiho@naver.com", password: "123456");
    print(credential.user!.email); //! 말고 다른 방법 찾기
  }

  @override
  Widget build(BuildContext context) {
    //FirebaseAuth auth = FirebaseAuth.instance;
    login();
    return Scaffold(
      body: Center(
        child: Text("HomePage"),
      ),
    );
  }
}

