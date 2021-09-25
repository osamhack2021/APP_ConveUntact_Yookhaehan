import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/domain/post/post_fun.dart';
import 'package:myapp/domain/user/auth.dart';
import 'package:myapp/util/validator_util.dart';
import 'package:myapp/view/components/custom_elevated_button.dart';
import 'package:myapp/view/components/custom_text_form_field.dart';
import 'package:myapp/view/components/custom_textarea.dart';

class UpdatePage extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  final id;
  final title;
  final content;

  //final String title = Get.arguments['title'];
  //final String content = Get.arguments['content'];
  //final String id = Get.arguments['id'];

  final TextEditingController _title = TextEditingController();
  final TextEditingController _content = TextEditingController();

  UpdatePage({required this.id, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    
    _title.text = title;
    _content.text = content;
    
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
                      text: "글 수정하기",
                      funpageRoute: () async {
                        if (_formKey.currentState!.validate()) {
                          bool pass = await update_post(id, _title.text, _content.text);
                          if(pass){// back이여서 stack 날려버리기만 하지만 상태관리 GetX라이브러리인 Obs를 써서 해결할 수 있다.??? -> 공부 -> streambuilder 이기때문에 상태관리 안해도됨.
                            print("글수정이 완료되었습니다.");
                            Get.back();
                          }
                          else{
                            Get.snackbar("글 수정하기 시도", "글수정에 실패하였습니다.");
                          }
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
