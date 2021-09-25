import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/domain/user/auth.dart';
import 'package:myapp/view/pages/post/detail_page.dart';

import 'navigation.dart';

class HomePage extends StatefulWidget {
  // StatefulWidget에서 createState는 뭐지? 알아보자/
  final Auth auth;

  const HomePage({required this.auth});

  @override
  _HomePageState createState() => _HomePageState(email: auth.email);
}

class _HomePageState extends State<HomePage> {
  final String email;

  _HomePageState({required this.email});

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _postStream = FirebaseFirestore.instance
        .collection('posts')
        .where("email", isEqualTo: "$email")
        .snapshots();
    // widget.auth.email이 안됨. Homepage class에 선언한 auth에 어떻게 접근하지????
    // ->  HomePage에서 constructor로 넘겨 해결

    return Scaffold(
      drawer: navigation(auth: widget.auth), // 근데 얘는 왜 되는 거지?
      appBar: AppBar(),
      body: StreamBuilder<QuerySnapshot>(
        stream: _postStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return ListTile(
                onTap: () {
                  //datail page로 title, content넘겨서 update시에 해당 제목을 가지고, 해당유저가 쓴 글을 update한다.
                  Get.to(DetailPage(auth: widget.auth), arguments: {
                    'id': document.id, // https://here4you.tistory.com/230 -> id 접근 방법 발견
                  });
                },
                title: Text(data['title']),
                subtitle: Text(data['content']),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

/*

final RxBool isLogin = false.obs; // UI가 관찰 가능한 변수 (변경되면 UI가 자동으로 업데이트 한다.)
title : Obx(() => Text("$isLogin"))]

*/
