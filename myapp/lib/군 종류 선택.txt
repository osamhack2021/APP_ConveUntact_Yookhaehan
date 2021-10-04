import 'package:flutter/material.dart';

const primaryColor = Color(0xFFACBDF4);
void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      scaffoldBackgroundColor: Color(0xFFACBDF4),
      primaryColor: primaryColor,
    ),
    title: '부대 선택',
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(''),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {},
        ),
      ),
      body: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  late BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          InkWell(
            child: InkWell(
              child: Image.asset(
                  '/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/image.png',
                  width: 120,
                  height: 120),
              onTap: () => showMessage('ImageButton'),
            ),
          ),
          InkWell(
            child: Image.asset(
                '/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/image(1).png',
                width: 120,
                height: 120),
            onTap: () => showMessage('ImageButton'),
          ),
          InkWell(
            child: Image.asset(
                '/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/image(3).png',
                width: 120,
                height: 120),
            onTap: () => showMessage('ImageButton'),
          ),
          InkWell(
            child: Image.asset(
                '/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/image(2).png',
                width: 120,
                height: 120),
            onTap: () => showMessage('ImageButton'),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
