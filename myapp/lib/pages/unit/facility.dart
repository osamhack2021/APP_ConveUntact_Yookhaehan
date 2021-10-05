import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:myapp/pages/component/appbar.dart';
import 'package:myapp/size.dart';

class FacilityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      title: Text("세계최강 한국부대"),
      headerWidget: headerWidget(context),
      //headerBottomBar: headerBottomBarWidget(),
      backgroundColor: Colors.white,
      body: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "단체 이용시설",
                    style: TextStyle(
                        color: Colors.pink[100],
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Divider(
                    thickness: 1, // 두께
                    color: Colors.pink[100],
                  )
                ],
              ),
              listView(),
              Column(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: getButtonWidth(context),
                    child: RaisedButton(
                      onPressed: () {
                        //Get.to(HomePage());
                      },
                      padding: EdgeInsets.all(10.0),
                      child: Text('수정하기',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      textColor: Colors.white,
                      color: Colors.indigo[200],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                    ),
                  ),
                ],
              ),
            ],
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
        color: Colors.indigo[200],
        child: Column(
          children: [
            CustomAppbar(),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person),
                    foregroundColor: Colors.white,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "세계최강 한국부대",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          //letterSpacing: 0.5,
                          fontSize: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  ListView listView() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: 7,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        elevation: 0.0,
        //color: Colors.pink.shade100,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: Image.asset("assets/basketball.png"),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("농구장",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  Text(
                    "모든 중대 이용가능 시설",
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              Spacer(),
              Icon(
                Icons.edit,
                color: Colors.indigo[200],
                size: 25.0,
              ),
              Icon(
                Icons.delete,
                color: Colors.indigo[200],
                size: 25.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
