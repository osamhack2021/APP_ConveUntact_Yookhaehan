import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myapp/components/scroll_menu/confirm_state_scroll_menu.dart';
import 'package:myapp/components/custom_elevated_button.dart';
import 'package:myapp/components/info/pc_info.dart';
import 'package:myapp/components/notice_info.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:myapp/components/textarea.dart';
import 'package:myapp/pages/admin/ad_confirm_wait/ad_confirm_wait_list_menu.dart';

class ADWriteCommentScreen extends StatefulWidget {
  @override
  _ADWriteCommentScreenState createState() => _ADWriteCommentScreenState();
}
class _ADWriteCommentScreenState extends State<ADWriteCommentScreen> {
  final _content = TextEditingController();
  TextEditingController startdateinput = TextEditingController();
  TextEditingController enddateinput = TextEditingController();
  @override
  void initState() {
    super.initState();
  }
  double InputDateWidth = 140.0;
  double InputDateHeight = 40.0;
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      title: Text("전달사항 작성"),
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
                    Text(
                      "승인 여부 : ",
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
                        ConfirmStateScrollMenu(
                          theme: Theme.of(context),
                        ),
                    // dropdownButton 끝
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "전달사항 : ",
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
                        hint: "+ 전 달 사 항 작 성",
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
                          text: "전달 사항이 전송되었습니다.",
                          confirmBtnColor: Colors.indigo.shade200,
                          onConfirmBtnTap: () async {
                            Get.to(ADConfirmWaitListPage());
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
    color: Colors.indigo.shade200,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "전달사항 작성",
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
                '/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/writing.png',
                width: 100,
                height: 100,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustromElevatedButton(
              text: "목록으로 돌아가기",
              onPressed: () {
                Get.to(ADConfirmWaitListPage());
              },
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