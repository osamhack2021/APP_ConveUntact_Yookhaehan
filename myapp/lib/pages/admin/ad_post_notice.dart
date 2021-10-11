import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:intl/intl.dart';
import 'package:myapp/components/scroll_menu_button.dart';
import 'package:myapp/components/size.dart';
import 'package:myapp/components/textarea.dart';

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

  List<Item> items = [
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

  var dropdownItem = null;

  TextEditingController startdateinput = TextEditingController();
  TextEditingController enddateinput = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    startdateinput.text = DateFormat('yyyy-MM-dd')
        .format(DateTime.now()); //set the initial value of text field
    enddateinput.text = DateFormat('yyyy-MM-dd')
        .format(DateTime.now()); //set the initial value of text field
    super.initState();
  }

  double InputDateWidth = 140.0;
  double InputDateHeight = 40.0;

  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      title: Text("write Notice"),
      headerWidget: headerWidget(context),
      //headerBottomBar: headerBottomBarWidget(),
      body: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Form(
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
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ScrollPhysicsMenuButton(
                          theme: Theme.of(
                            context
                          )
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
                  funValidator: null,
                  bordercolor: Colors.indigo.shade200,
                ),
                const Text(
                  "적용 날짜 : ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                // 날짜 입력받는 곳
                Center(
                  child: Row(
                    children: [
                      Spacer(),
                      SizedBox(
                        height: InputDateHeight,
                        width: InputDateWidth,
                        child: TextField(
                          controller:
                              startdateinput, //editing controller of this TextField
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.calendar_today,
                              color: Colors.indigo[100],
                            ), //icon of text field
                            //labelText: "Enter Start Date" //label text of field
                          ),
                          readOnly:
                              true, //set it true, so that user will not able to edit text
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime
                                  .now(), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101),
                            );

                            if (pickedDate != null) {
                              print(
                                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(
                                  formattedDate); //formatted date output using intl package =>  2021-03-16
                              //you can implement different kind of Date Format here according to your requirement

                              setState(() {
                                startdateinput.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            } else {
                              print("Date is not selected");
                            }
                          },
                        ),
                      ),
                      Spacer(),
                      Text(
                        "~",
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.indigo[100],
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        height: InputDateHeight,
                        width: InputDateWidth,
                        child: TextField(
                          controller:
                              enddateinput, //editing controller of this TextField
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.calendar_today,
                              color: Colors.indigo[100],
                            ), //icon of text field
                            //labelText: "Enter End Date" //label text of field
                          ),
                          readOnly:
                              true, //set it true, so that user will not able to edit text
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime
                                  .now(), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101),
                            );

                            if (pickedDate != null) {
                              print(
                                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(
                                  formattedDate); //formatted date output using intl package =>  2021-03-16
                              //you can implement different kind of Date Format here according to your requirement

                              setState(() {
                                enddateinput.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            } else {
                              print("Date is not selected");
                            }
                          },
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                // 날짜 입력받는 곳 끝
              ],
            ),
          ),
        ),

        //작성완료 버튼
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: <Widget>[
              Container(
                height: 35,
                width: getScreenWidth(context) * 0.6,
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
        ),
        //작성완료 버튼 끝
      ],
      //fullyStretchable: true,
      //expandedBody: Text("Expanded"),
    );
  }

  Container headerWidget(BuildContext context) => Container(
    color: Colors.pink.shade100,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "공지사항 작성",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ],
        ),
        CircleAvatar(
          radius: 50,
          backgroundColor: Color(0x00000000),
          child: Image.asset(
            '/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/writing.png',
            width: 100,
            height: 100
          ),
        ),
      ],
    ),
  );
}