import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myapp/components/custom_elevated_button.dart';
import 'package:myapp/components/pc_info.dart';
import 'package:myapp/components/notice_info.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:myapp/components/textarea.dart';
import 'package:myapp/pages/admin/ad_declaration/ad_declaration_list.dart';
import 'package:myapp/pages/admin/ad_declaration/ad_declaration_list_menu.dart';

class ADReplyDeclarationScreen extends StatelessWidget {
  //text editing controller for text field
  final _content = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      title: Text("답변 작성"),
      //actions: [
        //IconButton(onPressed: () {}, icon: Icon(Icons.person, color: Colors.white,)),
      //],
      headerWidget: headerWidget(context),
      //headerBottomBar: headerBottomBarWidget(),
      body: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "답변 작성 : ",
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
                        hint: "+ 답 변 내 용 작 성",
                        funValidator: null,
                        bordercolor: Colors.indigo.shade200,
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
                          text: "답변이 등록되었습니다.",
                          confirmBtnColor: Colors.indigo.shade200,
                          onConfirmBtnTap: () async {
                            Get.to(ADDeclarationListScreen());
                          }
                        );
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustromElevatedButton(
                      text: "목록으로 돌아가기",
                      onPressed: () {
                        Get.to(ADDeclarationListPage());
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
    color: Colors.indigo.shade200,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "신고 / 문의 답변 작성",
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
                '/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/writing.png',
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
            backgroundColor: Colors.indigo.shade200,
            child: notice[index].icon, foregroundColor: Colors.white,
          ),
          title: Text("${computer_1co[index].id}번 PC / ${computer_1co[index].os}", style: TextStyle(color: Colors.indigo.shade200, fontWeight: FontWeight.bold)),
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
            backgroundColor: Colors.indigo.shade200,
            child: notice[index].icon, foregroundColor: Colors.white,
          ),
          title: Text("${computer_2co[index].id}번 PC / ${computer_2co[index].os}", style: TextStyle(color: Colors.indigo.shade200, fontWeight: FontWeight.bold)),
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
            backgroundColor: Colors.indigo.shade200,
            child: notice[index].icon, foregroundColor: Colors.white,
          ),
          title: Text("${computer_2co[index].id}번 PC / ${computer_2co[index].os}", style: TextStyle(color: Colors.indigo.shade200, fontWeight: FontWeight.bold)),
          subtitle: Text(computer_2co[index].isuse ? "사용 불가" : "사용 가능",),
        ),
      ),
    );
  }
}