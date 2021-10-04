import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:myapp/%ED%9A%8C%EC%9B%90%EC%9C%A0%ED%98%95.dart';
import 'package:myapp/binding/app_binding.dart';

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
      home: SignType(),
    );
  }
}
