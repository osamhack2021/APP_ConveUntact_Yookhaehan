import 'package:flutter/widgets.dart';
import 'package:myapp/controller/notice_controller.dart';
import 'package:myapp/controller/unit_controller.dart';
import 'package:myapp/pages/home_page/draggable_home.dart';
import 'package:myapp/pages/admin/ad_post_notice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/notice_info.dart';
import 'package:myapp/components/custom_elevated_button.dart';
import 'package:cool_alert/cool_alert.dart';

class ADNoticeListScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

  // UnitController unit = Get.put(UnitController());
  // NoticeController n = Get.put(NoticeController(unitcode: unit.principal.value.unitcode!));

    return DraggableHome(
      title: Text("공지사항 목록"),
      headerWidget: headerWidget(context),
      body: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Padding(padding: EdgeInsets.all(10)),
            Text("공지사항 목록", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20)),
            Spacer(),
            Text("${notice.length}건의 내용 존재", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 10)),
            //1. Text("${n.notices.length}건의 내용 존재", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 10)),
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
              "공지사항 목록",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              )
            ),
            CircleAvatar(
              radius: 100,
              backgroundColor: Color(0x00000000),
              child: Image.asset(
                '/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/loudspeaker.png',
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
              text: "공지사항 작성하기",
              onPressed: () {
                Get.to(ADPostNoticeScreen());
              },
            ),
          ],
        ),
      ],
    ),
  );

  ListView listView() {
    //NoticeController n = Get.put(NoticeController());
    
    return ListView.builder(
      padding: EdgeInsets.only(top: 0),
      physics: NeverScrollableScrollPhysics(),
      itemCount: notice.length,
      //itemCount: n.notices.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Color(0x00000000),
            child: notice[index].icon,
            //child: Text("${n.notices[index].facility_picture}"),
          ),
          title: Text("${notice[index].name} / ${notice[index].date}", style: TextStyle(color: Colors.indigo.shade200, fontWeight: FontWeight.bold)),
          //title: Text("${n.notices[index].facility_name} (문의자: ${n.notices[index].user!.rank} ${n.notices[index].user!.username})", style: TextStyle(color: Colors.indigo.shade200, fontWeight: FontWeight.bold)),
          subtitle: Text(notice[index].intro),
          //subtitle: Text(n.notices[index].created!),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.create, color: Colors.indigo.shade200,),
                onPressed: (){
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.confirm,
                    text: "해당 공지를 수정하시겠습니까?",
                    confirmBtnColor: Colors.indigo.shade200,
                    onConfirmBtnTap: () async {
                      Get.to(ADPostNoticeScreen());
                    }
                  );
                }),
              IconButton(
                icon: Icon(Icons.delete, color: Colors.pink.shade100),
                onPressed: (){
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.confirm,
                    text: "해당 공지를 삭제하시겠습니까?",
                    confirmBtnColor: Colors.indigo.shade200,
                    onConfirmBtnTap: () async {
                      CoolAlert.show(
                        context: context,
                        type: CoolAlertType.success,
                        text: "공지가 삭제되었습니다.",
                        confirmBtnColor: Colors.indigo.shade200,
                        onConfirmBtnTap: () async {
                          Get.to(ADNoticeListScreen());
                        }
                      );
                    }
                  );
                }),
            ]
          )
        ),
      ),
    );
  }
}