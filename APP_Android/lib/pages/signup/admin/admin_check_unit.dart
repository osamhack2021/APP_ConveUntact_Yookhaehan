import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/unit_controller.dart';
import 'package:myapp/domain/unit/unit.dart';
import 'package:myapp/pages/signup/admin/admin_finish_signup.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

void main() => runApp(AdminCheckUnit());
const primaryColor = Color(0xFFACBDF4);

class AdminCheckUnit extends StatelessWidget {
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
          title: Text('생성 부대확인 페이지'),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class, which holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  UnitController unit = Get.put(UnitController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Column(
      children: [
        SizedBox(height: 120),
        Form(
          key: _formKey,
          child: Container(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  child: InkWell(
                    child: Image.asset('${Get.arguments["picture"]}',
                        width: 120, height: 120),
                  ),
                ),
                SizedBox(height: 40),
                Text('${Get.arguments["unitname"]}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black)),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <ClipRRect>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Positioned.fill(
                            child: Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    Color(0xFFACBDF4),
                                    Color(0xFFACBDF4),
                                    Color(0xFFACBDF4),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(20.0),
                              primary: Color(0xFFFFFFFF),
                              alignment: Alignment.center,
                              textStyle: const TextStyle(fontSize: 35),
                            ),
                            onPressed: () async {
                              // print("debug1");
                              // //부대코드 중복 체크
                              // int emailCheck = await unit.checkCode(Get.arguments["email"].toString());
                              // print("debug12");
                              // if (emailCheck < 1) {
                              //   Get.snackbar("회원가입 실패", "부대코드 중복");
                              //   return;
                              // }
                              // print("debug13");

                              // UUID -> https://pub.dev/packages/uuid/example
                              // 부대 코드 난수 생성
                              // var uuid = Uuid();
                              // var unitcode =
                              //     uuid.v4(options: {'rng': UuidUtil.cryptoRNG});

                              // //unit code 자르기 시작
                              // String a = unitcode;
                              // String cut_unitcode = a.substring(0, 5);
                              // //unit code 자르기 끝

                              // //get arguments로 받은 값들로 unit 객체 생성 후 join 함수 날리기
                              // Unit newunit = Unit(
                              //   unitcode:
                              //       Get.arguments["cut_unitcode"].toString(),
                              //   unitname:
                              //       Get.arguments["cut_unitcode"].toString(),
                              //   picture: Get.arguments["picture"].toString(),
                              //   email: Get.arguments["email"].toString(),
                              // );

                              // print("debug14");
                              // int result = await unit.join(newunit,
                              //     Get.arguments["password"].toString());
                              // print("debug15");
                              // if (result == 1) {
                              //   print("debug16");
                              //   Get.offAll(() => AdminFinishSignup(),
                              //       arguments: Get.arguments);
                              //   print("debug17");
                              // } else {
                              //   Get.snackbar("회원가입 시도", "회원가입 실패");
                              // }
                              Get.to(AdminFinishSignup());
                            },
                            child: const Text('   예   '),
                          ),
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Positioned.fill(
                            child: Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    Color(0xFFACBDF4),
                                    Color(0xFFACBDF4),
                                    Color(0xFFACBDF4),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(20.0),
                              primary: Color(0xFFFFFFFF),
                              alignment: Alignment.center,
                              textStyle: const TextStyle(fontSize: 35),
                            ),
                            onPressed: () {
                              // It returns true if the form is valid, otherwise returns false
                              if (_formKey.currentState!.validate()) {
                                // If the form is valid, display a Snackbar.
                                // Scaffold.of(context).showSnackBar(
                                //     SnackBar(content: Text('완료.')));
                                Get.back();
                              }
                            },
                            child: const Text('아니오'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
