import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/pages/login/login_screen.dart';

const primaryColor = Color(0xFFF7CBD4);
void main() => runApp(const UserFinishResetPassword());

/// This is the main application widget.
class UserFinishResetPassword extends StatelessWidget {
  const UserFinishResetPassword({Key? key}) : super(key: key);

  //static const String _title = 'Test TextButton';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF7CBD4),
        primaryColor: primaryColor,
      ),
      //title: _title,
      home: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: primaryColor,
        //   title: Text(''),
        //   automaticallyImplyLeading: true,
        //   leading: IconButton(
        //     icon: Icon(Icons.arrow_back_ios_new),
        //     onPressed: () {
        //       Get.back();
        //     },
        //   ),
        // ),
        body: const MyStatelessWidget(),
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
          Text('ConveUntact',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Colors.white)),
          SizedBox(height: 120),
          Text('메일을 보냈어요',
              style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Colors.white)),
          SizedBox(height: 40),
          Text('conveuntact@naver.com',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.blue)),
          Text('메일의 링크를 클릭하여\n비밀번호를 초기화 하세요',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black26)),
          SizedBox(height: 130),
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
                    Get.to(Loginpage());
                  },
                  child: const Text('   확인   '),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
