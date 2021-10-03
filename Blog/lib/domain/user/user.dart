class User {
  final String? uid; // provider_firebaseUid
  final String? username; // 유저네임 (보여지는 이름)
  final String? email;
  final DateTime? created;
  final DateTime? updated;

  User({
    this.uid,
    this.username,
    this.email,
    this.created,
    this.updated,
  });

  // 통신을 위해서 json 처럼 생긴 문자열 {"id":1} => Dart 오브젝트

  User.fromJson(Map<String, dynamic> json)
      : uid = json["uid"],
        username = json["username"],
        email = json["email"],
        created = json["created"].toDate(),
        updated = json["updated"].toDate();

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "username": username,
        "email": email,
        "created": created,
        "updated": updated,
      };
}
