// FireStore와 통신
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/domain/unit/unit.dart';


class UnitProvider {
  final _collection = "units"; // Firestore Collection 이름
  // UserController u = Get.find<UserController>();
  /*
  unit에서 구현해야 할 기능 정리
  1. 관리자 회원가입/로그인하기 join / login
  2. 사용자가 회원가입시 부대코드로 부대 정보 가져오기 -> 확인창 띄우기
  3. 

  
  */
  //unitcode로 units객체 가져오기
  Future<QuerySnapshot> login(String uid) => FirebaseFirestore.instance
      .collection(_collection)
      .where("unitcode", isEqualTo: "$uid")
      .get();

  //Unit 생성하기
  Future<DocumentReference> join(Unit newUnit) =>
      FirebaseFirestore.instance.collection(_collection).add(newUnit.toJson());

  //unit code 중복체크
  Future<QuerySnapshot> checkCode(String unitcode) => FirebaseFirestore.instance
      .collection(_collection)
      .where("unitcode", isEqualTo: unitcode)
      .get();

  Future<DocumentSnapshot> findById(String id) =>
      FirebaseFirestore.instance.doc("$_collection/$id").get();

  //중요 - 신고나 메너 업데이트 되면 업데이트 되어야함.
  // Future<void> updateById(String id, String title, String content) =>
  //     FirebaseFirestore.instance
  //         .doc("$_collection/$id")
  //         .update(UpdateReqDto(title, content).toJson());

  Future<void> deleteById(String id) =>
      FirebaseFirestore.instance.doc("$_collection/$id").delete();

}