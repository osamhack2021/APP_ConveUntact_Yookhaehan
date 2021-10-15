import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myapp/components/facility_info.dart';
import 'package:myapp/pages/admin/ad_facility_modify_menu.dart';
import 'package:myapp/pages/signup/admin/admin_finish_signup.dart';


class AddFacilityList extends StatefulWidget {
  @override
  Selectdtail createState() => Selectdtail();
}

class Selectdtail extends State<AddFacilityList> {
  List teamFacilityList = [];
  List personalFacilityList = [];
  String input = "";

  @override
  void initState() {
    for (int i = 0; i < teamFacility.length; i++) {
      teamFacilityList.add(
        teamFacility[i]
      );
    }
    for (int i = 0; i < personalFacility.length; i++) {
      personalFacilityList.add(
        personalFacility[i]
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("부대 단체 이용시설 추가"),
                content: TextField(
                  onChanged: (String value) {
                    input = value;
                  },
                ),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        teamFacilityList.add(input);
                      });
                      Navigator.of(context).pop(); // input 입력 후 창 닫히도록
                    },
                    child: Text("확인")
                  ),
                  RaisedButton(
                    onPressed: () {
                      print(teamFacilityList);
                      Get.to(ADFacilityModifyPage());
                    },
                    child: Text('저장하기')
                  ),
                ]
              );
            }
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(30),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 3.0,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: ListView.builder(
            itemCount: teamFacilityList.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                  // 삭제 버튼 및 기능 추가
                  key: Key(teamFacilityList[index]),
                  child: Card(
                      elevation: 4,
                      margin: EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: ListTile(
                        title: Text(teamFacilityList[index]),
                        trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                teamFacilityList.removeAt(index);
                              });
                            }),
                      )));
            }),
      ),
    );
  }
}
