import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/util/validator_util.dart';
import 'package:myapp/view/components/custom_elevated_button.dart';
import 'package:myapp/view/components/custom_text_form_field.dart';
import 'package:myapp/view/components/custom_textarea.dart';
import 'home_page.dart';

class WritePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                    hint: "Title",
                    funValidator: validateTitle(),
                  ),
                  CustomTextArea(
                    hint: "content",
                    funValidator: validateContent(),
                  ),
                  CustomElevatedButton(
                    text: "글쓰기",
                    funpageRoute: () {
                      if (_formKey.currentState!.validate()) {
                        Get.off(HomePage()); // off 써서 뒤로 못돌아오도록 한다.
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
