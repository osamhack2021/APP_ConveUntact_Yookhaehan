import 'package:myapp/domain/unit/unit.dart';

class Facility {
  final Unit? unit; // 부대 이름, 사진
  final String? name;
  final String? picture;
  final String? detail;

  Facility({
    this.unit,
    this.name,
    this.picture,
    this.detail,
  });

  // 통신을 위해서 json 처럼 생긴 문자열 {"id":1} => Dart 오브젝트

  Facility.fromJson(Map<String, dynamic> json)
      : unit = Unit.fromJson(json["unit"]),
        name = json["name"],
        picture = json["picture"],
        detail = json["detail"];

  Map<String, dynamic> toJson() => {
        "unit": unit,
        "name": name,
        "picture": picture,
        "detail": detail,
      };
}