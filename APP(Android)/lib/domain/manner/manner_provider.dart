import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/user_controller.dart';
import 'package:myapp/domain/manner/manner.dart';

// 통신
class MannerProvider {
  final _collection = "manner";
  UserController u = Get.find<UserController>();

  // 부대코드로 해당 부대원의 모든 메너정보 불러오기
  Future<QuerySnapshot> findByUnitCode(String unitcode) => FirebaseFirestore.instance
      .collection(_collection)
      .where("unitcode", isEqualTo: "$unitcode")
      .orderBy("created", descending: true)
      .get();


  // uid로 해당 사용자의 모든 메너정보 불러오기
  Future<QuerySnapshot> findByUid(String uid) => FirebaseFirestore.instance
      .collection(_collection)
      .where("uid", isEqualTo: "$uid")
      .orderBy("created", descending: true)
      .get();
  //매너정보 저장하기 후 저장된 매너정보 반환
  //예약시 메너점수 상승!
  Future<DocumentSnapshot> add(Manner newManner) =>
      FirebaseFirestore.instance
          .collection(_collection)
          .add(newManner.toJson())
          .then((v) {
        v.update({"id": v.id}); // id값 추가 + return instance
        return v.get();
      });
      
  Future<DocumentSnapshot> findById(String id) =>
      FirebaseFirestore.instance.doc("$_collection/$id").get();

  Future<void> updateById(Manner newManner, String id) =>
      FirebaseFirestore.instance
          .doc("$_collection/$id")
          .update(newManner.toJson());

  Future<void> deleteById(String id) =>
      FirebaseFirestore.instance.doc("$_collection/$id").delete();
}