import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'admin_info.dart';
import 'user_info.dart';

const primaryColor = Color(0xFFF7CBD4);
void main() => runApp(const SignType());

/// This is the main application widget.
class SignType extends StatelessWidget {
  const SignType({Key? key}) : super(key: key);

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
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text('가입유형 확인페이지'),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Get.back();
            },
          ),
        ),
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
          Text('가입 유형을 선택하세요',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white)),
          SizedBox(height: 100),
          // TextButton(
          //   style: TextButton.styleFrom(
          //     textStyle: const TextStyle(fontSize: 20),
          //   ),
          //   onPressed: null,
          //   child: const Text('사용자'),
          // ),
          //const SizedBox(height: 60),
          // TextButton(
          //   style: TextButton.styleFrom(
          //     textStyle: const TextStyle(fontSize: 60),
          //   ),
          //   onPressed: () {},
          //   child: const Text('관리자'),
          // ),
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
                    textStyle: const TextStyle(fontSize: 80),
                  ),
                  onPressed: () {
                    Get.to(UserInfo());
                  },
                  child: const Text('사용자'),
                ),
              ],
            ),
          ),
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
                    textStyle: const TextStyle(fontSize: 80),
                  ),
                  onPressed: () {
                    Get.to(AdminInfo());
                  },
                  child: const Text('관리자'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
