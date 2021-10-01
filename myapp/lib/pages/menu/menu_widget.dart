import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/main.dart';
import 'package:myapp/pages/home_page/home_page.dart';
import 'package:myapp/pages/login/login_screen.dart';
import 'package:myapp/pages/setting/setting_page.dart';

class MenuWidget extends StatelessWidget {
  final Function(String)? onItemClick;

  const MenuWidget({Key? key, this.onItemClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink.shade200,
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          CircleAvatar(
            radius: 65,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage('myapp/icons/computer.png'),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '일병 홍길동',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
                fontFamily: 'BalsamiqSans'),
          ),
          SizedBox(
            height: 20,
          ),
          sliderItem('홈 페이지', Icons.home, context),
          sliderItem('시설 예약하기', Icons.add_circle, context),
          sliderItem('나의 예약', Icons.notifications_active, context),
          sliderItem('신고하기', Icons.question_answer_rounded, context),
          sliderItem('앱 설정', Icons.settings, context),
          sliderItem('로그아웃', Icons.logout, context),
        ],
      ),
    );
  }

  Widget sliderItem(String title, IconData icons, BuildContext context) => ListTile(
    title: Text(
      title,
      style: TextStyle(color: Colors.white, fontFamily: 'BalsamiqSans_Regular'),
    ),
    leading: Icon(
      icons,
      color: Colors.white,
    ),
    onTap: () {
      onItemClick!(title);
      if(title == "홈페이지"){
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
      } else if(title == "시설 예약하기"){
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
      } else if(title == "나의 예약"){
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
      } else if(title == "신고하기"){
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
      } else if(title == "앱 설정"){
        Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPage()));
      } else if(title == "로그아웃"){
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    }
  );
}