import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_blog/controller/user_controller.dart';
import 'package:flutter_blog/domain/post/post.dart';
import 'package:flutter_blog/domain/post/post_provider.dart';
import 'package:get/get.dart';

// 통신을 호출해서 응답되는 데이터를 예쁘게 가공!! => json => Dart 오브젝트
class PostRepository {
  UserController u = Get.find<UserController>();
  final PostProvider _postProvider = PostProvider();

  Future<List<Post>> findAll() async {
    QuerySnapshot querySnapshot = await _postProvider.findAll();
    List<Post> posts = querySnapshot.docs
        .map((doc) => Post.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
    return posts;
  }

  Future<Post> save(String title, String content) async {
    DocumentSnapshot result = await _postProvider.save(title, content);
    return Post.fromJson(result.data() as Map<String, dynamic>);
  }

  Future<Post> findById(String id) async {
    DocumentSnapshot result = await _postProvider.findById(id);
    return result.data() == null
        ? Post()
        : Post.fromJson(result.data() as Map<String, dynamic>);
  }

  Future<int> updateById(String id, String title, String content) async {
    // 업데이트 리턴 타입 void라 예외처리하기 위해 한번더 select
    await _postProvider.updateById(id, title, content);
    Post post = await findById(id);
    return post.title == title && post.content == content ? 1 : -1;
  }

  Future<int> deleteById(String id) async {
    // 삭제 리턴 타입 void라 예외처리하기 위해 한번더 select
    await _postProvider.deleteById(id);
    Post post = await findById(id);
    return post.id == null ? 1 : -1;
  }
}
