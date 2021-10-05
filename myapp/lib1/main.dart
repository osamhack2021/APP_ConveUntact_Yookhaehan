import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:myapp/%EA%B5%B0%20%EC%A2%85%EB%A5%98%20%EC%84%A0%ED%83%9D.dart';
import 'package:myapp/binding/app_binding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //initialBinding: AppBinding(), // 의존성 주입등록한 바인딩 클래스 초기화 하는곳
      // 라우트 설계 필요없음. GetX 사용할 예정
      home: SelectArmy(),
    );
  }
}
