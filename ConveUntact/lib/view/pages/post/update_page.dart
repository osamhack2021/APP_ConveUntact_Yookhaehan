import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/util/validator_util.dart';
import 'package:myapp/view/components/custom_elevated_button.dart';
import 'package:myapp/view/components/custom_text_form_field.dart';
import 'package:myapp/view/components/custom_textarea.dart';

class UpdatePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Expanded(
                child: ListView(
                  children: [
                    CustomTextFormField(
                      hint: "Title",
                      funValidator: validateTitle(),
                      value: "제목1" * 2,
                    ),
                    CustomTextArea(
                      hint: "content",
                      funValidator: validateContent(),
                      value: "내용1" * 20,
                    ),
                    CustomElevatedButton(
                      text: "글 수정하기",
                      funpageRoute: () {
                        if (_formKey.currentState!.validate()) {
                          Get.back(); // back이여서 stack 날려버리기만 하지만 상태관리 GetX라이브러리인 Obs를 써서 해결할 수 있다.
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
