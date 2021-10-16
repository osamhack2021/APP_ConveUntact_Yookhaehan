import 'package:cool_alert/cool_alert.dart';   
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/components/user_info.dart';
import 'package:flutter/material.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:myapp/pages/admin/ad_my_page/ad_mypage_menu.dart';
import 'package:get/get.dart';

class ADMyPageScreen extends StatefulWidget {
  @override
  ADMyInfoList createState() => ADMyInfoList();
}
class ADMyInfoList extends State<ADMyPageScreen> {
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
    color: Colors.indigo.shade200,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          radius: 70,
          backgroundColor: Colors.white,
          child: userInfo[0].profile == null ? Image.asset(
            '/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/images/army.png',
            width: 100,
            height: 100
          ) : userInfo[0].profile,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${userInfo[0].rank} ${userInfo[0].name}",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                //letterSpacing: 0.5,
                fontSize: 30,
              ),
            ),
            Text(
              "${userInfo[0].unit} ${userInfo[0].company}",
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
    String input ="";
    return ListView(
      padding: EdgeInsets.only(top: 0),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: <Widget>[
        ListTile(
          title: Text("소속", style: TextStyle(color: Colors.indigo.shade200, fontWeight: FontWeight.bold)),
          subtitle: Text(userInfo[0].unit, textAlign: TextAlign.right,),
          onTap: (){
            input = "";
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("변경할 소속 입력"),
                  content: TextField(
                    onChanged: (String value) {
                      input = value;
                    },
                  ),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          userInfo[0].email = input;
                        });
                        Navigator.of(context).pop(); // input 입력 후 창 닫히도록
                      },
                      child: Text("변경하기")
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
        ListTile(
          title: Text("중대", style: TextStyle(color: Colors.indigo.shade200, fontWeight: FontWeight.bold)),
          subtitle: Text(userInfo[0].company, textAlign: TextAlign.right,),
          onTap: (){
            input = "";
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("변경할 중대 입력"),
                  content: TextField(
                    onChanged: (String value) {
                      input = value;
                    },
                  ),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          userInfo[0].email = input;
                        });
                        Navigator.of(context).pop(); // input 입력 후 창 닫히도록
                      },
                      child: Text("변경하기")
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
        ListTile(
          title: Text("계급", style: TextStyle(color: Colors.indigo.shade200, fontWeight: FontWeight.bold)),
          subtitle: Text(userInfo[0].rank, textAlign: TextAlign.right,),
          onTap: (){
            input = "";
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("변경할 계급 입력"),
                  content: TextField(
                    onChanged: (String value) {
                      input = value;
                    },
                  ),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          userInfo[0].email = input;
                        });
                        Navigator.of(context).pop(); // input 입력 후 창 닫히도록
                      },
                      child: Text("변경하기")
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
        ListTile(
          title: Text("이름", style: TextStyle(color: Colors.indigo.shade200, fontWeight: FontWeight.bold)),
          subtitle: Text(userInfo[0].name, textAlign: TextAlign.right,),
          onTap: (){
            input = "";
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("변경할 이름 입력"),
                  content: TextField(
                    onChanged: (String value) {
                      input = value;
                    },
                  ),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          userInfo[0].email = input;
                        });
                        Navigator.of(context).pop(); // input 입력 후 창 닫히도록
                      },
                      child: Text("변경하기")
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
        ListTile(
          title: Text("군번", style: TextStyle(color: Colors.indigo.shade200, fontWeight: FontWeight.bold)),
          subtitle: Text(userInfo[0].id, textAlign: TextAlign.right,),
          onTap: (){
            input = "";
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("변경할 군번 입력"),
                  content: TextField(
                    onChanged: (String value) {
                      input = value;
                    },
                  ),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          userInfo[0].email = input;
                        });
                        Navigator.of(context).pop(); // input 입력 후 창 닫히도록
                      },
                      child: Text("변경하기")
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
        ListTile(
          title: Text("이메일", style: TextStyle(color: Colors.indigo.shade200, fontWeight: FontWeight.bold)),
          subtitle: Text(userInfo[0].email, textAlign: TextAlign.right,),
          onTap: (){
            input = "";
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("변경할 이메일 입력"),
                  content: TextField(
                    onChanged: (String value) {
                      input = value;
                    },
                  ),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          userInfo[0].email = input;
                        });
                        Navigator.of(context).pop(); // input 입력 후 창 닫히도록
                      },
                      child: Text("변경하기")
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
        ListTile(
          title: Text("비밀번호", style: TextStyle(color: Colors.indigo.shade200, fontWeight: FontWeight.bold)),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ElevatedButton(
                onPressed: (){
                  input = "";
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("변경할 이메일 입력"),
                        content: TextField(
                          onChanged: (String value) {
                            input = value;
                          },
                        ),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () {
                              setState(() {
                                userInfo[0].email = input;
                              });
                              Navigator.of(context).pop(); // input 입력 후 창 닫히도록
                            },
                            child: Text("변경하기")
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
                },
                child: Text('비밀번호 변경'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.indigo.shade200),
                ),
              ),
            ]
          ),
        ),
      ],
    );
  }
}