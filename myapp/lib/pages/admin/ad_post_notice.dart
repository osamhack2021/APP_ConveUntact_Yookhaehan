import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myapp/components/custom_elevated_button.dart';
import 'package:myapp/components/pc_info.dart';
import 'package:myapp/components/notice_info.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:myapp/components/scroll_menu_button.dart';
import 'package:myapp/components/textarea.dart';
import 'package:myapp/pages/admin/ad_notice_list.dart';
import 'package:intl/intl.dart';

class ADPostNoticeScreen extends StatefulWidget {
  @override
  _ADPostNoticeScreenState createState() => _ADPostNoticeScreenState();
}
class _ADPostNoticeScreenState extends State<ADPostNoticeScreen> {
  final _content = TextEditingController();
  TextEditingController startdateinput = TextEditingController();
  TextEditingController enddateinput = TextEditingController();
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
      title: Text("공지사항 작성"),
      //actions: [
        //IconButton(onPressed: () {}, icon: Icon(Icons.person, color: Colors.white,)),
      //],
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
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                    // dropdownButton
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ScrollPhysicsMenuButton(
                          theme: Theme.of(context),
                        ),
                    // dropdownButton 끝
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "공지사항 : ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    //입력 필드
                    Expanded(
                      child: CustomTextArea(
                        controller: _content,
                        hint: "+ 공 지 내 용 작 성",
                        funValidator: null,
                        bordercolor: Colors.indigo.shade200,
                      ),
                    )
                  ],
                ),
                const Text(
                  "적용 날짜 : ",
                  style: TextStyle(
                      color: Colors.grey,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustromElevatedButton(
                      text: "작성 완료",
                      onPressed: () {
                        CoolAlert.show(
                          context: context,
                          type: CoolAlertType.success,
                          text: "공지사항이 등록되었습니다.",
                          confirmBtnColor: Colors.indigo.shade200,
                          onConfirmBtnTap: () async {
                            Get.to(ADNoticeListScreen());
                          }
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
      //fullyStretchable: true,
      //expandedBody: Text("Expanded"),
    );
  }
  Container headerBottomBarWidget() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [//설정 아이콘
          IconButton(onPressed: () {}, icon: Icon(Icons.person, color: Colors.white),),
        ],
      ),
    );
  }
  Container headerWidget(BuildContext context) => Container(
    color: Colors.indigo.shade200,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "공지사항 작성",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                //letterSpacing: 0.5,
                fontSize: 40,
              )
            ),
            CircleAvatar(
              radius: 100,
              backgroundColor: Color(0x00000000),
              child: Image.asset(
                '/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/loudspeaker.png',
                width: 100,
                height: 100,
              ),
            ),
          ],
        ),
        //Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          //children: <Widget>[
            //Padding(
              //padding: const EdgeInsets.only(bottom: 12),
                //child: ScrollPhysicsMenuButton(
                  //theme: Theme.of(context),
                //),
            //),
          //],
        //),
      ],
    ),
  );
  ListView listView_1computer() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 0),
      physics: NeverScrollableScrollPhysics(),
      itemCount: notice.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.indigo.shade200,
            child: notice[index].icon, foregroundColor: Colors.white,
          ),
          title: Text("${computer_1co[index].name} / ${computer_1co[index].os}", style: TextStyle(color: Colors.indigo.shade200, fontWeight: FontWeight.bold)),
          subtitle: Text(computer_1co[index].isuse ? "사용 불가" : "사용 가능",),
        ),
      ),
    );
  }
  ListView listView_2computer() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 0),
      physics: NeverScrollableScrollPhysics(),
      itemCount: notice.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.indigo.shade200,
            child: notice[index].icon, foregroundColor: Colors.white,
          ),
          title: Text("${computer_2co[index].name} / ${computer_2co[index].os}", style: TextStyle(color: Colors.indigo.shade200, fontWeight: FontWeight.bold)),
          subtitle: Text(computer_2co[index].isuse ? "사용 불가" : "사용 가능",),
        ),
      ),
    );
  }
  ListView listView_3computer() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 0),
      physics: NeverScrollableScrollPhysics(),
      itemCount: notice.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.indigo.shade200,
            child: notice[index].icon, foregroundColor: Colors.white,
          ),
          title: Text("${computer_2co[index].name} / ${computer_2co[index].os}", style: TextStyle(color: Colors.indigo.shade200, fontWeight: FontWeight.bold)),
          subtitle: Text(computer_2co[index].isuse ? "사용 불가" : "사용 가능",),
        ),
      ),
    );
  }
}