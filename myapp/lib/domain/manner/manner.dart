import 'package:myapp/domain/unit/unit.dart';
import 'package:myapp/domain/user/user.dart';

class Manner {
  final User? user; // provider_firebaseUid
  final Unit? unit; // 유저네임 (보여지는 이름)
  final String? contents;
  final String? score;
  final DateTime? created;
  final DateTime? updated;

  Manner({
    this.user,
    this.unit,
    this.contents,
    this.score,
    this.created,
    this.updated,
  });

  // 통신을 위해서 json 처럼 생긴 문자열 {"id":1} => Dart 오브젝트

  Manner.fromJson(Map<String, dynamic> json)
      : user = User.fromJson(json["user"]),
        unit = Unit.fromJson(json["unit"]),
        contents = json["contents"],
        score = json["score"],
        created = json["created"].toDate(),
        updated = json["updated"].toDate();

  Map<String, dynamic> toJson() => {
        "user": user,
        "unit": unit,
        "contents": contents,
        "score": score,
        "created": created,
        "updated": updated,
      };
}