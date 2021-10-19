import 'package:flutter/material.dart';
import 'package:myapp/pages/admin/ad_facility_modify/ad_facility_modify_menu.dart';
import 'package:myapp/pages/admin/ad_homepage/ad_home_page_menu.dart';
import 'package:myapp/pages/home_page/homepage_menu.dart';
import 'package:myapp/pages/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:myapp/pages/signup/admin/add_detail.dart';
import 'package:myapp/pages/signup/admin/add_detail2.dart';
import 'package:myapp/pages/signup/admin/admin_finish_signup.dart';
import 'package:myapp/pages/signup/signtype.dart';

import 'binding/app_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // 라우트 설계 필요없음. GetX 사용할 예정
      //home: ADHomePage(),
      initialBinding: AppBinding(),
      home: LoginPage(),
    );
  }
}
