import 'package:get/get.dart';
import 'package:myapp/domain/unit/unit.dart';
import 'package:myapp/domain/unit/unit_repository.dart';

class UnitController extends GetxController {
  final UnitRepository _UnitRepository = UnitRepository();
  final RxBool isLogin = false.obs; // UI가 관찰 가능한 변수 => 변경 => UI가 자동 업데이트
  final principal = Unit().obs;

  Future<void> logout() async {
    await _UnitRepository.logout();
    this.principal.value = Unit();
    this.isLogin.value = false;
    // Get.Storage()
  }

  Future<int> login(String email, String password) async {
    Unit principal = await _UnitRepository.login(email, password);

    if (principal.uid != null) {
      this.isLogin.value = true;
      this.principal.value = principal;
      return 1;
    } else {
      return -1;
    }
  }

  Future<int> join(String email, String password, String unitcode, String name, String picture) async {
    Unit principal = await _UnitRepository.join(email, password, unitcode, name, picture);

    if (principal.uid != null) {
      this.isLogin.value = true;
      this.principal.value = principal;
      return 1;
    } else {
      return -1;
    }
  }

  Future<int> checkCode(String unitcode) async =>
      await _UnitRepository.checkCode(unitcode);
}