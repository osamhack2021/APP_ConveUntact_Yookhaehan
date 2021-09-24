//import 'package:flutter_blog/view/pages/user/join_page.dart' as globals;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_blog/controller/user_controller.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';


Future<bool> join(String username, String password, String email) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // (1) 이메일과 패스워드를 Authentication에 저장
  //firebase auth에 계정생성하기
  UserCredential credential = await auth.createUserWithEmailAndPassword(
      email: "$email", password: "$password");
  print(credential.user!.email);

  // (2) 전화번호, 나이, 소속부대, 계급 등을 Firestore
  //firestore에 계정생성하기

  CollectionReference users = firestore.collection('users');
  users
      .add({
        'email': "$email",
        'username': '$username',
      })
      .then((value) => print("User Added: $value"))
      .catchError((error) => print("Failed to add user: $error"));
  print("회원가입 완료");

  return true;
}
