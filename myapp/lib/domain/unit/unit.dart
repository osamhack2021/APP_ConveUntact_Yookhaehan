import 'package:myapp/domain/declaration/declaration.dart';
import 'package:myapp/domain/manner/manner.dart';

class Unit {
  final String? uid; // provider_firebaseUid
  final String? unitcode; // provider_firebaseUid
  final String? name; // 부대이름
  final String? picture;
  final String? email;
  //final List<Manner>? manners; // 부대간 점수 순위, 부대원 평균 점수 -> 부대에 해당하는 모든 manner 를 다 들고있어야 함.
  //final List<Declaration>? declarations;
  //final String? n_declarations;
  final DateTime? created;

  Unit({
    this.uid,
    this.unitcode,
    this.name,
    this.picture,
    this.email,
    //this.manners,
    //this.declarations,
    this.created,
  });

  // 통신을 위해서 json 처럼 생긴 문자열 {"id":1} => Dart 오브젝트

  Unit.fromJson(Map<String, dynamic> json)
      : uid = json["uid"],
        unitcode = json["unitcode"],
        name = json["name"],
        picture = json["picture"],
        email = json["email"],
        // list의 instance데이터들를 어떻게 변환하는지?
        //manners = Manner.fromJson(json["manners"]),
        //declarations = Declaration.fromJson(json["declarations"]),
        created = json["created"].toDate();

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "unitcode": unitcode,
        "name": name,
        "picture": picture,
        "email": email,
        //"manners": manners,
        //"declarations": declarations,
        "created": created,
      };
}