import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_blog/controller/user_controller.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import 'join_page.dart';

class join_page_fire extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();
  final UserController u = Get.put(UserController());
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _email = TextEditingController();

  void login() async {
    UserCredential credential = await auth.signInWithEmailAndPassword(
        email: '$validateEmail()',
        password: '$validatePassword()');
    print(credential.user!.email); //! 말고 다른 방법 찾기
  }

  @override
  Widget build(BuildContext context) {
    //FirebaseAuth auth = FirebaseAuth.instance;
    login();
    return Scaffold(
      body: Center(
        child: Text("join_page_fire"),
      ),
    );
  }
}
