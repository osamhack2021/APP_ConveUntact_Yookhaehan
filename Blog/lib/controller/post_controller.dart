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
    if (result == 1) { // 예외처리완료 -> 올바른 값으로 업뎃되었으므로 findbyid로 찾아도 문제없다.
      Post post = await _postRepository.findById(id); // 동일한 의문 : 왜 다시 id로 찾아오는 거지? -> 아!! 업데이트한 내역을 다시 가져와서 적용하는 것이구나.
      this.post.value = post; // update했으니 final post = Post().obs;를 변경 -> obs변수이므로 front단에서의 변수도 변경되는 원리이다!!!
      this.posts.value = this.posts.map((e) => e.id == id ? post : e).toList(); // final posts = <Post>[].obs;에서도 해당 post를 변경해주는 작업.
    }
  }

  Future<int> deleteById(String id) async {
    int result = await _postRepository.deleteById(id);
    if (result == 1) {
      print("서버 쪽 삭제 성공");
      List<Post> result = posts.where((post) => post.id != id).toList(); // final posts = <Post>[].obs 중에서 삭제된 post를 id값으로 골라 없애는 작업
      posts.value = result; // 삭제완료된 List<Post> result 를 기존 obs변수인 posts에 적용
    }
    return result;
  }
}
