import 'package:cool_alert/cool_alert.dart';   
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:myapp/controller/unit_controller.dart';
import 'package:myapp/controller/user_controller.dart';
import 'package:myapp/pages/home_page/homepage_menu.dart';
import 'package:myapp/pages/my_page/mypage_menu.dart';


class MyPageScreen extends StatelessWidget {
  
UserController u = Get.put(UserController());
UnitController unit = Get.put(UnitController());
  
  @override
  Widget build(BuildContext context) {
    //0. unit.findByCode(u.principal.value.unitcode!);
    return DraggableHome(
      title: Text("마이 페이지"),
      headerWidget: headerWidget(context),
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
    );
  }

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
            //1. u.principal.value.picture,
            width: 100,
            height: 100
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              //2. "${u.principal.value.rank} ${u.principal.value.username}",
              "일병 홍길동",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                //letterSpacing: 0.5,
                fontSize: 30,
              ),
            ),
            Text(
              //3. "${unit.principal.value.unitname}",
              "인방사",
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
    // user 정보 데이터 뿌리기 u.principal
    return ListView(
      children: [
        ListTile(
          title: Text("소속", style: TextStyle(color: Colors.pink.shade100, fontWeight: FontWeight.bold)),
          subtitle: Text("소속", textAlign: TextAlign.right,),
          //subtitle: Text(unit.principal.value.unitname, textAlign: TextAlign.right,),
        ),
        ListTile(
          title: Text("계급", style: TextStyle(color: Colors.pink.shade100, fontWeight: FontWeight.bold)),
          subtitle: Text("계급", textAlign: TextAlign.right,),
          //subtitle: Text(u.principal.value.rank, textAlign: TextAlign.right,),
        ),
        ListTile(
          title: Text("성명", style: TextStyle(color: Colors.pink.shade100, fontWeight: FontWeight.bold)),
          subtitle: Text("성명", textAlign: TextAlign.right,),
          //subtitle: Text(u.principal.value.username, textAlign: TextAlign.right,),
        ),
        ListTile(
          title: Text("군번", style: TextStyle(color: Colors.pink.shade100, fontWeight: FontWeight.bold)),
          subtitle: Text("군번", textAlign: TextAlign.right,),
          //subtitle: Text(u.principal.value.number, textAlign: TextAlign.right,),
        ),
        ListTile(
          title: Text("이메일", style: TextStyle(color: Colors.pink.shade100, fontWeight: FontWeight.bold)),
          subtitle: Text("이메일", textAlign: TextAlign.right,),
          //subtitle: Text(u.principal.value.email, textAlign: TextAlign.right,),
        ),
      ],
    );
  }
  // void modInfo(BuildContext context, int index){
  //   CoolAlert.show(
  //     context: context,
  //     type: CoolAlertType.confirm,
  //     text: "${info[index].name}을(를)\n수정 하시겠습니까?",
  //     confirmBtnColor: Colors.pink.shade200,
  //     onConfirmBtnTap: () async {
  //       var _message = '';
  //       CoolAlert.show(
  //         context: context,
  //         type: CoolAlertType.custom,
  //         barrierDismissible: true,
  //         confirmBtnText: '저장하기',
  //         widget: TextFormField(
  //           decoration: InputDecoration(
  //             hintText: '${info[index].name}을(를) 입력하세요.',
  //             prefixIcon: Icon(
  //               Icons.info,
  //             ),
  //           ),
  //           textInputAction: TextInputAction.next,
  //           keyboardType: TextInputType.phone,
  //           onChanged: (value) => _message = value,
  //         ),
  //         onConfirmBtnTap: () async {
  //           if (_message.length <= 0) {
  //             await CoolAlert.show(
  //               context: context,
  //               type: CoolAlertType.error,
  //               text: '아무것도 입력되지 않았습니다.',
  //             );
  //             return;
  //           }
  //           Navigator.of(context).pop();
  //           CoolAlert.show(
  //             context: context,
  //             type: CoolAlertType.success,
  //             text: "${info[index].name}이(가) '$_message' 로 변경되었습니다!",
  //           );
  //           //info[index].detail = _message;
  //         },
  //       );
  //     },
  //   );
  // }
}