import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> add_post(
  String email, String title, String content) async {

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference users = firestore.collection('posts');

  await users
      .add({
        'email': email,
        'title': title,
        'content': content,
      })
      .then((value) => print("Post Added: $value"))
      .catchError((error) => print("Failed to add post: $error"));
  print("글쓰기 완료");

  return true;
}

Future<bool> update_post(
  String id, String title, String content) async {

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference posts = firestore.collection('posts');
  
  //update기능 구현시 document ID를 어떻게 찾아야 하는가?
  // 일단 datail page로 갈때 해당 documentID를 넘기도록 해야 한다. ->read all posts부터 만들어야지 할 수 있다.
  // -> email과 title을 이용해 해당 document를 찾아 update한다. -> 나중에는 uuid를 이용해 documnet id 값을 지정하여 그 id값으로 넘기는 것으로 수정해야함.
  // -> id로 접근하여 기능수행.
  await posts
      .doc(id)
      .update({
        'title': title,
        'content': content,
      })
      .then((value) => true)
      .catchError((error) => false);
      
  print("글쓰기 완료");

  return true;
}

Future<bool> delete_post(String id) async {

  await FirebaseFirestore.instance.collection("posts")
    .doc(id)
    .delete()
    .then((value) => true)
    .catchError((error) => false);
    
  return true;
}