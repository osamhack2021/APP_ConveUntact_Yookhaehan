import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FirebaseService extends GetxService {
  Future<FirebaseService> init() async {
    await Firebase.initializeApp();
    print('\x1B[95m========== Firebase initialized ==========\x1B[105m');
    return this;
  }
}
