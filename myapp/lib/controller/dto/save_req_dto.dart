import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/user_controller.dart';

class SaveReqDto {
  final String? title;
  final String? content;

  SaveReqDto(this.title, this.content);

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "user": Get.find<UserController>().principal.value.toJson(),
        "created": FieldValue.serverTimestamp(),
        "updated": FieldValue.serverTimestamp(),
      };
}
