class User {
  final int? id;
  final String? username;
  final String? password;
  final String? email;
  final String? phone;
  final DateTime? created;
  final DateTime? updated;

  User({
    this.id,
    this.username,
    this.password,
    this.email,
    this.phone,
    this.created,
    this.updated,
  });

  //firebase 연동을 위해 json tpye으로 변환해주는 method??
}
