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
  //only used in dark mode
  return FlutteringTheme(
      backgroudTopColor: Color(0xff263238),
      backgroudBottomColor: Color(0xff121212),
      waveColor: Color(0xff4f5b62),
      fontColor: Colors.white54);
}

FlutteringTheme _buildGloomyTheme() {
  //used in light mode when weather condition is 'cloudy' or 'foggy'
}

FlutteringTheme _buildRainyTheme() {
  //used in light mode when weather condition is 'rainy' or 'thunderstorm'
}

FlutteringTheme _buildSoothingTheme() {
  //used in light mode when weather condition is 'sunny'
}

FlutteringTheme _buildWarmTheme() {
  //used in light mode when weather condition is 'snowy' or 'windy'
}
