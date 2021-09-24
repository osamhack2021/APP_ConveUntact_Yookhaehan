import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/domain/user/auth.dart';
import 'package:myapp/util/validator_util.dart';
import 'package:myapp/view/components/custom_elevated_button.dart';
import 'package:myapp/view/components/custom_text_form_field.dart';
import 'package:myapp/view/pages/post/home_page.dart';

import 'join_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({required this.auth});

  final _formKey = GlobalKey<FormState>();
  final Auth auth;

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
            _loginForm(context),
          ],
        ),
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    final TextEditingController _email = TextEditingController();
    final TextEditingController _password = TextEditingController();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            //text controller -> 값 옮기는 작업중
            controller: _email,
            hint: "Email",
            funValidator: validateEmail(),
          ),
          CustomTextFormField(
            controller: _password,
            hint: "Password",
            funValidator: validatePassword(),
          ),
          CustomElevatedButton(
            text: "로그인",
            funpageRoute: () async {
              try {
                await auth.singIn(_email.text.trim(), _password.text.trim());
                print("계정 발견 ! 로그인 성공 !");
                Get.off(() => HomePage(auth: auth)); // off 써서 뒤로 못돌아오도록 한다.
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  Get.snackbar("로그인 시도", "계정이 존재하지 않습니다.");
                } else if (e.code == 'wrong-password') {
                  Get.snackbar("로그인 시도", "패스워드가 틀렸습니다.");
                } 
              }
            },
          ),
          TextButton(
            onPressed: () {
              Get.to(JoinPage(auth: auth));
            },
            child: Text("아직 로그인이 안되어 있나요?"),
          ),
        ],
      ),
    );
  }
}
