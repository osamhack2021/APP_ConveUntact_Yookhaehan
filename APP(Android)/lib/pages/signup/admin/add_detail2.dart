import 'package:flutter/material.dart';
//코드 따올거있어서 남겨둠. ==> 고승현
class AddDetail2 extends StatefulWidget {
  @override
  AddDetail2State createState() => AddDetail2State();
}

class AddDetail2State extends State<AddDetail2> {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.pink.shade200,
          appBar: AppBar(
            title: Text("개인정보 수정"),
            backgroundColor: Colors.pink.shade200,
          ),
          body: Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(15.0),
              children: <Widget>[
                Center(
                  child: Card(
                    elevation: 8.0,
                    child: Container(
                      margin: const EdgeInsets.all(30),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 3.0,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20)
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              labelText: "아이디(이메일)",
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              labelText: "Password",
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Material(
                            borderRadius: BorderRadius.circular(30.0),
                            //elevation: 5.0,
                            child: MaterialButton(
                              onPressed: () => {},
                              minWidth: 150.0,
                              height: 50.0,
                              color: Colors.pink.shade100,
                              child: Text(
                                "수정완료",
                                style: TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
}