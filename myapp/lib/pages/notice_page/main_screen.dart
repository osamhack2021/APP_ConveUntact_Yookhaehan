import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainScreen extends StatefulWidget{
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedindex,
        children: [
          Center(child: Text("IndexedStack 1")),
          Center(child: Text("IndexedStack 2")),
          Center(child: Text("IndexedStack 3")),
        ],
      ),
      
    );
  }
}