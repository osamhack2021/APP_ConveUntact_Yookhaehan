import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> add_post(
  String email, String title, String content) async {

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference users = firestore.collection('posts');

  await users
      .add({
        'email': "$email",
        'title': '$title',
        'content': '$content',
      })
      .then((value) => print("Post Added: $value"))
      .catchError((error) => print("Failed to add post: $error"));
  print("글쓰기 완료");

  return true;
}
