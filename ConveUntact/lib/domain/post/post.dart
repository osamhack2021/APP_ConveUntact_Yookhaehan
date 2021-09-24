class Post {
  final int? id;
  final String? email;
  final String? title;
  final String? content;
  final DateTime? created;
  final DateTime? updated;

  Post(
    this.id,
    this.email,
    this.title,
    this.content,
    this.created,
    this.updated,
  );

  //firebase 연동을 위해 json tpye으로 변환해주는 method??
}
