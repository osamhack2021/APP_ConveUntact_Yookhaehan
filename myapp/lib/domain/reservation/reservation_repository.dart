import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/user_controller.dart';
import 'package:myapp/domain/reservation/reservation.dart';
import 'package:myapp/domain/reservation/reservation_provider.dart';

// 통신을 호출해서 응답되는 데이터를 예쁘게 가공!! => json => Dart 오브젝트
class ReservationRepository {
  UserController u = Get.find<UserController>();
  final ReservationProvider _ReservationProvider = ReservationProvider();

  Future<List<Reservation>> findByUnitCode(String unitcode) async {
    QuerySnapshot querySnapshot = await _ReservationProvider.findByUnitCode(unitcode);
    List<Reservation> reservation = querySnapshot.docs
        .map((doc) => Reservation.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
    return reservation;
  }

  //사용자자페이지 - 사용자의 모든 예약내역 가져오기
  Future<List<Reservation>> findByUid(String uid) async {
    QuerySnapshot querySnapshot = await _ReservationProvider.findByUid(uid);
    List<Reservation> reservation = querySnapshot.docs
        .map((doc) => Reservation.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
    return reservation;
  }

  Future<Reservation> add(Reservation newReservation) async {
    DocumentSnapshot result = await _ReservationProvider.add(newReservation);
    return Reservation.fromJson(result.data() as Map<String, dynamic>);
  }

  Future<Reservation> findById(String id) async {
    DocumentSnapshot result = await _ReservationProvider.findById(id);
    return result.data() == null
        ? Reservation()
        : Reservation.fromJson(result.data() as Map<String, dynamic>);
  }

  Future<int> updateById(Reservation newReservation, String id) async {
    // 업데이트 리턴 타입 void라 예외처리하기 위해 한번더 select
    await _ReservationProvider.updateById(newReservation, id);
    Reservation reservation = await findById(id);
    return reservation.start == newReservation.start && reservation.reason == newReservation.reason ? 1 : -1;
  }

  Future<int> deleteById(String id) async {
    // 삭제 리턴 타입 void라 예외처리하기 위해 한번더 select
    await _ReservationProvider.deleteById(id);
    Reservation reservation = await findById(id);
    return reservation.id == null ? 1 : -1;
  }
}