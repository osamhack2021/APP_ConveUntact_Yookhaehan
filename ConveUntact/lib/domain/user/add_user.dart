import 'package:cloud_firestore/cloud_firestore.dart';

  
Future<void> join(
    String username, String password, String email, String phone) async {
    
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    await users
        .add({
          'email': email,
          'username': username,
          'phone': phone,
        })
        .then((value) => print("User Added: $value"))
        .catchError((error) => print("Failed to add user: $error"));
    print("회원가입 완료");

    return;
  }
