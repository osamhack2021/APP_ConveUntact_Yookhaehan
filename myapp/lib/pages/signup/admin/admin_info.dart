import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/unit_controller.dart';
import 'package:myapp/pages/signup/admin/select_army.dart';

void main() => runApp(AdminInfo());
const primaryColor = Color(0xFFACBDF4);

class AdminInfo extends StatelessWidget {
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
          title: Text('관리자 개인정보 입력페이지'),
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

  final UnitController unit = Get.put(UnitController());
  final _formKey = GlobalKey<FormState>();
  final _unitcode = TextEditingController();
  final _unitname = TextEditingController();
  final _password = TextEditingController();
  final _email = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Column(
      children: [
        SizedBox(height: 200),
        Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.all(30),
            padding: EdgeInsets.all(30.0),
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
                SizedBox(height: 70),
                TextFormField(
                  controller: _unitcode,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    icon: const Icon(Icons.person),
                    hintText: '부대번호를 입력해주세요.',
                    labelText: '부대 번호',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '부대번호를 입력해주세요';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _unitname,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    icon: const Icon(Icons.password),
                    hintText: '부대이름을 입력해주세요',
                    labelText: '부대이름',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '부대이름을 입력해주세요';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _password,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    icon: const Icon(Icons.password),
                    hintText: '비밀번호를 입력해주세요',
                    labelText: '비밀번호',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '비밀번호를 입력해주세요';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    icon: const Icon(Icons.email),
                    hintText: '이메일 주소를 입력해 주세요  ex)osam2021@naver.com',
                    labelText: '(아이디)이메일 주소',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '이메일주소를 입력해주세요';
                    }
                    return null;
                  },
                ),
                // new Container(
                //     padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                //     child: new RaisedButton(
                //       child: const Text('다음'),
                //       onPressed: () {
                //         // It returns true if the form is valid, otherwise returns false
                //         if (_formKey.currentState!.validate()) {
                //           // If the form is valid, display a Snackbar.
                //           Scaffold.of(context)
                //               .showSnackBar(SnackBar(content: Text('완료.')));
                //         }
                //       },
                //     )),
                const SizedBox(height: 30),
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
                          textStyle: const TextStyle(fontSize: 50),
                        ),
                        onPressed: () {
                          // It returns true if the form is valid, otherwise returns false
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a Snackbar.
                            Scaffold.of(context)
                                .showSnackBar(SnackBar(content: Text('완료.')));
                            
                            print("Get.to(SelectArmy()");
                            
                            Get.to(SelectArmy(), arguments: Get.arguments + {
                              "unitcode": _unitcode.text.trim(),
                              "unitname": _unitname.text.trim(),
                              "password": _password.text.trim(),
                              "email": _email.text.trim(),
                            });
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
