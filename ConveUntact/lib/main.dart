import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/view/pages/post/home_page.dart';
import 'package:myapp/view/pages/user/login_page.dart';

import 'domain/user/auth.dart';

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
      home: LoginPage(auth: Auth()),
    );
  }
}