import 'package:myapp/domain/user/user.dart';

class Declaration {
  final String? id;
  final User? user;
  final String? unitcode;
  final String? facility_name;
  final String? facility_picture;
  final String? contents;
  final String? created;

  Declaration({
    this.id,
    this.user,
    this.unitcode,
    this.facility_name,
    this.facility_picture,
    this.contents,
    this.created,
  });

  // 통신을 위해서 json 처럼 생긴 문자열 {"id":1} => Dart 오브젝트

  Declaration.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        user = User.fromJson(json["user"]),
        unitcode = json["unitcode"],
        facility_name = json["facility_name"],
        facility_picture = json["facility_picture"],
        contents = json["contents"],
        created = json["created"].toDate();

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "unitcode": unitcode,
        "facility_name": facility_name,
        "facility_picture": facility_picture,
        "contents": contents,
        "created": created,
      };
}