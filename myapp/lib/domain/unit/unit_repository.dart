import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'
    hide User; // 이 프로젝트의 User 모델과 이름이 겹쳐서..
import 'package:myapp/domain/unit/unit.dart';
import 'package:myapp/domain/unit/unit_provider.dart';
// FireStore에서 응답되는 데이터를 예쁘게 가공!! => json => Dart 오브젝트
class UnitRepository {
  //통신을 담당하는 provider 객체를 불러옴
  UnitProvider _unitProvider = UnitProvider();

  //로그아웃 - FirebaseAuth객체 만들어서 signOut()
  Future<void> logout() async => await FirebaseAuth.instance.signOut();

  //로그인
  Future<Unit> login(String email, String password) async {
    UserCredential? unitCredential;
    try {
      unitCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      // Login 실패 시 Unhandled Exception: [firebase_auth/user-not-found] 익셉션 일어남
    }

    if (unitCredential != null) {
      //Firebase 로그인 성공 시 Firestore에 저장되어있는 unit의 추가정보 가져오기
      //이때 FirebaseAuth UserCredential의 uid를 이용해 가져온다!
      QuerySnapshot querySnapshot =
          await _unitProvider.login(unitCredential.user!.uid);

      List<QueryDocumentSnapshot> docs = querySnapshot.docs;

      if (docs.length > 0) {
        Unit principal = Unit.fromJson(
            querySnapshot.docs.first.data() as Map<String, dynamic>);
        //로그인 성공시, User객체 객체 리턴
        return principal;
      }
    }
    //로그인 실패 시 빈 객체 리턴
    return Unit();
  }



  //회원가입
  //parameter 수정
  Future<Unit> join(String email, String password, String unitcode, 
    String name, String picture) async {

    UserCredential? unitCredential;
    //1. FirebaseAuth에 관리자추가
    try {
      unitCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      // Create 실패 시 익셉션 일어남
    }

    if (unitCredential != null) {
      Unit principal = Unit(
        uid: "${unitCredential.user!.uid}",
        unitcode: unitcode,
        name: name,
        picture: picture,
        email: unitCredential.user!.email,
        // manners: manners,
        // declarations: declarations,
        // -> 회원가입 시에는 굳이 안넣어 주고 매너점수 or 신고 발생시 추가하면 되나?
        created: unitCredential.user!.metadata.creationTime,
      );

      //2. FireStore에 화원추가
      //FireStore에 인서트 : 서비스 시 따로 관리해야할 정보가 필요 시 별도의 DB에 저장해서 관리!
      await _unitProvider.join(principal);
      return principal;
    } else {
      return Unit();
    }
  }

  //중복체크용 - 부대코드
  Future<int> checkCode(String email) async {
    QuerySnapshot querySnapshot = await _unitProvider.checkCode(email);
    return querySnapshot.docs.length > 0 ? -1 : 1;
  }

  Future<Unit> findByEmail(String email) async {
    QuerySnapshot snapshot = await _unitProvider.findByEmail(email);
    DocumentSnapshot result = snapshot.docs.first;
    return result.data() == null
        ? Unit()
        : Unit.fromJson(result.data() as Map<String, dynamic>);
  }

  Future<Unit> findByCode(String unitcode) async {
    QuerySnapshot snapshot = await _unitProvider.findByCode(unitcode);
    DocumentSnapshot result = snapshot.docs.first;
    return result.data() == null
        ? Unit()
        : Unit.fromJson(result.data() as Map<String, dynamic>);
  }
  // unit update코드 (미완) -> 멘토님께 질문
  // Future<int> updateById(String id, String title, String content) async {
  //   // 업데이트 리턴 타입 void라 예외처리하기 위해 한번더 select
  //   await _unitProvider.updateById(id, title, content);
  //   Unit unit = await findById(id);
  //   return Unit.title == title && Unit.content == content ? 1 : -1;
  // }

  //unit 계정 삭제 코드 (미완)
  // Future<int> deleteById(String uid) async {
  //   // 삭제 리턴 타입 void라 예외처리하기 위해 한번더 select
  //   await _unitProvider.deleteById(uid);
  //   Unit unit = await findById(uid);
  //   return Unit.uid == null ? 1 : -1;
  // }

}