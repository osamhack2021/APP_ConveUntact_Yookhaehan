import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/pages/home_page/home_page.dart';
import 'package:myapp/pages/login/login_screen.dart';

class MenuWidget extends StatelessWidget {
  final Function(String)? onItemClick;

  const MenuWidget({Key? key, this.onItemClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          CircleAvatar(
            radius: 65,
            backgroundColor: Colors.grey,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.pink.shade200,
              backgroundImage: AssetImage('myapp/icons/computer.png'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '일병 홍길동',
            style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 30,
                fontFamily: 'BalsamiqSans'),
          ),
          SizedBox(
            height: 20,
          ),
          sliderItem('홈 페이지', Icons.home),
          sliderItem('시설 예약하기', Icons.add_circle),
          sliderItem('나의 예약', Icons.notifications_active),
          sliderItem('신고하기', Icons.question_answer_rounded),
          sliderItem('앱 설정', Icons.settings),
          sliderItem('로그아웃', Icons.logout),
        ],
      ),
    );
  }

  Widget sliderItem(String title, IconData icons) => ListTile(
      title: Text(
        title,
        style:
            TextStyle(color: Colors.grey, fontFamily: 'BalsamiqSans_Regular'),
      ),
      leading: Icon(
        icons,
        color: Colors.grey,
      ),
      onTap: () {
        onItemClick!(title);
        Get.to(LoginScreen());
      });
}