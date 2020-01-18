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
      waveColor: Colors.blueGrey[600].withAlpha(48),
      fontColor: Colors.white54);
}

FlutteringTheme _buildGloomyTheme() {
  //used in light mode when weather condition is 'cloudy' or 'foggy'
  return FlutteringTheme(
      backgroudTopColorTween:
          ColorTween(begin: Color(0x99ff6c64), end: Color(0xfff7ff64)),
      backgroudBottomColorTween:
          ColorTween(begin: Color(0xff3949ab), end: Color(0xff9c39ab)),
      waveColor: Color(0x30f6f3c6),
      fontColor: Colors.white54);
}

FlutteringTheme _buildRainyTheme() {
  //used in light mode when weather condition is 'rainy' or 'thunderstorm'
  return FlutteringTheme(
      backgroudTopColorTween:
          ColorTween(begin: Color(0xff18ffff), end: Color(0xff006ecb)),
      backgroudBottomColorTween:
          ColorTween(begin: Color(0xffaa00ff), end: Color(0xff18ffff)),
      waveColor: Color(0x806cccff),
      fontColor: Colors.white60);
}

FlutteringTheme _buildSoothingTheme() {
  //used in light mode when weather condition is 'sunny'
  return FlutteringTheme(
      backgroudTopColorTween:
          ColorTween(begin: Color(0xff69f0ae), end: Color(0xff18ffff)),
      backgroudBottomColorTween:
          ColorTween(begin: Color(0xff18ffff), end: Color(0xff69f0ae)),
      waveColor: Colors.white30.withAlpha(48),
      fontColor: Colors.black38);
}

FlutteringTheme _buildWarmTheme() {
  //used in light mode when weather condition is 'snowy' or 'windy'
  return FlutteringTheme(
      backgroudTopColorTween:
          ColorTween(begin: Color(0xfff44336), end: Color(0xffff5722)),
      backgroudBottomColorTween:
          ColorTween(begin: Colors.amber[700], end: Colors.orange[700]),
      waveColor: Colors.white.withAlpha(48),
      fontColor: Colors.white60);
}
