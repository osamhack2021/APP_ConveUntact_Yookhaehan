import 'package:myapp/domain/declaration/declaration.dart';
import 'package:myapp/domain/manner/manner.dart';
import 'package:myapp/domain/notice/notice.dart';

class Unit {
  final String? unitcode; // provider_firebaseUid
  final String? name; // 유저네임 (보여지는 이름)
  final String? picture;
  final String? email;
  final Manner? manner;
  final Declaration? declaration;
  final Notice? notice;
  final DateTime? created;
  final DateTime? updated;

  Unit({
    this.unitcode,
    this.name,
    this.picture,
    this.email,
    this.manner,
    this.declaration,
    this.notice,
    this.created,
    this.updated,
  });

  // 통신을 위해서 json 처럼 생긴 문자열 {"id":1} => Dart 오브젝트

  Unit.fromJson(Map<String, dynamic> json)
      : unitcode = json["unitcode"],
        name = json["name"],
        picture = json["picture"],
        email = json["email"],
        manner = Manner.fromJson(json["manner"]),
        notice = Notice.fromJson(json["notice"]),
        declaration = Declaration.fromJson(json["declaration"]),
        created = json["created"].toDate(),
        updated = json["updated"].toDate();

  Map<String, dynamic> toJson() => {
        "unitcode": unitcode,
        "name": name,
        "picture": picture,
        "email": email,
        "manner": manner,
        "notice": notice,
        "declaration": declaration,
        "created": created,
        "updated": updated,
      };
}