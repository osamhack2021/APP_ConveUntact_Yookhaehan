import 'package:flutter_blog/controller/user_controller.dart';
import 'package:flutter_blog/service/firebase_service.dart';
import 'package:get/instance_manager.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    // 의존성 주입 하는곳
    await Get.putAsync(() => FirebaseService().init());
    Get.put(() => UserController());
  }
}
