import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/post_controller.dart';
import 'package:flutter_blog/controller/user_controller.dart';

import 'package:flutter_blog/size.dart';
import 'package:flutter_blog/view/pages/post/write_page.dart';
import 'package:flutter_blog/view/pages/user/login_page.dart';
import 'package:flutter_blog/view/pages/user/user_info.dart';

import 'package:get/get.dart';

import 'detail_page.dart';

class HomePage extends StatelessWidget {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  var scaffodKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // put 없으면 만들고, 있으면 찾기!!
    UserController u = Get.find();
    // 객체 생성(create) onInit 함수실행(initialize)
    PostController p = Get.put(PostController());

    //p.findAll();

    return Scaffold(
      key: scaffodKey,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (scaffodKey.currentState!.isDrawerOpen) {
            scaffodKey.currentState!.openEndDrawer();
          } else {
            scaffodKey.currentState!.openDrawer();
          }
        },
        child: Icon(Icons.code),
      ),
      drawer: _navigation(context),
      appBar: AppBar(
        title: Text("${u.isLogin}"),
      ),
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: () async {
          await p.findAll();
        },
        child: Obx(
          () => ListView.separated(
            itemCount: p.posts.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  /*
                  obs 상태관리 되는데 왜 onRefresh를 두는 거지?? 그냥 두는 건가?
                  1) obs 상태관리가 된다면 - 굳이 findbyid로 해당 객체를 찾아 id값을 넘겨주지 않고 바로 Get.to(() => DetailPage(p.posts[index].id)); 만으로도 기능 구현이 가능하잖아
                  2) 만약 onRefresh로 밖에 안된다면 - onRefresh 안되었을때를 대비하여 findbyid를 한번 더 해주는 건가? 만약 삭제되었을 수도 있는데 왜 null! 라고 해둔거지?
                  답 : .obs로 obs변수 지정해놓고 Obx(()=>)에 두면 자동으로 갱신이 된다! 따라서 일단 2)는 거짓 -> 굳이 findbyid해둔 이유는 ???
                  */
                  p.findById(p.posts[index].id!); // post() 객체를 리턴받음. p.post => id로 찾은 post 객체임
                  //p.post = p.posts[index];
                  Get.to(() => DetailPage(p.posts[index].id));
                },
                child: ListTile(
                  leading: Text("${p.posts[index].id}"),
                  title: Text("${p.posts[index].title}"),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
          ),
        ),
      ),
    );
  }

  Widget _navigation(BuildContext context) {
    UserController u = Get.find();

    return Container(
      width: getDrawerWidth(context),
      height: double.infinity,
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  Get.to(() => WritePage());
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
                  //Navigator.pop(context);
                  scaffodKey.currentState!.openEndDrawer();
                  Get.to(() => UserInfo());
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
                  u.logout();
                  Get.offAll(LoginPage());
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
