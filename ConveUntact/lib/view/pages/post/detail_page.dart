import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/domain/user/auth.dart';
import 'package:myapp/view/pages/post/update_page.dart';

import 'home_page.dart';

class DetailPage extends StatelessWidget {
  final Auth auth;

  //(1)
  const DetailPage({required this.auth});

  //데이터를 받는 방법 1 : class constructor 받기
  //데이터를 받는 방법 2 : GetX의 arguments

  @override
  Widget build(BuildContext context) {
    //(2)
    String title = Get.arguments['title'];
    String content = Get.arguments['content'];
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$title",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
            Divider(),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.off(HomePage(auth:auth)); // 상태관리로 갱신 작업 추가 해줘야함.
                  },
                  child: Text("삭제"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(UpdatePage(auth:auth));
                  },
                  child: Text("수정"),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text("$content"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
