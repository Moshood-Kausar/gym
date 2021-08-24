import 'package:flutter/material.dart';
import 'package:gym/widget/button.dart';

import 'LoginPage.dart';

class CompleteV extends StatefulWidget {
  CompleteV({Key? key}) : super(key: key);

  @override
  _CompleteVState createState() => _CompleteVState();
}

class _CompleteVState extends State<CompleteV> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              "ONE UP",
              style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: 30, color: Colors.red),
            ),
            Text(
              "F  I  T  N  E  S  S",
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 15, color: Colors.red),
            ),
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Container(
                height: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/check.png"),
                  fit: BoxFit.contain,
                )),
              ),
              SizedBox(height: 30),
              Container(
                child: Text(
                  "VERIFICATION COMPLETE",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
              SizedBox(height: 70),
              Text(
                "Custom Training Journeys",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.black),
              ),
              Text(
                "Boost your knowledge on the blog. Find your",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              Text(
                "fit with wear and gear",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 50),
              MyAppButton(
                txt: 'START NOW',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LoginPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
