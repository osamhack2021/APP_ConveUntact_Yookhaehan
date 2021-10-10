import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<String?> login(String email, String password) async {
  FirebaseAuth auth = FirebaseAuth.instance;

  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: "$email",
      password: "$password",
    );
    print("계정 발견 ! 로그인 성공 !");
    print(userCredential.user!.email);
    return userCredential.user!.email;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('계정이 존재하지 않습니다.');
      return '계정이 존재하지 않습니다.';
    } else if (e.code == 'wrong-password') {
      print('패스워드가 틀렸습니다.');
      return '패스워드가 틀렸습니다.';
    }
  } catch (e) {
    print(e);
  }
}