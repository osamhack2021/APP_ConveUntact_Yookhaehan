import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/user_controller.dart';
import 'package:myapp/pages/signup/user/user_check_unit.dart';

void main() => runApp(UnitCode());
const primaryColor = Color(0xFFF7CBD4);

class UnitCode extends StatelessWidget {
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
          title: Text('부대 코드 입력 페이지'),
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

  final _formKey = GlobalKey<FormState>();
  final UserController user = Get.put(UserController());
  final _unitcode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Column(
      children: [
        const SizedBox(height: 170),
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
                const SizedBox(height: 100),
                TextFormField(
                  controller: _unitcode,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    icon: const Icon(Icons.person),
                    hintText: '부대 코드를 입력하세요.',
                    labelText: '코드 입력',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '부대 코드를 입력하세요.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 60),
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
                          textStyle: const TextStyle(fontSize: 50),
                        ),
                        onPressed: () {
                          // It returns true if the form is valid, otherwise returns false
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a Snackbar.
                            Scaffold.of(context)
                                .showSnackBar(SnackBar(content: Text('완료.')));

                            //임시 user 객체에 unitcode 저장
                            //user.temp.unitcode = _unitcode.text.trim();

                            //arguments로 password 보내기
                            Get.to(
                              UserCheckUnit(),
                              arguments: {
                                "email": Get.arguments["email"],
                                "password": Get.arguments["password"],
                                "username": Get.arguments["username"],
                                "rank": Get.arguments["rank"],
                                "number": Get.arguments["number"],
                                "unitcode": _unitcode.text.trim()
                              },
                            );
                          }
                        },
                        child: const Text('다음'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
