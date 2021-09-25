import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/domain/post/post_fun.dart';
import 'package:myapp/domain/user/auth.dart';
import 'package:myapp/view/pages/post/update_page.dart';

import 'home_page.dart';

class DetailPage extends StatelessWidget {
  final Auth auth;

  //(1)
  DetailPage({required this.auth});

  //데이터를 받는 방법 1 : class constructor 받기
  //데이터를 받는 방법 2 : GetX의 arguments

  @override
  Widget build(BuildContext context) {
    //(2)
    String id = Get.arguments['id'];

    final Stream<DocumentSnapshot> _postStream =
        FirebaseFirestore.instance.collection('posts').doc(id).snapshots();

    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<DocumentSnapshot>(
        stream: _postStream,
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          print('data');
          print(data);

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['title'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                Divider(),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        await delete_post(id);
                        print("글삭제 성공");
                        Get.off(HomePage(auth:auth)); // 상태관리로 갱신 작업 추가 해줘야함. -> streambuilder
                      },
                      child: const Text("삭제"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        /*
                        argument로 title,content,id 넘기니까
                        Expected a value of type 'String', but got one of type 'Null' 가 떠서
                        아예 get.to 발동이 안됨...... 왜지??? 그냥 버그인가
                        */
                        Get.to(UpdatePage(
                          id: id,
                          title: data['title'],
                          content: data['content'],
                        )); 
                        // , arguments: {
                        //'title': data['title'],
                        //'content': data['content'],
                        //'id': id,
                        //}
                      },
                      child: const Text("수정"),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child:
                        Text("${data['content']}+++${data['title']}+++${id}"),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
