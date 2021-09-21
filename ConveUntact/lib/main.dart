import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/home_page.dart';

void main() async {
  print('su!');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ConveUntact());
}

class ConveUntact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}