import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'
    hide User; // 이 프로젝트의 User 모델과 이름이 겹쳐서..
import 'package:myapp/domain/manner/manner.dart';
import 'package:myapp/domain/reservation/reservation.dart';
import 'package:myapp/domain/unit/unit.dart';
import 'package:myapp/domain/user/user.dart';
import 'package:myapp/domain/user/user_provider.dart';

// FireStore에서 응답되는 데이터를 예쁘게 가공!! => json => Dart 오브젝트
class UserRepository {
  //통신을 담당하는 provider 객체를 불러옴
  UserProvider _userProvider = UserProvider();

  //로그아웃 - FirebaseAuth객체 만들어서 signOut()
  Future<void> logout() async => await FirebaseAuth.instance.signOut();

  //로그인
  Future<User> login(String email, String password) async {
    UserCredential? userCredential;
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      // Login 실패 시 Unhandled Exception: [firebase_auth/user-not-found] 익셉션 일어남
    }

    if (userCredential != null) {
      //Firebase 로그인 성공 시 Firestore에 저장되어있는 유저의 추가정보 가져오기
      //이때 FirebaseAuth UserCredential의 uid를 이용해 가져온다!
      QuerySnapshot querySnapshot =
          await _userProvider.login(userCredential.user!.uid);

      List<QueryDocumentSnapshot> docs = querySnapshot.docs;

      if (docs.length > 0) {
        User principal = User.fromJson(
            querySnapshot.docs.first.data() as Map<String, dynamic>);
        //로그인 성공시, User객체 객체 리턴
        return principal;
      }
    }
    //로그인 실패 시 빈 객체 리턴
    return User();
  }



  //회원가입
  Future<User> join(String email, String password, String username, 
  String rank, String picture, String number, Unit unit, Manner manner, Reservation reservation) async {
    UserCredential? userCredential;
    //1. FirebaseAuth에 화원추가
    try {
      userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      // Create 실패 시 익셉션 일어남
    }

    if (userCredential != null) {
      User principal = User(
        uid: "${userCredential.user!.uid}",
        email: userCredential.user!.email,
        username: username,
        rank: rank,
        picture: picture,
        number: number,
        unit: unit,
        manner: manner,
        reservation: reservation,
        created: userCredential.user!.metadata.creationTime,
        updated: userCredential.user!.metadata.creationTime,
      );

      //2. FireStore에 화원추가
      //FireStore에 인서트 : 서비스 시 따로 관리해야할 정보가 필요 시 별도의 DB에 저장해서 관리!
      await _userProvider.join(principal);
      return principal;
    } else {
      return User();
    }
  }

  //중복체크용
  Future<int> checkEmail(String email) async {
    QuerySnapshot querySnapshot = await _userProvider.checkEmail(email);
    return querySnapshot.docs.length > 0 ? -1 : 1;
  }

  //중복체크용
  Future<int> checkUsername(String username) async {
    QuerySnapshot querySnapshot = await _userProvider.checkUsername(username);
    return querySnapshot.docs.length > 0 ? -1 : 1;
  }
}