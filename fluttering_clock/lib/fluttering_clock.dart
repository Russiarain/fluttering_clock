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
    String _timeString = '${_dateTime.hour} ${_dateTime.minute}';
    final _screenSize = MediaQuery.of(context).size;
    double _waveHeight =
        (_screenSize.height * _dateTime.second / 59).floorToDouble();
    bool _inLandscapeMode =
        MediaQuery.of(context).orientation == Orientation.landscape;
    double _fontSize =
        ((_inLandscapeMode ? _screenSize.height : 0.6 * _screenSize.width) /
                3.5)
            .floorToDouble();

    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: AnimatedBackgroud(),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SineWave(
              height: _waveHeight,
              speed: 1.0,
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SineWave(
              height: _waveHeight,
              speed: 1.02,
              offset: 0.33 * pi,
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SineWave(
              height: _waveHeight,
              speed: 1.04,
              offset: 0.66 * pi,
            ),
          ),
        ),
        Positioned.fill(
          child: Center(
            //Using AnimatedWidget to animated text content changes doesn't work
            child: Text(
              _timeString,
              style: TextStyle(
                  fontFamily: 'Simpleton',
                  //fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.normal,
                  fontSize: _fontSize,
                  color: Colors.white.withAlpha(196)),
              textScaleFactor: 1.5,
            ),
          ),
        )
      ],
    );
  }
}
