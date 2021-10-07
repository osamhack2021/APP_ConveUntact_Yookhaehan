import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

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
  List todos = [];
  String input = "";

  @override
  void initState() {
    super.initState();
    todos.add("1중대");
    todos.add("2중대");
    todos.add("3중대");
    todos.add("4중대");
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
                              todos.add(input);
                            });
                            Navigator.of(context).pop(); // input 입력 후 창 닫히도록
                          },
                          child: Text("확인")),
                    ]);
              });
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
            itemCount: todos.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                  // 삭제 버튼 및 기능 추가
                  key: Key(todos[index]),
                  child: Card(
                      elevation: 4,
                      margin: EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: ListTile(
                        title: Text(todos[index]),
                        trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                todos.removeAt(index);
                              });
                            }),
                      )));
            }),
      ),
    );
  }
}
