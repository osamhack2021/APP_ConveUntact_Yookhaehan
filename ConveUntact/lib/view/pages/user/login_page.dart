import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:myapp/util/validator_util.dart';
import 'package:myapp/view/components/custom_elevated_button.dart';
import 'package:myapp/view/components/custom_text_form_field.dart';
import 'package:myapp/view/pages/post/home_page.dart';

import 'join_page.dart';

class LoginPage extends StatelessWidget {

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addUser() {
    CollectionReference users = firestore.collection('users');
    return users
        .add({
          'email': "test2@naver.com",
          'username': 'test2',
          'phone': '01012345678',
        })
        .then((value) => print("User Added: $value"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  void login() async {
    UserCredential credential = await auth.signInWithEmailAndPassword(
        email: "test@naver.com", password: "123456");
    print(credential.user!.email); //! 말고 다른 방법 찾기
  }

  void join() async {
    // 회원가입 로직
    // (1) 이메일과 패스워드는 Authentication에 저장
    // (2) 전화번호, 나이, 소속부대, 계급 -> Firestore

    // (1)
    UserCredential credential = await auth.createUserWithEmailAndPassword(
        email: "test2@naver.com", password: "123456");
    // 파이어 스토어에도 같이 저장을 해줘야 한다. 그래야 유저 관리를 할 수 있다.
    print(credential.user!.email);

    // (2) 이 부분 완성
    await addUser();

    print("회원가입 완료");
  }

  
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              height: 200,
              child: Text(
                "로그인 페이지",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _loginForm(),
          ],
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hint: "Username",
            funValidator: validateUsername(),
          ),
          CustomTextFormField(
            hint: "Password",
            funValidator: validatePassword(),
          ),
          CustomElevatedButton(
            text: "로그인",
            
            funpageRoute: () {
              if (_formKey.currentState!.validate()) {
                print("login 시작!!!!!!11");
                //로그인때 폼에 있는 데이터를 login()에 넘겨주어야 한다.
                login();
                print("login 완료!!!!!!11");
                Get.off(HomePage()); // off 써서 뒤로 못돌아오도록 한다.
              }
            },
          ),
          TextButton(
            onPressed: () {
              Get.to(JoinPage());
            },
            child: Text("아직 로그인이 안되어 있나요?"),
          ),
        ],
      ),
    );
  }
}
