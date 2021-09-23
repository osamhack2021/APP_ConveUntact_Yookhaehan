import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


//1. 로그인 기능
Future<String?> login(String email, String password) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential credential = await auth.signInWithEmailAndPassword(
      email: "test@naver.com", password: "123456");
  print(credential.user!.email);
  //로그인 계정이 있으면 eamil을 넘기고 없으면 null을 넘겨서 로그인 체크를 해야한다.


  //email 리턴하는 이유 -> 로그인 후 email을 homepage로 넘겨서 해당 계정명의로 write update 기능을 수행하기 위해서이다.
  return credential.user!.email;
}





//2. 회원가입 기능
// 회원가입 로직
// (1) 이메일과 패스워드를 Authentication에 저장
// (2) 전화번호, 나이, 소속부대, 계급 등을 Firestore
// 파이어 스토어에도 같이 저장을 해줘야 한다. 그래야 유저 관리를 할 수 있다.

Future<bool> join(String username, String password, String email, String phone) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // (1) 이메일과 패스워드를 Authentication에 저장
  //firebase auth에 계정생성하기

  UserCredential credential = await auth.createUserWithEmailAndPassword(
      email: "$email", password: "$password");
  print(credential.user!.email);

  // (2) 전화번호, 나이, 소속부대, 계급 등을 Firestore
  //firestore에 계정생성하기

  CollectionReference users = firestore.collection('users');

  users
      .add({
        'email': "$email",
        'username': '$username',
        'phone': '$phone',
      })
      .then((value) => print("User Added: $value"))
      .catchError((error) => print("Failed to add user: $error"));
  print("회원가입 완료");
  
  return true;
}
