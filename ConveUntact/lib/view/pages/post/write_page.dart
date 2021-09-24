import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/domain/post/post_fun.dart';
import 'package:myapp/domain/user/auth.dart';
import 'package:myapp/util/validator_util.dart';
import 'package:myapp/view/components/custom_elevated_button.dart';
import 'package:myapp/view/components/custom_text_form_field.dart';
import 'package:myapp/view/components/custom_textarea.dart';
import 'home_page.dart';

class WritePage extends StatelessWidget {
  //로그아웃하고 다시 home화면으로 들어올때 class instance가 다시 빌드되기 때문에 final로 해도 문제 없는건가? 다른 계정으로 접속해도?
  final _formKey = GlobalKey<FormState>();
  final Auth auth;
  WritePage({required this.auth});

  final TextEditingController _title = TextEditingController();
  final TextEditingController _content = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    print("글쓰기 페이지 입니다.! 작성자는 : ${auth.email}입니다.");
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: _title,
                    hint: "Title",
                    funValidator: validateTitle(),
                  ),
                  CustomTextArea(
                    controller: _content,
                    hint: "content",
                    funValidator: validateContent(),
                  ),
                  CustomElevatedButton(
                    text: "글쓰기",
                    funpageRoute: () async{
                      if (_formKey.currentState!.validate()) {
                        bool pass = await add_post(auth.email, _title.text, _content.text);
                        if(pass)
                          Get.off(HomePage(auth:auth)); // off 써서 뒤로 못돌아오도록 한다.
                        else
                          Get.snackbar("글쓰기 시도", "글쓰기에 실패하였습니다.");
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
