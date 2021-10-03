   
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myapp/pages/home_page/home_page.dart';
import 'package:myapp/pages/my_page/user_info.dart';
import 'package:myapp/pages/home_page/draggable_home.dart';
import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
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
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: MaterialButton(
            color: Colors.pink.shade100,
            minWidth: double.infinity,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: (){
              setState(){
                Get.to(HomePage());
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                "수정하기",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
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