import 'package:flutter/material.dart';
import 'package:myapp/pages/home_page/home_page.dart';
import 'package:myapp/pages/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/pages/signup/finish_signup.dart';
import 'package:myapp/pages/signup/select_army.dart';
import 'package:myapp/pages/signup/add_detail.dart';
import 'package:myapp/pages/signup/select_detail.dart';
import 'package:myapp/pages/signup/signtype.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // 라우트 설계 필요없음. GetX 사용할 예정
      home: SignType(),
    );
  }
}
