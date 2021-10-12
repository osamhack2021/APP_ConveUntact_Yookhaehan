import 'package:myapp/domain/unit/unit.dart';
import 'package:myapp/domain/user/user.dart';

class Manner {
  final String? id;
  final User? user; // provider_firebaseUid
  final String? unitcode; // 유저네임 (보여지는 이름)
  final String? contents;
  final String? score;
  final DateTime? created;

  Manner({
    this.id,
    this.user,
    this.unitcode,
    this.contents,
    this.score,
    this.created,
  });

  // 통신을 위해서 json 처럼 생긴 문자열 {"id":1} => Dart 오브젝트

  Manner.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        user = User.fromJson(json["user"]),
        unitcode = json["unitcode"],
        contents = json["contents"],
        score = json["score"],
        created = json["created"].toDate();

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "unitcode": unitcode,
        "contents": contents,
        "score": score,
        "created": created,
      };
}
