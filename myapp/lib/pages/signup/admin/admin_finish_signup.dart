import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/pages/login/login_screen.dart';

const primaryColor = Color(0xFFACBDF4);


/// This is the main application widget.
class AdminFinishSignup extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFACBDF4),
        primaryColor: primaryColor,
      ),
      //title: _title,
      home: const Scaffold(
        body: MyStatelessWidget(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text('ConveUntact',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Colors.white)),
          const SizedBox(height: 120),
          const Text('환영합니다! \n관리자님',
              style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  fontSize: 70,
                  color: Colors.white)),
          const SizedBox(height: 20),
          Text('회원가입이 성공적으로 완료되었습니다. \n부대코드는 ${Get.arguments["unitcode"]} 입니다.',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black26)),
          const SizedBox(height: 130),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFFFFFFFF),
                          Color(0xFFFFFFFF),
                          Color(0xFFFFFFFF),
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(20.0),
                    primary: Colors.black,
                    textStyle: const TextStyle(fontSize: 60),
                  ),
                  onPressed: () {
                    Get.to(LoginPage());
                  },
                  child: const Text('시작하기'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
