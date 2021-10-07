import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:intl/intl.dart';
import 'package:myapp/component/custom_textarea.dart';
import 'package:myapp/pages/component/appbar.dart';
import 'package:myapp/size.dart';
import 'package:myapp/util/validator_util.dart';

class Item {
  const Item(this.name, this.icon);
  final String name;
  final Icon icon;
}

class PostNotice extends StatefulWidget {
  @override
  _PostNoticeState createState() => _PostNoticeState();
}

class _PostNoticeState extends State<PostNotice> {
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      title: Text("write Notice"),
      headerWidget: headerWidget(context),
      //headerBottomBar: headerBottomBarWidget(),
      body: [
        
      ],
      //fullyStretchable: true,
      //expandedBody: Text("Expanded"),
    );
  }

  Container headerWidget(BuildContext context) => Container(
        color: Colors.indigo[200],
        child: Column(
          children: [
            CustomAppbar(title: "공지사항 작성"),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "9월 19일",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          //letterSpacing: 0.5,
                          fontSize: 40,
                        ),
                      ),
                      Text(
                        "월요일",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          //letterSpacing: 0.5,
                          fontSize: 40,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.notifications_none,
                    size: 80,
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  // ListView listView() {
  //   return ListView.builder(
  //     padding: EdgeInsets.only(top: 0),
  //     physics: NeverScrollableScrollPhysics(),
  //     itemCount: notice.length,
  //     shrinkWrap: true,
  //     itemBuilder: (context, index) => Card(
  //       color: Colors.white,
  //       child: ListTile(
  //         leading: CircleAvatar(
  //           backgroundColor: Color(0x00000000),
  //           child: notice[index].icon,
  //         ),
  //         title: Text("${notice[index].name} / ${notice[index].date}",
  //             style: TextStyle(
  //                 color: Colors.pink.shade100, fontWeight: FontWeight.bold)),
  //         subtitle: Text(notice[index].intro),
  //       ),
  //     ),
  //   );
  // }
}
