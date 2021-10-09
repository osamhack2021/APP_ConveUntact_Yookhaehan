import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/pages/unit/facility.dart';
import 'package:myapp/pages/unit/facility_analysis.dart';
import 'package:myapp/pages/unit/init.dart';
import 'package:myapp/pages/unit/post_notice.dart';
import 'package:myapp/pages/unit/reservation_status.dart';
import 'package:myapp/pages/unit/test.dart';
import 'package:myapp/pages/unit/write_notice.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Test(),
    );
  }
}