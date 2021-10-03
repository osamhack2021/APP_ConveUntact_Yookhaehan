   
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myapp/pages/home_page/homepage_menu.dart';
import 'package:myapp/components/user_info.dart';
import 'package:flutter/material.dart';
import 'package:draggable_home/draggable_home.dart';

class MyPageScreen extends StatelessWidget {
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
        Column(
          children: <Widget>[
            Container(
              height: 50,
              width: double.infinity,
              child: RaisedButton(
              onPressed: (){
                Get.to(HomePage());
              },
              padding: EdgeInsets.all(10.0),
              child: Text('수정하기', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              textColor: Colors.white,
              color: Colors.pink.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))
              ),
            ),
            )
          ],
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
    color: Colors.pink.shade200,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          radius: 100,
          backgroundColor: Colors.white,
          child: Icon(Icons.person), foregroundColor: Colors.grey,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "일병 홍길동",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                //letterSpacing: 0.5,
                fontSize: 40,
              ),
            ),
            Text(
              "XX대대 X중대",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 0.5,
                fontSize: 30,
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
      itemCount: info.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        //color: Colors.pink.shade100,
        child: ListTile(
          title: Text("${info[index].name}", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
          subtitle: Text(info[index].detail, textAlign: TextAlign.right,),
          
        ),
      ),
    );
  }
}