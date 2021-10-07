import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_unitinfo.dart';

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
                          '/workspaces/APP_ConveUntact_Yookhaehan/myapp_conveuntact/lib/images/army.png',
                          width: 120,
                          height: 120),
                      onTap: () => Get.to((AddUnit())),
                    ),
                    const Divider(),
                    InkWell(
                      child: Image.asset(
                          '/workspaces/APP_ConveUntact_Yookhaehan/myapp_conveuntact/lib/images/navy.png',
                          width: 120,
                          height: 120),
                      onTap: () => Get.to((AddUnit())),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: Image.asset(
                          '/workspaces/APP_ConveUntact_Yookhaehan/myapp_conveuntact/lib/images/airforce.png',
                          width: 120,
                          height: 120),
                      onTap: () => Get.to((AddUnit())),
                    ),
                    const Divider(),
                    InkWell(
                      child: Image.asset(
                          '/workspaces/APP_ConveUntact_Yookhaehan/myapp_conveuntact/lib/images/marine.png',
                          width: 120,
                          height: 120),
                      onTap: () => Get.to((AddUnit())),
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
