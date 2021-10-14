import 'package:myapp/domain/unit/unit.dart';

class Facility {
  final String? id;
  final String? unitcode;
  final String? name;
  final String? picture;
  final String? detail;

  Facility({
    this.id,
    this.unitcode,
    this.name,
    this.picture,
    this.detail,
  });

  // 통신을 위해서 json 처럼 생긴 문자열 {"id":1} => Dart 오브젝트

  Facility.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        unitcode = json["unitcode"],
        name = json["name"],
        picture = json["picture"],
        detail = json["detail"];

  Map<String, dynamic> toJson() => {
        "id": id,
        "unitcode": unitcode,
        "name": name,
        "picture": picture,
        "detail": detail,
      };
}