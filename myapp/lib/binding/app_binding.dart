import 'package:get/instance_manager.dart';
import 'package:myapp/components/controller/football_controller.dart';

class AppBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(FootballController());
  }
} 