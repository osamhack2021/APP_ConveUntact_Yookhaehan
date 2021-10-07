import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/post_controller.dart';
import 'package:flutter_blog/controller/user_controller.dart';
import 'package:flutter_blog/view/pages/post/home_page.dart';
import 'package:flutter_blog/view/pages/post/update_page.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  final String? id;

  const DetailPage(this.id);

  @override
  Widget build(BuildContext context) {
    //String data = Get.arguments;
    UserController u = Get.find();
    PostController p = Get.find();
    print("로그인 유저아이디 : Obx${u.principal.value.uid}");
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            "게시글 아이디 : $id,\n로그인 상태 : ${u.isLogin}",
            style: TextStyle(fontSize: 12),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${p.post.value.title}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
              Divider(),
              u.principal.value.uid == p.post.value.user!.uid
                  ? Row(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            int result = await p.deleteById(p.post.value.id!);
                            result == 1
                                ? Get.off(() => HomePage())
                                : Get.snackbar("삭제실패", "다시 시도해 주세요");
                            //Get.back();
                          },
                          child: Text("삭제"),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            Get.to(() => UpdatePage());
                          },
                          child: Text("수정"),
                        ),
                      ],
                    )
                  : SizedBox(),
              Expanded(
                child: SingleChildScrollView(
                  child: Text("${p.post.value.content}"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}