import 'package:myapp/domain/facility/facility.dart';
import 'package:myapp/domain/unit/unit.dart';

class Notice {
  final Unit? unit; // 유저네임 (보여지는 이름)
  final Facility? facility;
  final String? contents;
  final String? created;

  Notice({
    this.unit,
    this.facility,
    this.contents,
    this.created,
  });

  // 통신을 위해서 json 처럼 생긴 문자열 {"id":1} => Dart 오브젝트

  Notice.fromJson(Map<String, dynamic> json)
      : unit = Unit.fromJson(json["unit"]),
        facility = Facility.fromJson(json["facility"]),
        contents = json["contents"],
        created = json["created"].toDate();

  Map<String, dynamic> toJson() => {
        "unit": unit,
        "facility": facility,
        "contents": contents,
        "created": created,
      };
}