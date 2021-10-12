import 'package:flutter/material.dart';
import 'package:myapp/pages/UploadImg.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:myapp/pages/imagepickme.dart';
import 'package:myapp/pages/testtt.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await firebase_core.Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // 라우트 설계 필요없음. GetX 사용할 예정
      home: UploadingImageToFirebaseStoragee(),
    );
  }
}
