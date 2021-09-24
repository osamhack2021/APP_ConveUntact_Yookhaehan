import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/domain/user/add_user.dart';
import 'package:myapp/domain/user/auth.dart';
import 'package:myapp/util/validator_util.dart';
import 'package:myapp/view/components/custom_elevated_button.dart';
import 'package:myapp/view/components/custom_text_form_field.dart';

import 'login_page.dart';

class JoinPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final Auth auth;

  JoinPage({required this.auth});
  
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
    final TextEditingController _username = TextEditingController();
    final TextEditingController _password = TextEditingController();
    final TextEditingController _email = TextEditingController();
    final TextEditingController _phone = TextEditingController();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: _username,
            hint: "Username",
            funValidator: validateUsername(),
          ),
          CustomTextFormField(
            controller: _password,
            hint: "Password",
            funValidator: validatePassword(),
          ),
          CustomTextFormField(
            controller: _email,
            hint: "Email",
            funValidator: validateEmail(),
          ),
          CustomTextFormField(
            controller: _phone,
            hint: "Phone",
            funValidator: validatePhone(),
          ),
          CustomElevatedButton(
            text: "회원가입",
            funpageRoute: () async {
              //여기서 firebase_auth - 회원 추가 완료될떄까지 기다리게 하는 것을 해야 하는데
              // 어떻게 하지?
              if (_formKey.currentState!.validate()) {
                 
                 await join(
                  _username.text.trim(),
                  _password.text.trim(),
                  _email.text.trim(),
                  _phone.text.trim(),
                );
                Get.off(LoginPage(auth: auth)); // off 써서 뒤로 못돌아오도록 한다.
              }
            },
          ),
          TextButton(
            onPressed: () {
              Get.to(LoginPage(auth: auth));
            },
            child: Text("로그인 페이지로 이동"),
          ),
        ],
      ),
    );
  }
}
