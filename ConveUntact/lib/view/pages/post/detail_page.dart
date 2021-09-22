import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/view/pages/post/update_page.dart';

import 'home_page.dart';

class DetailPage extends StatelessWidget {
  final int id;

  const DetailPage({required this.id});

  //데이터를 받는 방법 1 : class constructor 받기

  @override
  Widget build(BuildContext context) {
    //데이터를 받는 방법 2 : GetX의 arguments
    String data = Get.arguments;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "article Title",
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
                    Get.off(HomePage()); // 상태관리로 갱신 작업 추가 해줘야함.
                  },
                  child: Text("삭제"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(UpdatePage());
                  },
                  child: Text("수정"),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text("글내용!!" * 500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
