import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/user_controller.dart';

import 'package:flutter_blog/util/validator_util.dart';
import 'package:flutter_blog/view/components/custom_elevated_button.dart';
import 'package:flutter_blog/view/components/custom_text_form_field.dart';
import 'package:flutter_blog/view/pages/post/home_page.dart';
import 'package:get/get.dart';

import 'login_page.dart';

class JoinPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final UserController u = Get.put(UserController());

  final _username = TextEditingController();
  final _password = TextEditingController();
  final _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              height: 200,
              child: Text(
                "회원가입 페이지",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _joinForm(),
          ],
        ),
      ),
    );
  }

  Widget _joinForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hint: "Email",
            controller: _email,
            funValidator: validateEmail(),
          ),
          CustomTextFormField(
            hint: "Password",
            controller: _password,
            funValidator: validatePassword(),
          ),
          CustomTextFormField(
            hint: "Username",
            controller: _username,
            funValidator: validateUsername(),
          ),
          CustomElevatedButton(
            text: "회원가입",
            funPageRoute: () async {
              if (_formKey.currentState!.validate()) {
                int emailCheck = await u.checkEmail(_email.text.trim());
                if (emailCheck < 1) {
                  Get.snackbar("회원가입 실패", "이메일 중복");
                  return;
                }
                int usernameCheck =
                    await u.checkUsername(_username.text.trim());
                if (usernameCheck < 1) {
                  Get.snackbar("회원가입 실패", "유저네임 중복");
                  return;
                }
                int result = await u.join(
                  _email.text.trim(),
                  _password.text.trim(),
                  _username.text.trim(),
                );

                if (result == 1) {
                  Get.offAll(() => HomePage());
                } else {
                  Get.snackbar("회원가입 시도", "회원가입 실패");
                }
              }
            },
          ),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("로그인 페이지로 이동"),
          ),
        ],
      ),
    );
  }
}
