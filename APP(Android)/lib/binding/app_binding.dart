import 'package:get/instance_manager.dart';
import 'package:myapp/service/firebase_service.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    // 의존성 주입 하는곳
    await Get.putAsync(() => FirebaseService().init());
  }
}