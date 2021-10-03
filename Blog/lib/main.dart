import 'package:flutter/material.dart';
import 'package:flutter_blog/binding/app_binding.dart';
import 'package:flutter_blog/view/pages/user/login_page.dart';
import 'package:get/get.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(), // 의존성 주입등록한 바인딩 클래스 초기화 하는곳
      // 라우트 설계 필요없음. GetX 사용할 예정
      home: LoginPage(),
    );
  }
}
