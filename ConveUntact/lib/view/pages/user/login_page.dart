import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
