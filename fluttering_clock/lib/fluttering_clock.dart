import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';

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

  void _updateModel() {
    setState(() {
      // Cause the clock to rebuild when the model changes.
    });
  }

  void _updateTime() {
    setState(() {
      _dateTime = DateTime.now();
      // Update once per minute. If you want to update every second, use the
      // following code.
      // _timer = Timer(
      //   Duration(minutes: 1) -
      //       Duration(seconds: _dateTime.second) -
      //       Duration(milliseconds: _dateTime.millisecond),
      //   _updateTime,
      // );
      // Update once per second, but make sure to do it at the beginning of each
      // new second, so that the clock is accurate.
      _timer = Timer(
        Duration(seconds: 1) - Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    String _timeString = '${_dateTime.hour}:${_dateTime.minute}';
    double _screenHeight = MediaQuery.of(context).size.height;
    int _currentSecond = _dateTime.second;

    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: AnimatedBackgroud(),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SineWave(height: 280,speed: 1.0,),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SineWave(height: 260,speed: 1.02,offset: 0.33*pi,),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SineWave(height: 240,speed: 1.04,offset: 0.66*pi,),
          ),
        ),
        Positioned.fill(
          child: Center(
            //Using AnimatedWidget to animated text content changes doesn't work
            child: Text(_currentSecond.toString(),style: Theme.of(context).textTheme.display3.copyWith(color: Colors.white.withAlpha(128),fontWeight: FontWeight.w800),textScaleFactor: 3.5,),
          ),
        )
      ],
    );
  }
}
