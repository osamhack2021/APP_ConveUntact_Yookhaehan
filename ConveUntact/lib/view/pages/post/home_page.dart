import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/size.dart';
import 'package:myapp/view/pages/post/detail_page.dart';
import 'package:myapp/view/pages/post/write_page.dart';
import 'package:myapp/view/pages/user/login_page.dart';

import 'navigation.dart';


class HomePage extends StatefulWidget { // StatefulWidget에서 createState는 뭐지? 알아보자/
  final email;

  const HomePage({this.email});

  @override
    _HomePageState createState() => _HomePageState(email: email);
}

class _HomePageState extends State<HomePage> {
  final email;

  _HomePageState({this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navigation(email: email), //context???? BuildContext에 대해서 알아보자!
      appBar: AppBar(),
      body: ListView.separated(
          itemCount: 20, // firestore에서는 collection size만큼 만들듯
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Get.to(DetailPage(id: index), arguments: "데이터"); // 이때 도규멘트 id 값을 넘기면 될듯 !
              },
              title: Text("제목$index"),
              leading: Text("[$index] : $email의 글입니다."),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          }),
    );
  }
}

  

  
/*

final RxBool isLogin = false.obs; // UI가 관찰 가능한 변수 (변경되면 UI가 자동으로 업데이트 한다.)
title : Obx(() => Text("$isLogin"))]

*/