import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_blog/controller/dto/save_req_dto.dart';
import 'package:flutter_blog/controller/dto/update_req_dto.dart';
import 'package:flutter_blog/controller/user_controller.dart';
import 'package:get/get.dart';

// 통신
class PostProvider {
  final _collection = "post";
  UserController u = Get.find<UserController>();

  Future<QuerySnapshot> findAll() => FirebaseFirestore.instance
      .collection(_collection)
      .orderBy("created", descending: true)
      .get();

  Future<DocumentSnapshot> save(String title, String content) =>
      FirebaseFirestore.instance
          .collection(_collection)
          .add(SaveReqDto(title, content).toJson())
          .then((v) {
        v.update({"id": v.id});
        return v.get();
      });

  Future<DocumentSnapshot> findById(String id) =>
      FirebaseFirestore.instance.doc("$_collection/$id").get();

  Future<void> updateById(String id, String title, String content) =>
      FirebaseFirestore.instance
          .doc("$_collection/$id")
          .update(UpdateReqDto(title, content).toJson());

  Future<void> deleteById(String id) =>
      FirebaseFirestore.instance.doc("$_collection/$id").delete();
}
