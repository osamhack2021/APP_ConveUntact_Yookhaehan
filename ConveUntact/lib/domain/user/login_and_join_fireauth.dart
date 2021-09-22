import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//1. 로그인 기능
void login() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential credential = await auth.signInWithEmailAndPassword(
      email: "test@naver.com", password: "123456");
  print(credential.user!.email);
}

//2. 회원가입 기능
// 회원가입 로직
// (1) 이메일과 패스워드를 Authentication에 저장
// (2) 전화번호, 나이, 소속부대, 계급 등을 Firestore
// 파이어 스토어에도 같이 저장을 해줘야 한다. 그래야 유저 관리를 할 수 있다.
void join() async {
  // (1) 이메일과 패스워드를 Authentication에 저장
  FirebaseAuth auth = FirebaseAuth.instance;

  //firebase auth에 계정생성하기
  UserCredential credential = await auth.createUserWithEmailAndPassword(
      email: "test2@naver.com", password: "123456");
  print(credential.user!.email);

  // (2) 전화번호, 나이, 소속부대, 계급 등을 Firestore
  await addUser();

  print("회원가입 완료");
}

Future<void> addUser() {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //firestore에 계정생성하기
  CollectionReference users = firestore.collection('users');
  return users
      .add({
        'email': "test2@naver.com",
        'username': 'test2',
        'phone': '01012345678',
      })
      .then((value) => print("User Added: $value"))
      .catchError((error) => print("Failed to add user: $error"));
}
