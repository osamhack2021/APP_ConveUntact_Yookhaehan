import 'package:flutter/widgets.dart';
import 'package:myapp/pages/home_page/draggable_home.dart';
import 'package:myapp/pages/admin/ad_notice/ad_post_notice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/notice_info.dart';
import 'package:myapp/components/custom_elevated_button.dart';
import 'package:cool_alert/cool_alert.dart';
class ADNoticeListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      title: Text("공지사항 목록"),
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
            Text("공지사항 목록", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20)),
            Spacer(),
            Text("${notice.length}건의 내용 존재", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 10)),
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
              "공지사항 목록",
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
      itemCount: notice.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Color(0x00000000),
            child: notice[index].icon,
          ),
          title: Text("${notice[index].name} / ${notice[index].date}", style: TextStyle(color: Colors.indigo.shade200, fontWeight: FontWeight.bold)),
          subtitle: Text(notice[index].intro),
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