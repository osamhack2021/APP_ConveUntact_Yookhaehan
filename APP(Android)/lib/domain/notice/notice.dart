
class Notice {
  final String? id;
  final String? unitcode;
  final String? facility_name;
  final String? facility_picture;
  final String? contents;
  final String? created;

  Notice({
    this.id,
    this.unitcode,
    this.facility_name,
    this.facility_picture,
    this.contents,
    this.created,
  });

  // 통신을 위해서 json 처럼 생긴 문자열 {"id":1} => Dart 오브젝트

  Notice.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        unitcode = json["unitcode"],
        facility_name = json["facility_name"],
        facility_picture = json["facility_picture"],
        contents = json["contents"],
        created = json["created"].toDate();

  Map<String, dynamic> toJson() => {
        "id": id,
        "unitcode": unitcode,
        "facility_name": facility_name,
        "facility_picture": facility_picture,
        "contents": contents,
        "created": created,
      };
}