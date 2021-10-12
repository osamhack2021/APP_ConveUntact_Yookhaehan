import 'package:cool_alert/cool_alert.dart';   
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myapp/components/user_info.dart';
import 'package:flutter/material.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:myapp/pages/home_page/homepage_menu.dart';
import 'package:myapp/pages/my_page/mypage_menu.dart';

class MyPageScreen extends StatelessWidget {
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
    return ListView.builder(
      padding: EdgeInsets.only(top: 0),
      physics: NeverScrollableScrollPhysics(),
      itemCount: info.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        //color: Colors.pink.shade100,
        child: ListTile(
          title: Text("${info[index].name}", style: TextStyle(color: Colors.pink.shade100, fontWeight: FontWeight.bold)),
          subtitle: Text(info[index].detail, textAlign: TextAlign.right,),
          onTap: (){
            modInfo(context, index);
          }
        ),
      ),
    );
  }
  void modInfo(BuildContext context, int index){
    CoolAlert.show(
      context: context,
      type: CoolAlertType.confirm,
      text: "${info[index].name}을(를)\n수정 하시겠습니까?",
      confirmBtnColor: Colors.pink.shade200,
      onConfirmBtnTap: () async {
        var _message = '';
        CoolAlert.show(
          context: context,
          type: CoolAlertType.custom,
          barrierDismissible: true,
          confirmBtnText: '저장하기',
          widget: TextFormField(
            decoration: InputDecoration(
              hintText: '${info[index].name}을(를) 입력하세요.',
              prefixIcon: Icon(
                Icons.info,
              ),
            ),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
            onChanged: (value) => _message = value,
          ),
          onConfirmBtnTap: () async {
            if (_message.length <= 0) {
              await CoolAlert.show(
                context: context,
                type: CoolAlertType.error,
                text: '아무것도 입력되지 않았습니다.',
              );
              return;
            }
            Navigator.of(context).pop();
            CoolAlert.show(
              context: context,
              type: CoolAlertType.success,
              text: "${info[index].name}이(가) '$_message' 로 변경되었습니다!",
            );
            //info[index].detail = _message;
          },
        );
      },
    );
  }
}