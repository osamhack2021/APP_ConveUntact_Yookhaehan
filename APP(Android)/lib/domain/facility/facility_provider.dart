import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/user_controller.dart';
import 'package:myapp/domain/facility/facility.dart';

// 통신
class FacilityProvider {
  final _collection = "facility";
  UserController u = Get.find<UserController>();

  // 부대코드로 시설물 리스트 불러오기
  Future<QuerySnapshot> findByUnitCode(String unitcode) => FirebaseFirestore.instance
      .collection(_collection)
      .where("unitcode", isEqualTo: "$unitcode")
      .orderBy("created", descending: true)
      .get();

  //시설물 저장하기 후 저장된 객체반환
  Future<DocumentSnapshot> add(Facility newFacility) =>
      FirebaseFirestore.instance
          .collection(_collection)
          .add(newFacility.toJson())
          .then((v) {
        v.update({"id": v.id});
        return v.get();
      });

  Future<DocumentSnapshot> findById(String id) =>
      FirebaseFirestore.instance.doc("$_collection/$id").get();

  Future<void> updateById(Facility newFacility, String id) =>
      FirebaseFirestore.instance
          .doc("$_collection/$id")
          .update(newFacility.toJson());

  Future<void> deleteById(String id) =>
      FirebaseFirestore.instance.doc("$_collection/$id").delete();
}