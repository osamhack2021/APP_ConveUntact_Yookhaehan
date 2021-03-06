import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/unit_controller.dart';
import 'package:myapp/controller/user_controller.dart';
import 'package:myapp/domain/unit/unit.dart';
import 'package:myapp/domain/user/user.dart';
import 'package:myapp/pages/signup/user/user_finish_signup.dart';

void main() => runApp(UserCheckUnit());
const primaryColor = Color(0xFFF7CBD4);

class UserCheckUnit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final appTitle = 'sign up page';
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF7CBD4),
        primaryColor: primaryColor,
      ),
      //title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text('사용자 부대확인 페이지'),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Get.to(UserFinishSignup());
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
  final UnitController unit = Get.put(UnitController());
  final UserController user = Get.put(UserController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String? unitcode = Get.arguments["unitcode"];
    unit.findByCode(unitcode!);
    Unit u = unit.principal.value;
    print("--------------------------");
    print(u.unitcode);
    print(u.unitname);
    print(u.email);
    print(u.created);
    print("--------------------------");

    // Build a Form widget using the _formKey created above.
    return Column(
      //unit.findByCode(unitcode),
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
                    child: Image.asset(
                        //'/workspaces/APP_ConveUntact_Yookhaehan/myapp_conveuntact/lib/images/navy.png',
                        '${Get.arguments["picture"]}',
                        width: 120,
                        height: 120),
                  ),
                ),
                SizedBox(height: 40),
                //Unitinfo 부대확인
                Text('${unit.principal.value.unitname}',
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
                                    Color(0xFFF3D0D8),
                                    Color(0xFFF3D0D8),
                                    Color(0xFFF3D0D8),
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
                              textStyle: const TextStyle(fontSize: 30),
                            ),
                            onPressed: () async {
                              // It returns true if the form is valid, otherwise returns false
                              if (_formKey.currentState!.validate()) {
                                // If the form is valid, display a Snackbar.
                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text('완료.')));
                                
                                //이메일 중복 체크
                                int emailCheck = await user.checkEmail(Get.arguments["email"]);
                                if (emailCheck < 1) {
                                  Get.snackbar("회원가입 실패", "이메일 중복");
                                  return;
                                }
                                
                                //유저네임 중복 체크
                                int usernameCheck = await user.checkUsername(Get.arguments["username"]);
                                if (usernameCheck < 1) {
                                  Get.snackbar("회원가입 실패", "유저네임 중복");
                                  return;
                                }


                              //get arguments로 받은 값들로 user 객체 생성 후 join 함수 날리기
                                User newuser = User(
                                  unitcode: Get.arguments["unitcode"],
                                  email: Get.arguments["email"],
                                  username: Get.arguments["username"],
                                  rank: Get.arguments["rank"],
                                  picture: unit.principal.value.picture,
                                  number: Get.arguments["number"],
                                );

                                int result = await user.join(newuser, Get.arguments["password"].toString());
                                if (result == 1) {
                                  Get.offAll(() => UserFinishSignup(), arguments : Get.arguments["username"]);
                                } else {
                                  Get.snackbar("회원가입 시도", "회원가입 실패");
                                }
                              }
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
                                    Color(0xFFF3D0D8),
                                    Color(0xFFF3D0D8),
                                    Color(0xFFF3D0D8),
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
                              textStyle: const TextStyle(fontSize: 30),
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
