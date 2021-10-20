import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myapp/components/info/company_info.dart';
import 'package:myapp/controller/unit_controller.dart';
import 'package:myapp/domain/unit/unit.dart';
import 'package:myapp/pages/signup/admin/admin_finish_signup.dart';

void main() => runApp(AddDetail());
const primaryColor = Color(0xFFACBDF4);

class AddDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final appTitle = 'sign up page';
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFACBDF4),
        primaryColor: primaryColor,
      ),
      //title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text('세부 소속 추가 페이지'),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Add_detail_Unit(),
      ),
    );
  }
}

class Add_detail_Unit extends StatefulWidget {
  @override
  Selectdtail createState() => Selectdtail();
}

class Selectdtail extends State<Add_detail_Unit> {
  //List todos = [];
  String input = "";

  @override
  void initState() {
    super.initState();
  }

  UnitController unit = Get.put(UnitController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("세부 부대 추가"),
                content: TextField(
                  onChanged: (String value) {
                    input = value;
                  },
                ),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        companys.add(input);
                      });
                      Navigator.of(context).pop(); // input 입력 후 창 닫히도록
                    },
                    child: Text("확인"),
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    onPressed: () async {
                      print(companys);

                      Scaffold.of(context)
                          .showSnackBar(SnackBar(content: Text('완료.')));

                      //부대코드 중복 체크
                      int emailCheck =
                          await unit.checkCode(Get.arguments["email"]);
                      if (emailCheck < 1) {
                        Get.snackbar("회원가입 실패", "부대코드 중복");
                        return;
                      }

                      //get arguments로 받은 값들로 unit 객체 생성 후 join 함수 날리기
                      Unit newunit = Unit(
                        unitcode: Get.arguments["unitcode"],
                        unitname: Get.arguments["unitname"],
                        picture: Get.arguments["picture"],
                        email: Get.arguments["email"],
                      );

                      int result =
                          await unit.join(newunit, Get.arguments["password"]);
                      if (result == 1) {
                        Get.offAll(() => AdminFinishSignup(),
                            arguments: Get.arguments);
                      } else {
                        Get.snackbar("회원가입 시도", "회원가입 실패");
                      }
                    },
                    child: Text('저장'),
                  ),
                ],
              );
            },
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
            itemCount: companys.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                  // 삭제 버튼 및 기능 추가
                  key: Key(companys[index]),
                  child: Card(
                      elevation: 4,
                      margin: EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: ListTile(
                        title: Text(companys[index]),
                        trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                companys.removeAt(index);
                              });
                            }),
                      )));
            }),
      ),
    );
  }
}
