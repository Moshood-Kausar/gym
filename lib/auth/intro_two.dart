import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gym/style/exports.dart';
import 'package:gym/widget/widget_exports.dart';

class IntroTwoScreen extends StatefulWidget {
  IntroTwoScreen({Key? key}) : super(key: key);

  @override
  _IntroTwoScreenState createState() => _IntroTwoScreenState();
}

class _IntroTwoScreenState extends State<IntroTwoScreen> {
  double _progress = 0.3;

  void startTimer() {
    Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) => setState(
        () {
          if (_progress == 1) {
            timer.cancel();
          } else {
            _progress += 0.1;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        AppBgImage(img: 'assets/gym_girl.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Container(
              height: size.height,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 270,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: RoundCircle(),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 30.0, right: 75.0),
                            child: AppName(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 80),
                  Text("Train your way", style: introTitle),
                  SizedBox(height: 16),
                  Text("Custom Training Journeys for you",
                      style: introSubtitle),
                  SizedBox(height: 70),
                  SizedBox(
                    width: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        backgroundColor: Colors.grey.withOpacity(0.2),
                        minHeight: 12,
                        value: _progress,
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 5),
      () => Navigator.of(context).pushReplacementNamed('/intro3'),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
