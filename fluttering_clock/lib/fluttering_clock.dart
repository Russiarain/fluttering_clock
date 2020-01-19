import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:fluttering_clock/themes.dart';

import 'fluttering_helper.dart';

class FlutteringClock extends StatefulWidget {
  final ClockModel model;

  const FlutteringClock(this.model);

  @override
  State<StatefulWidget> createState() {
    return _FlutteringClockState();
  }
}

class _FlutteringClockState extends State<FlutteringClock> {
  DateTime _dateTime = DateTime.now();
  Timer _timer;

  var _is24Format = true;
  var _temperature = '';
  var _weatherCondition = '';
  var _location = '';

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    _updateTime();
    _updateModel();
  }

  @override
  void didUpdateWidget(FlutteringClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.model.removeListener(_updateModel);
    widget.model.dispose();
    super.dispose();
  }

  FlutteringTheme get theme {
    if (Theme.of(context).brightness == Brightness.dark) {
      return kThemeOf['Dark'];
    } else {
      return kThemeOf[widget.model.weatherString];
      // switch (widget.model.weatherCondition) {
      //   case WeatherCondition.cloudy:
      //     return kThemeOf['cloudy'];
      //     break;
      //   case WeatherCondition.foggy:
      //     return kThemeOf['foggy'];
      //     break;
      //   case WeatherCondition.rainy:
      //     return kThemeOf['rainy'];
      //     break;
      //   case WeatherCondition.snowy:
      //     return kThemeOf['snowy'];
      //     break;
      //   case WeatherCondition.thunderstorm:
      //     return kThemeOf['thunderstorm'];
      //     break;
      //   case WeatherCondition.windy:
      //     return kThemeOf['windy'];
      //     break;
      //   default:
      //     return kThemeOf['sunny'];
      // }
    }
  }

  void _updateModel() {
    setState(() {
      // Cause the clock to rebuild when the model changes.
      _is24Format = widget.model.is24HourFormat;
      _temperature = widget.model.temperatureString;
      _weatherCondition =
          widget.model.weatherString.substring(0, 1).toUpperCase() +
              widget.model.weatherString.substring(1);
      _location = widget.model.location;
    });
  }

  void _updateTime() {
    setState(() {
      _dateTime = DateTime.now();

      _timer = Timer(
        Duration(seconds: 1) - Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    String _timeString =
        DateFormat(_is24Format ? 'HH mm' : 'jm').format(_dateTime);
    String _dateString = DateFormat('E , MMMM d').format(_dateTime);
    final _screenSize = MediaQuery.of(context).size;
    bool _inLandscapeMode =
        MediaQuery.of(context).orientation == Orientation.landscape;
    var actualHeight =
        _inLandscapeMode ? _screenSize.height : 0.6 * _screenSize.width;
    double _fontSize = (actualHeight / 2.5).floorToDouble();
    double _waveHeight =
        (actualHeight * _dateTime.second / 59).floorToDouble();

    TextStyle hourMinuteStyle = TextStyle(
        fontFamily: 'Raj',
        fontWeight: FontWeight.w800,
        letterSpacing: 8,
        fontSize: _fontSize,
        color: theme.fontColor);

    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: AnimatedBackgroud(
            theme: theme,
          ),
        ),
        waveLayer(_waveHeight, 0, theme.waveColor),
        waveLayer(_waveHeight, 0.33 * pi, theme.waveColor),
        waveLayer(_waveHeight, 0.66 * pi, theme.waveColor),
        Positioned.fill(
          top: 32,
          child: Container(
            alignment: Alignment.topCenter,
            child: Column(
              children: <Widget>[
                Text(
                  _timeString,
                  style: hourMinuteStyle,
                ),
                Text(
                  _dateString,
                  style: TextStyle(
                      fontFamily: 'Noto',
                      fontWeight: FontWeight.w700,
                      fontSize: _fontSize / 4.2,
                      color: theme.fontColor),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
