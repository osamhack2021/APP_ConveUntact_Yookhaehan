import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:myapp/domain/user/login_and_join_fireauth.dart';
import 'package:myapp/util/validator_util.dart';
import 'package:myapp/view/components/custom_elevated_button.dart';
import 'package:myapp/view/components/custom_text_form_field.dart';
import 'package:myapp/view/pages/post/home_page.dart';

import 'join_page.dart';

class LoginPage extends StatelessWidget {
  
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
            funValidator: validateUsername(),
          ),
          CustomTextFormField(
            controller: _password,
            hint: "Password",
            funValidator: validatePassword(),
          ),
          CustomElevatedButton(
            text: "로그인",
            
            funpageRoute: () async {
              if (_formKey.currentState!.validate()) {
                print("login 시작!!!!!!11");
                //로그인때 폼에 있는 데이터를 login()에 넘겨주어야 한다. -> how can i do???
                await login(_email.text.trim(), _password.text.trim());
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
