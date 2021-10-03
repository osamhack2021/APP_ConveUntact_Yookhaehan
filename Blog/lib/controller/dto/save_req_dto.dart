import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_blog/controller/user_controller.dart';
import 'package:get/get.dart';

class SaveReqDto {
  final String? title;
  final String? content;

  SaveReqDto(this.title, this.content);

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "user": Get.find<UserController>().principal.value.toJson(), // user객체 통째로 post에다가 넣기 -> 비정규화 작업
        "created": FieldValue.serverTimestamp(),
        "updated": FieldValue.serverTimestamp(),
      };
}
