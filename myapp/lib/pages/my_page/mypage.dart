import 'package:cool_alert/cool_alert.dart';   
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myapp/components/user_info.dart';
import 'package:flutter/material.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:myapp/pages/home_page/homepage_menu.dart';
import 'package:myapp/pages/my_page/mypage_menu.dart';

class MyPageScreen extends StatefulWidget {
  @override
  MyInfoList createState() => MyInfoList();
}
class MyInfoList extends State<MyPageScreen> {
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      title: Text("마이 페이지"),
      headerWidget: headerWidget(context),
      //headerBottomBar: headerBottomBarWidget(),
      body: [
        Row(
          children: [
            Padding(padding: EdgeInsets.all(10)),
            Text(
              "개인정보",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 20
              )
            ),
          ]
        ),
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
    color: Colors.pink.shade100,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          radius: 70,
          backgroundColor: Colors.white,
          child: Image.asset(
            '/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/soldier.png',
            width: 100,
            height: 100
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "일병 홍길동",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                //letterSpacing: 0.5,
                fontSize: 30,
              ),
            ),
            Text(
              "XX대대 X중대",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 0.5,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ],
    ),
  );

  ListView listView() {
    return ListView(
      padding: EdgeInsets.only(top: 0),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: <Widget>[
        ListTile(
          title: Text("소속", style: TextStyle(color: Colors.indigo.shade200, fontWeight: FontWeight.bold)),
          subtitle: Text(userInfo[0].unit, textAlign: TextAlign.right,),
          onTap: (){
            //modInfo(context, 0);
          }
        ),
        ListTile(
          title: Text("중대", style: TextStyle(color: Colors.indigo.shade200, fontWeight: FontWeight.bold)),
          subtitle: Text(userInfo[0].company, textAlign: TextAlign.right,),
          onTap: (){
            //modInfo(context, 0);
          }
        ),
        ListTile(
          title: Text("소속", style: TextStyle(color: Colors.indigo.shade200, fontWeight: FontWeight.bold)),
          subtitle: Text(userInfo[0].rank, textAlign: TextAlign.right,),
          onTap: (){
            //modInfo(context, 0);
          }
        ),
        ListTile(
          title: Text("소속", style: TextStyle(color: Colors.indigo.shade200, fontWeight: FontWeight.bold)),
          subtitle: Text(userInfo[0].name, textAlign: TextAlign.right,),
          onTap: (){
            //modInfo(context, 0);
          }
        ),
        ListTile(
          title: Text("소속", style: TextStyle(color: Colors.indigo.shade200, fontWeight: FontWeight.bold)),
          subtitle: Text(userInfo[0].id, textAlign: TextAlign.right,),
          onTap: (){
            //modInfo(context, 0);
          }
        ),
        ListTile(
          title: Text("소속", style: TextStyle(color: Colors.indigo.shade200, fontWeight: FontWeight.bold)),
          subtitle: Text(userInfo[0].email, textAlign: TextAlign.right,),
          onTap: (){
            //modInfo(context, 0);
          }
        ),
        ListTile(
          title: Text("소속", style: TextStyle(color: Colors.indigo.shade200, fontWeight: FontWeight.bold)),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.custom,
                      title: "비밀번호 변경",
                      //text: "복귀 / 취소 처리되었습니다.",
                      confirmBtnColor: Colors.indigo.shade200,
                    );
                  });
                },
                child: Text('비밀번호 변경'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.indigo.shade200),
                ),
              ),
            ]
          ),
        ),
      ],
    );
  }
}