//import 'package:flutter_blog/view/pages/user/join_page.dart' as globals;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> writecontent(String _title, String _content) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference users = firestore.collection('contentlist');
  users
      .add({
        'title': _title,
        'content': _content,
        'fnDatetime': Timestamp.now(),
      })
      .then((value) => print("User Added: $value"))
      .catchError((error) => print("Failed to add user: $error"));
  print("글쓰기 완료");

  return true;
}
