import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomElevatedButton extends StatelessWidget {

  final String text;
  final funpageRoute;

  const CustomElevatedButton({required this.text, required this.funpageRoute});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        )
      ),
      onPressed: funpageRoute,
      child: Text("$text"),
    );
  }
}
