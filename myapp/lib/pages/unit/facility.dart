import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:myapp/size.dart';
class FacilityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      title: Text("unit facilitys"),
      headerWidget: headerWidget(context),
      //headerBottomBar: headerBottomBarWidget(),
      body: [
        Row(
          children: [
            Padding(padding: EdgeInsets.all(10)),
            Text(
              "facilitys",
              style: TextStyle(
                  color: Colors.pink[100],
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
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
                child: Text('modifiy',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                textColor: Colors.white,
                color: Colors.indigo[200],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
              ),
            ),
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
        color: Colors.indigo[200],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white,
              child: Icon(Icons.person),
              foregroundColor: Colors.grey,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "this is unitname",
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
      );

  ListView listView() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 0),
      physics: NeverScrollableScrollPhysics(),
      itemCount: 5,
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 5.0,
        ),
        child: Card(
          elevation: 0.0,
          //color: Colors.pink.shade100,
          child: Row(children: [
            SizedBox(
              height: 50,
              width: 50,
              child: Image.asset("assets/basketball.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("facility name",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  Text(
                    "all unit available",
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
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
          ]),
        ),
      ),
    );
  }
}
