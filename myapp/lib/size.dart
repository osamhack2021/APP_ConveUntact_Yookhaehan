import 'package:flutter/material.dart';

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getButtonWidth(BuildContext context) {
  return getScreenWidth(context) * 0.4;
}

double getDropDownButtonWidth(BuildContext context) {
  return getScreenWidth(context) * 0.35;
}