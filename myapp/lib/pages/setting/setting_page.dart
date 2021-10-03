import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var submitTextStyle = GoogleFonts.nunito(
        fontSize: 15,
        //letterSpacing: 5,
        color: Colors.white,
        fontWeight: FontWeight.w300);
    return Scaffold(
      backgroundColor: Colors.pink.shade200,
      appBar: AppBar(
        title: Text("앱 설정"),
        backgroundColor: Colors.pink.shade200,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Text("알림", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                SizedBox(width: 20),
              ],  
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedButton(
                      onPress: () {},
                      height: 70,
                      width: 150,
                      text: 'SOUND',
                      gradient: LinearGradient(colors: [Colors.white, Colors.white]),
                      selectedGradientColor: LinearGradient(
                        colors: [Colors.white, Colors.white]),
                      isReverse: true,
                      selectedTextColor: Colors.grey,
                      transitionType: TransitionType.CENTER_ROUNDER,
                      textStyle: submitTextStyle,
                      borderColor: Colors.white,
                      borderWidth: 1,
                    ),
                    AnimatedButton(
                      onPress: () {},
                      height: 70,
                      width: 150,
                      text: 'VIBRATION',
                      gradient: LinearGradient(colors: [Colors.white, Colors.white]),
                      selectedGradientColor: LinearGradient(
                        colors: [Colors.white, Colors.white]),
                      isReverse: true,
                      selectedTextColor: Colors.grey,
                      transitionType: TransitionType.CENTER_ROUNDER,
                      textStyle: submitTextStyle,
                      borderColor: Colors.white,
                      borderWidth: 1,
                    ),
                    AnimatedButton(
                      onPress: () {},
                      height: 70,
                      width: 150,
                      text: 'MUTE',
                      gradient: LinearGradient(colors: [Colors.white, Colors.white]),
                      selectedGradientColor: LinearGradient(
                        colors: [Colors.white, Colors.white]),
                      isReverse: true,
                      selectedTextColor: Colors.grey,
                      transitionType: TransitionType.CENTER_ROUNDER,
                      textStyle: submitTextStyle,
                      borderColor: Colors.white,
                      borderWidth: 1,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}