import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade100,
      appBar: AppBar(
        title: Text("앱 설정"),
        backgroundColor: Colors.pink.shade100,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Text("알림", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                SizedBox(width: 20),
              ],  
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}