import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:myapp/components/facility_info.dart';
import 'package:myapp/pages/admin/ad_facility_modify/computer/ad_1co_computer_modify.dart';
import 'package:get/get.dart';

class ADCompanyKaraokeModifyScreen extends StatefulWidget {
  @override
  _ADCompanyKaraokeModifyScreenState createState() => _ADCompanyKaraokeModifyScreenState();
}

class _ADCompanyKaraokeModifyScreenState extends State<ADCompanyKaraokeModifyScreen> {
  String input = "";

  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      title: Text("노래방"),
      headerWidget: headerWidget(context),
      //headerBottomBar: headerBottomBarWidget(),
      body: [
        listView(),
        IconButton(
          icon: Icon(Icons.add_circle, color: Colors.indigo.shade200,),
          onPressed: (){
            input = "";
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("추가할 중대 숫자(글자)만 입력"),
                  content: TextField(
                    onChanged: (String value) {
                      input = value;
                    },
                  ),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          personalFacility[0].company!.add(
                            Facility(
                              icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/question.png'),
                              name: "${input}CO 노래방",
                              intro: "${input}중대 사용 가능"
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
              "노래방",
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
                '/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/karaoke.png',
                width: 100,
                height: 100,
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
      itemCount: personalFacility[1].company!.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white,
        child: ListTile(
          //leading: CircleAvatar(
            //backgroundColor: Color(0x00000000),
            //child: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/computer.png'),
          //),
          title: Text("${personalFacility[1].company![index].name}", style: TextStyle(color: Colors.indigo.shade200, fontWeight: FontWeight.bold)),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.create, color: Colors.indigo.shade200,),
                onPressed: (){
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.confirm,
                    title: "${personalFacility[1].company![index].name}",
                    text: "해당 시설의 세부 정보를 수정하시겠습니까?",
                    confirmBtnColor: Colors.indigo.shade200,
                    onConfirmBtnTap: () async {
                      Get.to(AD1COComputerModifyScreen()); //노래방 수정
                    }
                  );
                }),
              IconButton(
                icon: Icon(Icons.delete, color: Colors.pink.shade100),
                onPressed: (){
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.success,
                    title: "${personalFacility[1].company![index].name}",
                    text: "해당 시설을 삭제했습니다.",
                    confirmBtnColor: Colors.indigo.shade200,
                  );
                  setState(() {
                    personalFacility[1].company!.removeAt(index);
                  });
                }),
            ]
          )
        ),
      ),
    );
  }
}