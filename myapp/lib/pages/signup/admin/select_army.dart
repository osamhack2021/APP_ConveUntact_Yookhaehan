import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/unit_controller.dart';
import 'package:myapp/pages/signup/admin/admin_check_unit.dart';

void main() => runApp(SelectArmy());
const primaryColor = Color(0xFFACBDF4);

class SelectArmy extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFACBDF4),
        primaryColor: primaryColor,
      ),
      //title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text('부대선택 페이지'),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: buildCon(),
      ),
    );
  }
}

class buildCon extends StatelessWidget {
  late BuildContext ctx;
  
  final UnitController unit = Get.put(UnitController());
  
  String army = '/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/images/army.png';
  String navy = '/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/images/navy.png';
  String airforce = '/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/images/airforce.png';
  String marine = '/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/images/marine.png';
  
  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Container(
      margin: const EdgeInsets.all(30),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 1.0,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: Image.asset(
                        army,
                        width: 120,
                          height: 120),
                      onTap: () => Get.to(() => AdminCheckUnit(), arguments:Get.arguments + {"picture" : army}),
                    ),
                    const Divider(),
                    InkWell(
                      child: Image.asset(
                          navy,
                          width: 120,
                          height: 120),
                      onTap: () => Get.to(() => AdminCheckUnit(), arguments:Get.arguments + {"picture" : navy}),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: Image.asset(
                        airforce,
                        width: 120,
                          height: 120),
                      onTap: () => Get.to(() => AdminCheckUnit(), arguments:Get.arguments + {"picture" : airforce}),
                    ),
                    const Divider(),
                    InkWell(
                      child: Image.asset(
                        marine,
                        width: 120,
                          height: 120),
                      onTap: () => Get.to(() => AdminCheckUnit(), arguments:Get.arguments + {"picture" : marine}),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showMessage(String msg) {
    final snackbar = SnackBar(content: Text(msg));
    Scaffold.of(ctx)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackbar);
  }
}
