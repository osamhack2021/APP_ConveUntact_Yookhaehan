import 'package:get/get.dart';
import 'package:myapp/domain/user/user.dart';
import 'package:myapp/domain/user/user_repository.dart';

class UserController extends GetxController {
  final UserRepository _userRepository = UserRepository();
  final RxBool isLogin = false.obs; // UI가 관찰 가능한 변수 => 변경 => UI가 자동 업데이트
  final principal = User().obs;

  get required => null;

  Future<void> logout() async {
    await _userRepository.logout();
    this.principal.value = User();
    this.isLogin.value = false;
    // Get.Storage()
  }

  Future<int> login(String email, String password) async {
    User principal = await _userRepository.login(email, password);

    if (principal.uid != null) {
      this.isLogin.value = true;
      this.principal.value = principal;
      return 1;
    } else {
      return -1;
    }
  }

  Future<int> join(User newuser, String? password) async {
    User principal = await _userRepository.join(newuser, password!);

    if (principal.uid != null) {
      this.isLogin.value = true;
      this.principal.value = principal;
      return 1;
    } else {
      return -1;
    }
  }

  Future<void> findByEmail(String email) async {
    User user = await _userRepository.findByEmail(email);
    this.principal.value = user;
  }
  Future<int> checkEmail(String email) async =>
      await _userRepository.checkEmail(email);

  Future<int> checkUsername(String username) async =>
      await _userRepository.checkUsername(username);
}