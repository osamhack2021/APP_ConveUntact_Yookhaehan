import 'package:flutter_blog/domain/post/post.dart';
import 'package:flutter_blog/domain/post/post_repository.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  final PostRepository _postRepository = PostRepository();
  final posts = <Post>[].obs;
  final post = Post().obs;

  @override
  void onInit() {
    super.onInit();
    findAll();
  }

  Future<List<Post>> findAll() async {
    List<Post> posts = await _postRepository.findAll();
    this.posts.value = posts;
    return posts;
  }

  Future<void> save(String title, String content) async {
    Post post = await _postRepository.save(title, content);
    if (post.id != null) {
      this.posts.add(post);
    }
  }

  Future<void> findById(String id) async {
    Post post = await _postRepository.findById(id);
    this.post.value = post;
  }

  Future<void> updateById(String id, String title, String content) async {
    int result = await _postRepository.updateById(id, title, content);
    if (result == 1) {
      Post post = await _postRepository.findById(id);
      this.post.value = post;
      this.posts.value = this.posts.map((e) => e.id == id ? post : e).toList();
    }
  }

  Future<int> deleteById(String id) async {
    int result = await _postRepository.deleteById(id);
    if (result == 1) {
      print("서버 쪽 삭제 성공");
      List<Post> result = posts.where((post) => post.id != id).toList();
      posts.value = result;
    }
    return result;
  }
}
