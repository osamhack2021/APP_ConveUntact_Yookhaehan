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
        title: Text('부대선택 페이지'),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: <Widget>[
                InkWell(
                  child: InkWell(
                    child: Image.asset(
                        '/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/image.png',
                        width: 180,
                        height: 180),
                    onTap: () => showMessage('육군'),
                  ),
                ),
                InkWell(
                  child: Image.asset(
                      '/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/image(1).png',
                      width: 180,
                      height: 180),
                  onTap: () => showMessage('해군'),
                ),
                InkWell(
                  child: Image.asset(
                      '/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/image(3).png',
                      width: 180,
                      height: 180),
                  onTap: () => showMessage('공군'),
                ),
                InkWell(
                  child: Image.asset(
                      '/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/image(2).png',
                      width: 180,
                      height: 180),
                  onTap: () => showMessage('해병대'),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
