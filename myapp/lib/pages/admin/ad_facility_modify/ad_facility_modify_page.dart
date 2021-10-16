import 'package:flutter/widgets.dart';
import 'package:myapp/components/facility_info.dart';
import 'package:myapp/pages/admin/ad_facility_modify/computer/ad_1co_computer_modify.dart';
import 'package:myapp/pages/home_page/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cool_alert/cool_alert.dart';
class ADFacilityModifyScreen extends StatefulWidget {
  @override
  Selectdtail createState() => Selectdtail();
}
class Selectdtail extends State<ADFacilityModifyScreen> {
  List teamFacilityList = [];
  List personalFacilityList = [];
  String input = "";
  @override
  void initState() {
    for (int i = 0; i < teamFacility.length; i++) {
      teamFacilityList.add(
        teamFacility[i]
      );
    }
    for (int i = 0; i < personalFacility.length; i++) {
      personalFacilityList.add(
        personalFacility[i]
      );
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      title: Text("부대 시설관리"),
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
            Text("단체시설 목록", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20)),
            Spacer(),
            Text("${teamFacility.length}개의 시설 존재", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 10)),
            SizedBox(width: 6),
          ]
        ),
        Divider(),
        teamFacilityListView(),
        IconButton(
          icon: Icon(Icons.add_circle, color: Colors.indigo.shade200,),
          onPressed: (){
            input = "";
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("단체 이용시설 추가"),
                  content: TextField(
                    onChanged: (String value) {
                      input = value;
                    },
                  ),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          teamFacilityList.add(
                            Facility(
                              icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/question.png'),
                              name: input,
                              intro: "전 중대 사용 가능"
                            ),
                          );
                        });
                        Navigator.of(context).pop(); // input 입력 후 창 닫히도록
                      },
                      child: Text("추가하기")
                    ),
                    //RaisedButton(
                      //onPressed: () {
                        //print(teamFacilityList);
                        //Get.to(ADFacilityModifyPage());
                      //},
                      //child: Text('저장하기')
                    //),
                  ],
                );
              }
            );
          }
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Padding(padding: EdgeInsets.all(10)),
            Text(
              "개인시설 목록",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 20
              )
            ),
            Spacer(),
            Text(
              "${personalFacilityList.length}개의 시설 존재",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 10
              )
            ),
            SizedBox(width: 6),
          ]
        ),
        Divider(),
        personalFacilityListView(),
        IconButton(
          icon: Icon(Icons.add_circle, color: Colors.indigo.shade200,),
          onPressed: (){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("개인 이용시설 추가"),
                  content: TextField(
                    onChanged: (String value) {
                      input = value;
                    },
                  ),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          personalFacilityList.add(
                            Facility(
                              icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/question.png'),
                              name: input,
                              intro: "X 중대 사용 가능"
                            ),
                          );
                        });
                        Navigator.of(context).pop(); // input 입력 후 창 닫히도록
                      },
                      child: Text("추가하기")
                    ),
                    //RaisedButton(
                      //onPressed: () {
                        //print(teamFacilityList);
                        //Get.to(ADFacilityModifyPage());
                      //},
                      //child: Text('저장하기')
                    //),
                  ],
                );
              }
            );
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
              "부대 시설관리",
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
  ListView teamFacilityListView() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 0),
      physics: NeverScrollableScrollPhysics(),
      itemCount: teamFacilityList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Color(0x00000000),
            child: teamFacilityList[index].icon,
          ),
          title: Text("${teamFacilityList[index].name}", style: TextStyle(color: Colors.indigo.shade200, fontWeight: FontWeight.bold)),
          subtitle: Text(teamFacilityList[index].intro),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.delete, color: Colors.pink.shade100),
                onPressed: (){
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.success,
                    title: "${teamFacilityList[index].name}",
                    text: "해당 시설을 삭제했습니다.",
                    confirmBtnColor: Colors.indigo.shade200,
                  );
                  setState(() {
                    teamFacilityList.removeAt(index);
                  });
                }),
            ]
          )
        ),
      ),
    );
  }
    ListView personalFacilityListView() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 0),
      physics: NeverScrollableScrollPhysics(),
      itemCount: personalFacilityList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Color(0x00000000),
            child: personalFacilityList[index].icon,
          ),
          title: Text("${personalFacilityList[index].name}", style: TextStyle(color: Colors.indigo.shade200, fontWeight: FontWeight.bold)),
          subtitle: Text(personalFacilityList[index].intro),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.create, color: Colors.indigo.shade200,),
                onPressed: (){
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.confirm,
                    title: "${personalFacilityList[index].name}",
                    text: "해당 시설의 세부 정보를 수정하시겠습니까?",
                    confirmBtnColor: Colors.indigo.shade200,
                    onConfirmBtnTap: () async {
                      Get.to(AD1COComputerModifyScreen());
                    }
                  );
                }),
              IconButton(
                icon: Icon(Icons.delete, color: Colors.pink.shade100),
                onPressed: (){
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.success,
                    title: "${personalFacilityList[index].name}",
                    text: "해당 시설을 삭제했습니다.",
                    confirmBtnColor: Colors.indigo.shade200,
                  );
                  setState(() {
                    personalFacilityList.removeAt(index);
                  });
                }),
            ]
          )
        ),
      ),
    );
  }
}