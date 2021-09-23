import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_blog/controller/user_controller.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import 'form_data.dart' as data;



class join_page_fire extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final UserController u = Get.put(UserController());
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _email = TextEditingController();

  //var email = data.email();

  void addUser() async {
    CollectionReference users = firestore.collection('users');
    return users
        .add({
          'email': 'testtest',
          'username': 'testtest1',
          'password': 'pwtest'
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  void login() async {
    UserCredential credential = await auth.signInWithEmailAndPassword(
        email: '$validateEmail()', password: '$validatePassword()');
    print(credential.user!.email); //! 말고 다른 방법 찾기
  }

  void join() async {
    // 회원가입 로직
    // (1) 이메일과 패스워드는 Authentication에 저장
    // (2) 전화번호, 나이, 소속부대, 계급 -> Firestore

    // (1)
    UserCredential credential = await auth.createUserWithEmailAndPassword(
        email: _email.text.trim(), 
        password: _password.text.trim());
    // 파이어 스토어에도 같이 저장을 해줘야 한다. 그래야 유저 관리를 할 수 있다.
    print(credential.user!.email);

    // (2) 이 부분 완성
    // await addUser();

    print("회원가입 완료");
  }

  @override
  Widget build(BuildContext context) {
    //FirebaseAuth auth = FirebaseAuth.instance;
    join();
    addUser();
    return Scaffold(
      body: Center(
        child: Text("join_page_fire"),
      ),
    );
  }
}
