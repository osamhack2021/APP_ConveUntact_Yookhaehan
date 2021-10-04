   
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:draggable_home/draggable_home.dart';

class ReservKaraokeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      title: Text("X 중대 노래방"),
      headerWidget: headerWidget(context),
      //headerBottomBar: headerBottomBarWidget(),
      body: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "현재 이용 가능",
              style: TextStyle(
                fontSize: 30,
                color: Colors.grey,
                fontWeight: FontWeight.bold
              )
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              height: 50,
              width: double.infinity,
              child: RaisedButton(
              onPressed: (){
                //Get.to(InfoChangePage());
              },
              padding: EdgeInsets.all(10.0),
              child: Text('예약하기', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
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
    color: Colors.pink.shade100,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "X 중대 노래방",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                //letterSpacing: 0.5,
                fontSize: 40,
              )
            ),
          ],
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
  );

  ListView listView() {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 10),
          height: 40,
          child: Row(
            children: <Widget>[
              Text('lable${index}:  '),
              Expanded(
                child: ListView.builder(
                  scrollDirection:Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 40,
                      height: 40,
                      margin: EdgeInsets.only(right: 10),
                      color: Colors.grey,
                      alignment: Alignment.center,
                      child: Text('$index'),
                    );
                  },
                  itemCount: 6,
                ),
              )
            ],
          ),
        );
      },
      itemCount: 5,
    );
  }
}