import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/user_controller.dart';
import 'package:myapp/domain/notice/notice.dart';

// 통신
class NoticeProvider {
  final _collection = "notice";
  UserController u = Get.find<UserController>();

  // 부대코드로 특정 부대에 해당하는 모든 공지 불러오기
  Future<QuerySnapshot> findByUnitCode(String unitcode) => FirebaseFirestore.instance
      .collection(_collection)
      .where("unitcode", isEqualTo: "$unitcode")
      .orderBy("created", descending: true)
      .get();

  //공지저장하기 후 저장된 객체반환
  Future<DocumentSnapshot> add(Notice newNotice) =>
      FirebaseFirestore.instance
          .collection(_collection)
          .add(newNotice.toJson())
          .then((v) {
        v.update({"id": v.id});
        return v.get();
      });

  Future<DocumentSnapshot> findById(String id) =>
      FirebaseFirestore.instance.doc("$_collection/$id").get();

  Future<void> updateById(Notice newNotice, String id) =>
      FirebaseFirestore.instance
          .doc("$_collection/$id")
          .update(newNotice.toJson());

  Future<void> deleteById(String id) =>
      FirebaseFirestore.instance.doc("$_collection/$id").delete();
}