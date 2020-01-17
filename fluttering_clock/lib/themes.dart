import 'package:flutter/material.dart';

final kDartTheme = _buildDarkTheme();

class FlutteringTheme {
  final Color backgroudTopColor;
  final Color backgroudBottomColor;
  final Color waveColor;
  final Color fontColor;

  FlutteringTheme(
      {this.backgroudTopColor,
      this.backgroudBottomColor,
      this.waveColor,
      this.fontColor});
}

FlutteringTheme _buildDarkTheme() {
  return FlutteringTheme(
      backgroudTopColor: Color(0xff263238),
      backgroudBottomColor: Color(0xff121212),
      waveColor: Color(0xff4f5b62),
      fontColor: Colors.white54);
}

