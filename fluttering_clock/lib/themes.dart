import 'package:flutter/material.dart';

final Map<String, FlutteringTheme> kThemeOf = {
  'Dark': _buildDarkTheme(),
  'cloudy': _buildGloomyTheme(),
  'foggy': _buildGloomyTheme(),
  'rainy': _buildRainyTheme(),
  'thunderstorm': _buildRainyTheme(),
  'sunny': _buildSoothingTheme(),
  'windy': _buildWarmTheme(),
  'snowy': _buildWarmTheme()
};

class FlutteringTheme {
  final ColorTween backgroudTopColorTween;
  final ColorTween backgroudBottomColorTween;
  final Color waveColor;
  final Color fontColor;

  FlutteringTheme(
      {this.backgroudTopColorTween,
      this.backgroudBottomColorTween,
      this.waveColor,
      this.fontColor});
}

FlutteringTheme _buildDarkTheme() {
  //only used in dark mode
  return FlutteringTheme(
      backgroudTopColorTween:
          ColorTween(begin: Color(0xff37474f), end: Color(0xff212121)),
      backgroudBottomColorTween:
          ColorTween(begin: Color(0xff212121), end: Color(0xff37474f)),
      waveColor: Colors.blueGrey[600],
      fontColor: Colors.white54);
}

FlutteringTheme _buildGloomyTheme() {
  //used in light mode when weather condition is 'cloudy' or 'foggy'
  return FlutteringTheme(
      backgroudTopColorTween:
          ColorTween(begin: Color(0xff76dfe6), end: Color(0xffe67d76)),
      backgroudBottomColorTween:
          ColorTween(begin: Color(0xff76e6b3), end: Color(0xff76e0e6)),
      waveColor: Color(0xffe676e0),
      fontColor: Colors.black45);
}

FlutteringTheme _buildRainyTheme() {
  //used in light mode when weather condition is 'rainy' or 'thunderstorm'
  return FlutteringTheme(
      backgroudTopColorTween:
          ColorTween(begin: Color(0xff76dfe6), end: Color(0xffe67d76)),
      backgroudBottomColorTween:
          ColorTween(begin: Colors.red[700], end: Color(0xff76e0e6)),
      waveColor: Color(0xffe676e0),
      fontColor: Colors.white54);
}

FlutteringTheme _buildSoothingTheme() {
  //used in light mode when weather condition is 'sunny'
  return FlutteringTheme(
      backgroudTopColorTween:
          ColorTween(begin: Color(0xff76dfe6), end: Color(0xffe67d76)),
      backgroudBottomColorTween:
          ColorTween(begin: Color(0xff76e6b3), end: Color(0xff76e0e6)),
      waveColor: Color(0xffe676e0),
      fontColor: Colors.black45);
}

FlutteringTheme _buildWarmTheme() {
  //used in light mode when weather condition is 'snowy' or 'windy'
  return FlutteringTheme(
      backgroudTopColorTween:
          ColorTween(begin: Color(0xff76dfe6), end: Color(0xffe67d76)),
      backgroudBottomColorTween:
          ColorTween(begin: Color(0xff76e6b3), end: Color(0xff76e0e6)),
      waveColor: Color(0xffe676e0),
      fontColor: Colors.black45);
}
