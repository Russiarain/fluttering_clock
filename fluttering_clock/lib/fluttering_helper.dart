import 'dart:math';
import 'package:flutter/material.dart';

import 'package:simple_animations/simple_animations.dart';
import 'package:fluttering_clock/themes.dart';

class AnimatedBackgroud extends StatelessWidget {
  final FlutteringTheme theme;

  AnimatedBackgroud({this.theme});

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track('top').add(Duration(seconds: 3), theme.backgroudTopColorTween),
      Track('bottom').add(Duration(seconds: 3), theme.backgroudBottomColorTween)
    ]);

    return ControlledAnimation(
      key: ObjectKey(theme),
      playback: Playback.MIRROR,
      tween: tween,
      duration: tween.duration,
      builder: (context, animation) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [animation['top'], animation['bottom']])),
        );
      },
    );
  }
}

Widget waveLayer(double height,double offset,Color waveColor){
  return Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SineWave(
              height: height,
              offset: offset,
              waveColor: waveColor,
            ),
          ),
        );
}

class SineWave extends StatelessWidget {
  final double height;
  final double speed;
  final double offset;
  final Color waveColor;

  SineWave({this.height, this.speed = 1.0, this.waveColor, this.offset = 0.0});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 800),
          curve: Curves.linear,
          height: height,
          width: constraints.maxWidth,
          child: ControlledAnimation(
            playback: Playback.LOOP,
            duration: Duration(milliseconds: (5000 / speed).round()),
            tween: Tween(begin: 0.0, end: 2 * pi),
            builder: (contest, value) {
              return CustomPaint(
                foregroundPainter: SineCurvePainter(value + offset,areaColor: waveColor),
              );
            },
          ),
        );
      },
    );
  }
}

class SineCurvePainter extends CustomPainter {
  final double sineX;
  final Color areaColor;

  SineCurvePainter(this.sineX,{this.areaColor});

  @override
  void paint(Canvas canvas, Size size) {
    final cvPaint = Paint()..color = areaColor;
    final path = Path();

    final areaHeight = size.height;
    final areaWidth = size.width;

    final double offset = 0.05;
    final double amplitude = 0.2;

    final y1 = sin(sineX);
    final y2 = sin(sineX + pi / 3);
    final y3 = sin(sineX + 2 * pi / 3);

    final yStartPoint = areaHeight * (offset + amplitude * y1);
    final yControllPoint1 = areaHeight * (offset + amplitude * y2);
    final yControllPoint2 = areaHeight * (offset + amplitude * y3);
    final yEndPoint = areaHeight * (offset - amplitude * y1);

    path.moveTo(0, yStartPoint);
    path.cubicTo(areaWidth * 0.25, yControllPoint1, areaWidth * 0.5,
        yControllPoint2, areaWidth, yEndPoint);
    path.lineTo(areaWidth, areaHeight);
    path.lineTo(0, areaHeight);

    path.close();

    canvas.drawPath(path, cvPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
