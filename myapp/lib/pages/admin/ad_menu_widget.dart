import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/pages/admin/ad_my_page/ad_mypage_menu.dart';
import 'package:myapp/pages/admin/ad_night_manage/ad_night_manage_list_menu.dart';
import 'package:myapp/pages/admin/ad_rez_chart/ad_rez_chart_menu.dart';
import 'package:myapp/pages/admin/ad_confirm_wait/ad_confirm_wait_list_menu.dart';
import 'package:myapp/pages/admin/ad_declaration/ad_declaration_list_menu.dart';
import 'package:myapp/pages/admin/facility_modify/ad_facility_modify_menu.dart';
import 'package:myapp/pages/admin/ad_notice/ad_notice_list_menu.dart';
import 'package:myapp/pages/admin/ad_homepage/ad_home_page_menu.dart';
import 'package:myapp/pages/setting/setting_page.dart';

class MenuWidget extends StatelessWidget {
  final Function(String)? onItemClick;

  const MenuWidget({Key? key, this.onItemClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo.shade200,
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
            child: Image.asset(
              '/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/images/army.png',
              width: 100,
              height: 100
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'XXX 대대',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
                fontFamily: 'BalsamiqSans'),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(),
          sliderItem('홈 페이지', Icons.home, context),
          sliderItem('공지사항 관리', Icons.notifications_active, context),
          sliderItem('승인 대기', Icons.checklist, context),
          sliderItem('연등 관리', Icons.book, context),
          sliderItem('신고/문의 관리', Icons.question_answer_rounded, context),
          sliderItem('시설 예약기록', Icons.bar_chart_rounded, context),
          sliderItem('부대 시설 관리', Icons.border_color, context),
          sliderItem('앱 설정', Icons.settings, context),
          sliderItem('마이 페이지', Icons.person, context),
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
      if(icons == Icons.home){
        Get.to(ADHomePage());
      } else if(icons == Icons.notifications_active){
        Get.to(ADNoticeListPage());
      } else if(icons == Icons.checklist){
        Get.to(ADConfirmWaitListPage());
      } else if(icons == Icons.book){
        Get.to(ADNightManagePage());
      } else if(icons == Icons.border_color){
        Get.to(ADFacilityModifyPage());
      } else if(icons == Icons.question_answer_rounded){
        Get.to(ADDeclarationListPage());
      } else if(icons == Icons.bar_chart_rounded){
        Get.to(ADFacilityAnalysisPage());
      } else if(icons == Icons.settings){
        Get.to(SettingPage());
      } else if(icons == Icons.person){
        Get.to(ADMyPage());
      }else if(icons == Icons.logout){
        CoolAlert.show(
          context: context,
          type: CoolAlertType.confirm,
          text: "로그아웃 하시겠습니까?",
          confirmBtnColor: Colors.indigo.shade200,
          onConfirmBtnTap: () async {
            Get.to(ADHomePage());
          }
        );
      }
    }
  );
}