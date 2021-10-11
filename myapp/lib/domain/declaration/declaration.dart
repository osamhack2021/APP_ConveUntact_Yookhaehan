import 'package:myapp/domain/facility/facility.dart';
import 'package:myapp/domain/unit/unit.dart';
import 'package:myapp/domain/user/user.dart';

class Declaration {
  final Unit? unit;
  final User? user;
  final Facility? facility;
  final String? contents;
  final String? created;

  Declaration({
    this.unit,
    this.user,
    this.facility,
    this.contents,
    this.created,
  });

  // 통신을 위해서 json 처럼 생긴 문자열 {"id":1} => Dart 오브젝트

  Declaration.fromJson(Map<String, dynamic> json)
      : unit = Unit.fromJson(json["unit"]),
        user = User.fromJson(json["user"]),
        facility = Facility.fromJson(json["facility"]),
        contents = json["contents"],
        created = json["created"].toDate();

  Map<String, dynamic> toJson() => {
        "unit": unit,
        "user": user,
        "facility": facility,
        "contents": contents,
        "created": created,
      };
}