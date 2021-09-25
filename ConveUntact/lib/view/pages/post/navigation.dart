import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/domain/user/auth.dart';
import 'package:myapp/size.dart';
import 'package:myapp/view/pages/post/write_page.dart';
import 'package:myapp/view/pages/user/login_page.dart';
import 'package:myapp/view/pages/user/user_info.dart';

class navigation extends StatelessWidget {
  final Auth auth;
  
  const navigation({required this.auth});

  @override
  Widget build(BuildContext context) {
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
                  Get.to(WritePage(auth: auth));
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
                  Get.to(() => UserInfoPage());
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
                onPressed: () async {
                  await auth.signOut();
                  Get.off(LoginPage(auth: auth));
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