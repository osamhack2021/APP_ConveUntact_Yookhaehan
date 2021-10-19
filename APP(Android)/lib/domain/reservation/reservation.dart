import 'package:myapp/domain/user/user.dart';

class Reservation {
  final String? id;
  final User? user; // provider_firebaseUid
  final String? unitcode;
  final String? facility_name;
  final String? facility_picture;
  final String? start;
  final String? end;
  final String? reason;
  final String? limit;
  final String? created;

  Reservation({
    this.id,
    this.user,
    this.unitcode,
    this.facility_name,
    this.facility_picture,
    this.start,
    this.end,
    this.reason,
    this.limit,
    this.created,
  });

  // 통신을 위해서 json 처럼 생긴 문자열 {"id":1} => Dart 오브젝트

  Reservation.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        user = User.fromJson(json["user"]),
        unitcode = json["unitcode"],
        facility_name = json["facility_name"],
        facility_picture = json["facility_picture"],
        start = json["start"],
        end = json["end"],
        reason = json["reason"],
        limit = json["limit"],
        created = json["created"].toDate();

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "unitcode": unitcode,
        "facility_name": facility_name,
        "facility_picture": facility_picture,
        "start": start,
        "end": end,
        "reason": reason,
        "limit": limit,
        "created": created,
      };
}