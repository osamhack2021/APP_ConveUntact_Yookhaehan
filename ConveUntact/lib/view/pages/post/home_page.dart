import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/size.dart';
import 'package:myapp/view/pages/post/detail_page.dart';
import 'package:myapp/view/pages/post/write_page.dart';
import 'package:myapp/view/pages/user/login_page.dart';
import 'package:myapp/view/pages/user/user_info.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _navigation(context),
      appBar: AppBar(),
      body: ListView.separated(
          itemCount: 20, // firestore에서는 collection size만큼 만들듯
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Get.to(DetailPage(id:index), arguments: "데이터");
              },
              title: Text("제목$index"),
              leading: Text("$index"),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          }),
    );
  }

  Widget _navigation(BuildContext context) {
    return Container(
      width: getDrawerWidth(context),
      height: double.infinity,
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  Get.to(WritePage());
                },
                child: Text(
                  "글쓰기",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  Get.to(UserInfo());
                },
                child: Text(
                  "회원정보보기",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  Get.off(LoginPage());
                },
                child: Text(
                  "로그아웃",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
/*

final RxBool isLogin = false.obs; // UI가 관찰 가능한 변수 (변경되면 UI가 자동으로 업데이트 한다.)
title : Obx(() => Text("$isLogin"))
*/