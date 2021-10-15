import 'package:flutter/material.dart';
import 'package:myapp/pages/admin/ad_facility_modify_menu.dart';
import 'package:myapp/pages/admin/ad_faility_modify_page.dart';
import 'package:myapp/pages/admin/ad_home_page_menu.dart';
import 'package:myapp/pages/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:myapp/pages/signup/admin/add_detail.dart';
import 'package:myapp/pages/signup/signtype.dart';

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
      home: ADFacilityModifyPage(),
    );
  }
}