import 'package:myapp/domain/manner/manner.dart';
import 'package:myapp/domain/reservation/reservation.dart';
import 'package:myapp/domain/unit/unit.dart';

class User {
  final String? uid; // provider_firebaseUid
  final String? username; // 유저네임 (보여지는 이름)
  final String? rank;
  final String? email;
  final String? picture; // firestore에서 받아옴 -> 타입변경 가능
  final String? number;
  final Unit? unit;
  final Manner? manner;
  final Reservation? reservation;
  final DateTime? created;
  final DateTime? updated;

  User({
    this.uid,
    this.username,
    this.rank,
    this.email,
    this.picture,
    this.number,
    this.unit,
    this.manner,
    this.reservation,
    this.created,
    this.updated,
  });

  // 통신을 위해서 json 처럼 생긴 문자열 {"id":1} => Dart 오브젝트

  User.fromJson(Map<String, dynamic> json)
      : uid = json["uid"],
        username = json["username"],
        rank = json["rank"],
        email = json["email"],
        picture = json["picture"],
        number = json["number"],
        unit = Unit.fromJson(json["unit"]),
        manner = Manner.fromJson(json["manner"]),
        reservation = Reservation.fromJson(json["reservation"]),
        created = json["created"].toDate(),
        updated = json["updated"].toDate();

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "username": username,
        "rank": rank,
        "email": email,
        "picture": picture,
        "number": number,
        "unit": unit,
        "manner": manner,
        "reservation": reservation,
        "created": created,
        "updated": updated,
      };
}