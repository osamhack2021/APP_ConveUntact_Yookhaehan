import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addUser() {
    CollectionReference users = firestore.collection('users');
    return users
        .add({
          'email': "testtest@naver.com",
          'username': 'testtest',
          'phone': '0101234',
          'age': "250"
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  void login() async {
    UserCredential credential = await auth.signInWithEmailAndPassword(
        email: "tennis@naver.com", password: "123456");
    print(credential.user!.email); //! 말고 다른 방법 찾기
  }

  void join() async {
    // 회원가입 로직
    // (1) 이메일과 패스워드는 Authentication에 저장
    // (2) 전화번호, 나이, 소속부대, 계급 -> Firestore

    // (1)
    UserCredential credential = await auth.createUserWithEmailAndPassword(
        email: "tennis@naver.com", password: "123456");
    // 파이어 스토어에도 같이 저장을 해줘야 한다. 그래야 유저 관리를 할 수 있다.
    print(credential.user!.email);

    // (2) 이 부분 완성
    await addUser();

    print("회원가입 완료");
  }

  @override
  Widget build(BuildContext context) {
    //FirebaseAuth auth = FirebaseAuth.instance;
    login();
    join();
    return Scaffold(
      body: Center(
        child: Text("HomePage"),
      ),
    );
  }
}
