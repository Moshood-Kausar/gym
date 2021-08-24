import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gym/style/exports.dart';
import 'package:gym/widget/widget_exports.dart';

class IntroOneScreen extends StatefulWidget {
  IntroOneScreen({Key? key}) : super(key: key);

  @override
  _IntroOneScreenState createState() => _IntroOneScreenState();
}

class _IntroOneScreenState extends State<IntroOneScreen> {
  double _progress = 0;

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
        AppBgImage(img: 'assets/two.jpg'),
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
                    width: 250,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: RoundCircle(),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.only(top: 70.0),
                            child: AppName(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 80),
                  Text.rich(
                    TextSpan(
                      text: 'Welcome to',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                          text: ' One Up!',
                          style: introTitle,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Text("Start today", style: introSubtitle),
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
      Duration(seconds: 3),
      () => Navigator.of(context).pushReplacementNamed('/intro2'),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
