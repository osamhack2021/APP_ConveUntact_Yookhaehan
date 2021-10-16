import 'package:flutter/widgets.dart';
import 'package:myapp/components/line_chart_1.dart';
import 'package:myapp/controller/declaration_controller.dart';
import 'package:myapp/controller/unit_controller.dart';
import 'package:myapp/pages/home_page/draggable_home.dart';
import 'package:myapp/pages/admin/ad_reply_declaration.dart';
import 'package:myapp/pages/admin/ad_notice_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/notice_info.dart';
import 'package:myapp/components/custom_elevated_button.dart';
import 'package:cool_alert/cool_alert.dart';

class ADDeclarationListScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

  // UnitController unit = Get.put(UnitController());
  // DeclarationController d = Get.put(DeclarationController());
  // d.findByUnitCode(unit.principal.value.unitcode!);
  
    return DraggableHome(
      title: Text("신고 / 문의 접수 내역"),
      headerWidget: headerWidget(context),
      body: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Padding(padding: EdgeInsets.all(10)),
            Text("신고 / 문의 접수 내역", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20)),
            Spacer(),
            Text("${declarationList.length}건의 내용 존재", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 10)),
            //1. Text("${d.declarations.length}건의 내용 존재", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 10)),
            SizedBox(width: 6),
          ]
        ),
        Divider(),
        listView(),
      ],
    );
  }

  Container headerWidget(BuildContext context) => Container(
    color: Colors.indigo.shade200,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "신고 / 문의 접수 내역",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                //letterSpacing: 0.5,
                fontSize: 35,
              )
            ),
            CircleAvatar(
              radius: 100,
              backgroundColor: Color(0x00000000),
              child: Image.asset(
                '/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/siren.png',
                width: 100,
                height: 100,
              ),
            ),
          ],
        ),
      ],
    ),
  );

  ListView listView() {
    //DeclarationController d = Get.put(DeclarationController());
    return ListView.builder(
      padding: EdgeInsets.only(top: 0),
      physics: NeverScrollableScrollPhysics(),
      itemCount: declarationList.length,
      //itemCount: d.declarations.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Color(0x00000000),
            child: declarationList[index].icon,
            //child: Text("${d.declarations[index].facility_picture}"),
          ),
          title: Text("${declarationList[index].declaration} (문의자: ${declarationList[index].user})", style: TextStyle(color: Colors.indigo.shade200, fontWeight: FontWeight.bold)),
          //title: Text("${d.declarations[index].facility_name} (문의자: ${d.declarations[index].user!.rank} ${d.declarations[index].user!.username})", style: TextStyle(color: Colors.indigo.shade200, fontWeight: FontWeight.bold)),
          subtitle: Text(declarationList[index].date),
          //subtitle: Text(d.declarations[index].created!),
          onTap:(){
            CoolAlert.show(
                          context: context,
                          type: CoolAlertType.confirm,
                          title: "${declarationList[index].declaration}",
                          text: "${declarationList[index].detail}",
                          //1. title: "${d.declarations[index].facility_name}",
                          //1. text: "${d.declarations[index].contents}",
                          confirmBtnText: "답변하기",
                          confirmBtnColor: Colors.indigo.shade200,
                          onConfirmBtnTap: () async {
                            Get.to(ADReplyDeclarationScreen());
                          }
                        );
          },
        ),
      ),
    );
  }
}

class Declaration{
  final Image icon;
  final String declaration;
  final String date;
  final String detail;
  final String user;

  Declaration(
    {required this.icon, required this.declaration, required this.date, required this.detail, required this.user});
}

List<Declaration> declarationList = [
  Declaration(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/soccer.png'),
    declaration: "풋살장",
    date: "2021년 10월 12일",
    detail: "현재 예약중이라고 표시되어있는데 아무도 사용하고 있지 않습니다.",
    user: "1CO 일병 홍길동"
  ),
  Declaration(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/computer.png'),
    declaration: "3CO 사이버 지식 정보방",
    date: "2021년 10월 12일",
    detail: "3번 자리 PC가 인터넷 연결이 안됩니다.",
    user: "3CO 상병 장발장"
  ),
  Declaration(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/football.png'),
    declaration: "족구장",
    date: "2021년 10월 12일",
    detail: "현재 1중대가 사용중인데 양해를 구하여 밀어내기로 같이 게임하기로 하였습니다. 사용가능하겠습니까?",
    user: "2CO 병장 손흥민"
  ),
];