import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateReqDto {
  final String? title;
  final String? content;

  UpdateReqDto(this.title, this.content);

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "updated": FieldValue.serverTimestamp(),
      };
}
