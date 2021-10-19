import 'package:get/get.dart';
import 'package:myapp/domain/reservation/reservation.dart';
import 'package:myapp/domain/reservation/reservation_repository.dart';

class ReservationController extends GetxController {
  final ReservationRepository _ReservationRepository = ReservationRepository();
  final reservations = <Reservation>[].obs;
  final reservation = Reservation().obs;
  final unitcode;

  // 객체 생성(create) onInit 함수실행(initialize)
  // ReservationController n = Get.put(ReservationController());
  ReservationController({this.unitcode});

  @override
  void onInit() {
    super.onInit();
    findByUnitCode(unitcode);
  }

  Future<List<Reservation>> findByUnitCode(String unitcode) async {
    List<Reservation> reservations = await _ReservationRepository.findByUnitCode(unitcode);
    this.reservations.value = reservations;
    return reservations;
  }

  Future<List<Reservation>> findByUid(String uid) async {
    List<Reservation> reservations = await _ReservationRepository.findByUid(uid);
    this.reservations.value = reservations;
    return reservations;
  }

  Future<void> add(Reservation newReservation) async {
    Reservation reservation = await _ReservationRepository.add(newReservation);
    if (reservation.id != null) {
      this.reservations.add(reservation);
    }
  }

  Future<void> findById(String id) async {
    Reservation reservation = await _ReservationRepository.findById(id);
    this.reservation.value = reservation;
  }

  Future<void> updateById(Reservation newReservation, String id) async {
    int result = await _ReservationRepository.updateById(newReservation, id);
    if (result == 1) {
      Reservation reservation = await _ReservationRepository.findById(id);
      this.reservation.value = reservation;
      this.reservations.value = this.reservations.map((e) => e.id == id ? reservation : e).toList();
    }
  }

  Future<int> deleteById(String id) async {
    int result = await _ReservationRepository.deleteById(id);
    if (result == 1) {
      print("서버 쪽 삭제 성공");
      List<Reservation> result = reservations.where((reservation) => reservation.id != id).toList();
      reservations.value = result;
    }
    return result;
  }
}