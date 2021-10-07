
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final String title;

  const CustomAppbar({required this.title});
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: TextButton(
        onPressed: () {},
        child: Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 30,
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {},
          child: Icon(
            Icons.person,
            color: Colors.black,
            size: 30,
          ),
        )
      ],
      centerTitle: true,
      title: Text(
        "${title}",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.indigo[200],
      elevation: 0,
    );
  }
}
