import 'package:flutter/widgets.dart';
import 'package:myapp/pages/home_page/draggable_home.dart';
import 'package:myapp/pages/admin/declaration/ad_reply_declaration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cool_alert/cool_alert.dart';

class ADDeclarationListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      title: Text("신고 / 문의 접수 내역"),
      //actions: [
        //IconButton(onPressed: () {}, icon: Icon(Icons.person, color: Colors.white,)),
      //],
      headerWidget: headerWidget(context),
      //headerBottomBar: headerBottomBarWidget(),
      body: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Padding(padding: EdgeInsets.all(10)),
            Text("신고 / 문의 접수 내역", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20)),
            Spacer(),
            Text("${declarationList.length}건의 내용 존재", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 10)),
            SizedBox(width: 6),
          ]
        ),
        Divider(),
        listView(),
      ],
      //fullyStretchable: true,
      //expandedBody: Text("Expanded"),
    );
  }

  //Container headerBottomBarWidget() {
    //return Container(
      //child: Row(
        //mainAxisSize: MainAxisSize.min,
        //mainAxisAlignment: MainAxisAlignment.end,
        //crossAxisAlignment: CrossAxisAlignment.center,
        //children: [//설정 아이콘
          //IconButton(onPressed: () {}, icon: Icon(Icons.person, color: Colors.white),),
        //],
      //),
    //);
  //}

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
                fontSize: 30,
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
        //Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          //children: <Widget>[
            //Padding(
              //padding: const EdgeInsets.only(bottom: 12),
                //child: ScrollPhysicsMenuButton(
                  //theme: Theme.of(context),
                //),
            //),
          //],
        //),
      ],
    ),
  );

  ListView listView() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 0),
      physics: NeverScrollableScrollPhysics(),
      itemCount: declarationList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Color(0x00000000),
            child: declarationList[index].icon,
          ),
          title: Text("${declarationList[index].facility} (문의자: ${declarationList[index].user})", style: TextStyle(color: Colors.indigo.shade200, fontWeight: FontWeight.bold)),
          subtitle: Text(declarationList[index].date),
          onTap:(){
            CoolAlert.show(
              context: context,
              type: CoolAlertType.confirm,
              title: "${declarationList[index].facility}",
              text: "${declarationList[index].detail}",
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
  final String facility;
  final String date;
  final String detail;
  final String user;

  Declaration(
    {required this.icon, required this.facility, required this.date, required this.detail, required this.user});
}

List<Declaration> declarationList = [
  Declaration(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/soccer.png'),
    facility: "풋살장",
    date: "2021년 10월 12일",
    detail: "현재 예약중이라고 표시되어있는데 아무도 사용하고 있지 않습니다.",
    user: "1CO 일병 홍길동"
  ),
  Declaration(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/computer.png'),
    facility: "3CO 사이버 지식 정보방",
    date: "2021년 10월 12일",
    detail: "3번 자리 PC가 인터넷 연결이 안됩니다.",
    user: "3CO 상병 장발장"
  ),
  Declaration(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/football.png'),
    facility: "족구장",
    date: "2021년 10월 12일",
    detail: "현재 1중대가 사용중인데 양해를 구하여 밀어내기로 같이 게임하기로 하였습니다. 사용가능하겠습니까?",
    user: "2CO 병장 손흥민"
  ),
];