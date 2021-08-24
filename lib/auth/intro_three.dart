import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym/auth/login_page.dart';
import 'package:gym/screen/dashboard/main_page.dart';
import 'package:gym/style/exports.dart';
import 'package:gym/widget/widget_exports.dart';

/// text line breakkkk ---------------

class IntroThreeScreen extends StatefulWidget {
  IntroThreeScreen({Key? key}) : super(key: key);

  @override
  _IntroThreeScreenState createState() => _IntroThreeScreenState();
}

class _IntroThreeScreenState extends State<IntroThreeScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(user);
    return Stack(
      children: [
        AppBgImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Container(
              height: size.height,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 250,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: RoundCircle(),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 100.0),
                              child: AppName(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 80),
                    Text("Custom Training Journeys", style: introTitle),
                    SizedBox(height: 16),
                    Text(
                      "Boost your knowledge on the blog. Find your fit with wear and gear",
                      textAlign: TextAlign.center,
                      style: introSubtitle,
                    ),
                    SizedBox(height: 30),
                    MyAppButton(
                      txt: 'START NOW!',
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => user != null
                                ? MainPage(uid: user!.uid)
                                : LoginScreen(),
                          ),
                        );
                        // Navigator.of(context).pushReplacementNamed(
                        //     user != null ? '/homepage' : '/login');
                      },
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
