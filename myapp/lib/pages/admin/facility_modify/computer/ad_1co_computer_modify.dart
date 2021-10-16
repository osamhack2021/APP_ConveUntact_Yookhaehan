import 'package:flutter/widgets.dart';
import 'package:myapp/components/pc_info.dart';
import 'package:myapp/pages/home_page/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';

class AD1COComputerModifyScreen extends StatefulWidget {
  @override
  Selectdtail createState() => Selectdtail();
}

class Selectdtail extends State<AD1COComputerModifyScreen> {
  List computer1COList = [];
  String input = "";

  @override
  void initState() {
    for (int i = 0; i < computer1COList.length; i++) {
      computer1COList.add(
        computer_1co[i]
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      title: Text("1CO 사이버지식정보방 컴퓨터 목록"),
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
            Text("1CO 사이버지식정보방 컴퓨터 목록", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20)),
            Spacer(),
            Text("${computer1COList.length}개의 좌석 존재", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 10)),
            SizedBox(width: 6),
          ]
        ),
        Divider(),
        computer1COListView(),
        IconButton(
          icon: Icon(Icons.add_circle, color: Colors.indigo.shade200,),
          onPressed: (){
            setState(() {
              computer1COList.add(
                ComputerInfo(
                  id: computer1COList.length,
                  os: "Window",
                  isuse: false,
                ),
              );
            });
          }
        ),
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
              "부대 시설목록",
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
                '/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/modify.png',
                width: 100,
                height: 100,
              ),
            ),
          ],
        ),
        //Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          //children: [
            //CustromElevatedButton(
              //text: "공지사항 작성하기",
              //onPressed: () {
                //Get.to(ADPostNoticeScreen());
              //},
            //),
          //],
        //),
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

  ListView computer1COListView() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 0),
      physics: NeverScrollableScrollPhysics(),
      itemCount: computer1COList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Color(0x00000000),
            child: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/computer.png'),
          ),
          title: Text("${computer1COList[index].id+1}번 PC", style: TextStyle(color: Colors.indigo.shade200, fontWeight: FontWeight.bold)),
          subtitle: Text(computer1COList[index].os),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.delete, color: Colors.pink.shade100),
                onPressed: (){
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.success,
                    title: "${computer1COList[index].id+1}번 PC (${computer1COList[index].os})",
                    text: "해당 좌석을 삭제했습니다.",
                    confirmBtnColor: Colors.indigo.shade200,
                  );
                  setState(() {
                    computer1COList.removeAt(index);
                  });
                }),
            ]
          )
        ),
      ),
    );
  }
}