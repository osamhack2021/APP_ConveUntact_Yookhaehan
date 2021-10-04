import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:myapp/component/custom_textarea.dart';
import 'package:myapp/size.dart';
import 'package:myapp/util/validator_util.dart';

class Item {
  const Item(this.name, this.icon);
  final String name;
  final Icon icon;
}

class WriteNotice extends StatefulWidget {
  @override
  _WriteNoticeState createState() => _WriteNoticeState();
}

class _WriteNoticeState extends State<WriteNotice> {
  final _content = TextEditingController();

  List items = [
    const Item(
        '풋살장',
        Icon(
          Icons.sports_soccer,
          color: Colors.black,
        )),
    const Item(
        '풋살장',
        Icon(
          Icons.sports_soccer,
          color: Colors.black,
        )),
    const Item(
        '풋살장',
        Icon(
          Icons.sports_soccer,
          color: Colors.black,
        )),
    const Item(
        '풋살장',
        Icon(
          Icons.sports_soccer,
          color: Colors.black,
        )),
  ];

  Item dropdownItem = Item(
        '풋살장',
        Icon(
          Icons.sports_soccer,
          color: Colors.black,
        )),

  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      title: Text("write Notice"),
      headerWidget: headerWidget(context),
      //headerBottomBar: headerBottomBarWidget(),
      body: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "시설 : ",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  // dropdownButton
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: getDropDownButtonWidth(context),
                        child: DropdownButton(
                          value: items[0],
                          dropdownColor: Colors.indigo[100],
                          items:items
                              .map(
                                (item) => DropdownMenuItem(
                                  value: item,
                                  child: Row(
                                    children: [
                                      Text(
                                        item.name,
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      item.icon,
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (newItem) {
                              setState(() => dropdownItem = newItem;
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  // dropdownButton 끝
                ],
              ),
              const Text(
                "공지 내용 : ",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              //입력 필드
              CustomTextArea(
                controller: _content,
                hint: "공지 내용을 입력하세요.",
                funValidator: validateContent(),
              ),
              const Text(
                "적용 날짜 : ",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              // 날짜 입력받는 곳
              // to do
              // 날짜 입력받는 곳 끝
            ],
          ),
        ),

        //작성완료 버튼
        Column(
          children: <Widget>[
            Container(
              height: 50,
              width: getButtonWidth(context),
              child: RaisedButton(
                onPressed: () {
                  //Get.to(HomePage());
                  //_content.text로 변수 받아서 쿼리날리기
                },
                padding: EdgeInsets.all(10.0),
                child: Text(
                  '작성 완료',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                textColor: Colors.white,
                color: Colors.indigo[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
        //작성완료 버튼 끝
      ],
      //fullyStretchable: true,
      //expandedBody: Text("Expanded"),
    );
  }

  Container headerWidget(BuildContext context) => Container(
        color: Colors.indigo[200],
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
      );
}
