import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myapp/components/custom_elevated_button.dart';
import 'package:myapp/components/pc_info.dart';
import 'package:myapp/components/notice_info.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:myapp/components/scroll_menu_button.dart';
import 'package:myapp/components/textarea.dart';
import 'package:myapp/controller/declaration_controller.dart';
import 'package:myapp/controller/facility_controller.dart';
import 'package:myapp/controller/unit_controller.dart';
import 'package:myapp/controller/user_controller.dart';
import 'package:myapp/domain/declaration/declaration.dart';
import 'package:myapp/pages/home_page/homepage_menu.dart';

import 'package:flutter/material.dart';
import 'package:menu_button/menu_button.dart';

late String selectedKey;

class DeclarationScreen extends StatelessWidget {
  //text editing controller for text field
  final _content = TextEditingController();
  // UserController user = Get.put(UserController());
  // UnitController unit = Get.put(UnitController());
  // DeclarationController d = Get.put(DeclarationController());

  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      title: Text("예약 문의/신고"),

      headerWidget: headerWidget(context),

      body: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "시설 : ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                    // dropdownButton
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ScrollPhysicsMenuButton(),
                    // dropdownButton 끝
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "신고 / 문의 내용 : ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    //입력 필드
                    Expanded(
                      child: CustomTextArea(
                        controller: _content,
                        hint: "+ 사 유 작 성",
                        funValidator: null,
                        bordercolor: Colors.pink.shade100,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustromElevatedButton(
                      text: "작성 완료",
                      onPressed: () {
                        CoolAlert.show(
                          context: context,
                          type: CoolAlertType.success,
                          text: "신고/문의가 접수되었습니다.",
                          confirmBtnColor: Colors.pink.shade200,
                          onConfirmBtnTap: () async {
                            // Declaration newDeclaration = Declaration(
                            //   user : user.principal.value,
                            //   unitcode : unit.principal.value.unitcode,
                            //   facility_name : selectedKey,
                            //   //facility_picture : selectedImage, // 이미지 추가 요망
                            //   contents : _content.text.toString(),
                            // );
                            // await d.add(newDeclaration);
                            Get.to(HomePage());
                          }
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
      //fullyStretchable: true,
      //expandedBody: Text("Expanded"),
    );
  }
  Container headerBottomBarWidget() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [//설정 아이콘
          IconButton(onPressed: () {}, icon: Icon(Icons.person, color: Colors.white),),
        ],
      ),
    );
  }
  Container headerWidget(BuildContext context) => Container(
    color: Colors.pink.shade100,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "예약 문의/신고",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                //letterSpacing: 0.5,
                fontSize: 40,
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
  ListView listView_1computer() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 0),
      physics: NeverScrollableScrollPhysics(),
      itemCount: notice.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.pink.shade100,
            child: notice[index].icon, foregroundColor: Colors.white,
          ),
          title: Text("${computer_1co[index].name} / ${computer_1co[index].os}", style: TextStyle(color: Colors.pink.shade100, fontWeight: FontWeight.bold)),
          subtitle: Text(computer_1co[index].isuse ? "사용 불가" : "사용 가능",),
        ),
      ),
    );
  }
  ListView listView_2computer() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 0),
      physics: NeverScrollableScrollPhysics(),
      itemCount: notice.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.pink.shade100,
            child: notice[index].icon, foregroundColor: Colors.white,
          ),
          title: Text("${computer_2co[index].name} / ${computer_2co[index].os}", style: TextStyle(color: Colors.pink.shade100, fontWeight: FontWeight.bold)),
          subtitle: Text(computer_2co[index].isuse ? "사용 불가" : "사용 가능",),
        ),
      ),
    );
  }
  ListView listView_3computer() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 0),
      physics: NeverScrollableScrollPhysics(),
      itemCount: notice.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.pink.shade100,
            child: notice[index].icon, foregroundColor: Colors.white,
          ),
          title: Text("${computer_2co[index].name} / ${computer_2co[index].os}", style: TextStyle(color: Colors.pink.shade100, fontWeight: FontWeight.bold)),
          subtitle: Text(computer_2co[index].isuse ? "사용 불가" : "사용 가능",),
        ),
      ),
    );
  }
}

class ScrollPhysicsMenuButton extends StatefulWidget {
  
  @override
  _ScrollPhysicsMenuButtonState createState() =>
      _ScrollPhysicsMenuButtonState();
}
class _ScrollPhysicsMenuButtonState extends State<ScrollPhysicsMenuButton> {
  List<String> keys = <String>[
    '풋살장',
    '농구장',
    '족구장',
    '연병장',
    '탁구장',
    '다목적실',
    '독서실',
    '1CO 사이버지식정보방',
    '2CO 사이버지식정보방',
    '3CO 사이버지식정보방',
    '1CO 노래방',
    '2CO 노래방',
    '3CO 노래방',
  ];
  @override
  void initState() {
    selectedKey = keys[0];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    // FacilityController f = Get.put(FacilityController());
    // UserController user = Get.put(UserController());
    // f.findByUnitCode(user.principal.value.unitcode!);
    
    // List<String> keys = f.facilitys.value.map((e) => e.name).toString() as List<String>;

    final Widget scrollChildButton = SizedBox(
      width: 300,
      height: 40,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 11),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Text(
                selectedKey,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              width: 12,
              height: 17,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MenuButton<String>(
          menuButtonBackgroundColor: Color(0x3dffffff),
          child: scrollChildButton,
          items: keys,
          topDivider: true,
          scrollPhysics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (String value) => Container(
            height: 40,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16),
            child: Text(value),
          ),
          toggledChild: Container(
            child: scrollChildButton,
          ),
          divider: Container(
            height: 1,
            color: Colors.grey,
          ),
          onItemSelected: (String value) {
            setState(() {
              selectedKey = value;
            });
          },
          decoration: BoxDecoration(
            //border: Border.all(color: Colors.grey[300]!),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            )
          ),
          onMenuButtonToggle: (bool isToggle) {
            print(isToggle);
          },
        ),
      ],
    );
  }
}