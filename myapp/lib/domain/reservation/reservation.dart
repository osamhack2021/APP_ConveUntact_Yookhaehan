import 'package:myapp/domain/facility/facility.dart';
import 'package:myapp/domain/unit/unit.dart';
import 'package:myapp/domain/user/user.dart';

class Reservation {
  final User? user; // provider_firebaseUid
  final Unit? unit; // 유저네임 (보여지는 이름)
  final Facility? facility;
  final String? reason;
  final String? limit;
  final String? created;

  Reservation({
    this.user,
    this.unit,
    this.facility,
    this.reason,
    this.limit,
    this.created,
  });

  // 통신을 위해서 json 처럼 생긴 문자열 {"id":1} => Dart 오브젝트

  Reservation.fromJson(Map<String, dynamic> json)
      : user = User.fromJson(json["user"]),
        unit = Unit.fromJson(json["unit"]),
        facility = Facility.fromJson(json["facility"]),
        reason = json["reason"],
        limit = json["limit"],
        created = json["created"].toDate();

  Map<String, dynamic> toJson() => {
        "user": user,
        "unit": unit,
        "facility": facility,
        "reason": reason,
        "limit": limit,
        "created": created,
      };
}