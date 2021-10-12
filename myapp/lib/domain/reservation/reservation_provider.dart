import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/user_controller.dart';
import 'package:myapp/domain/reservation/reservation.dart';

// 통신
class ReservationProvider {
  final _collection = "reservation";
  UserController u = Get.find<UserController>();

  // 부대코드로 특정 부대에 해당하는 모든 예약 불러오기 -> 시설사용 현황 그래프그리기
  Future<QuerySnapshot> findByUnitCode(String unitcode) => FirebaseFirestore.instance
      .collection(_collection)
      .where("unitcode", isEqualTo: "$unitcode")
      .orderBy("created", descending: true)
      .get();

  // uid로 해당 사용자의 모든 예약정보 불러오기
  Future<QuerySnapshot> findByUid(String uid) => FirebaseFirestore.instance
      .collection(_collection)
      .where("uid", isEqualTo: "$uid")
      .orderBy("created", descending: true)
      .get();

  //공지저장하기 후 저장된 객체반환
  Future<DocumentSnapshot> add(Reservation newReservation) =>
      FirebaseFirestore.instance
          .collection(_collection)
          .add(newReservation.toJson())
          .then((v) {
        v.update({"id": v.id});
        return v.get();
      });

  Future<DocumentSnapshot> findById(String id) =>
      FirebaseFirestore.instance.doc("$_collection/$id").get();

  Future<void> updateById(Reservation newReservation, String id) =>
      FirebaseFirestore.instance
          .doc("$_collection/$id")
          .update(newReservation.toJson());

  Future<void> deleteById(String id) =>
      FirebaseFirestore.instance.doc("$_collection/$id").delete();
}