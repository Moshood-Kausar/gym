import 'package:flutter/material.dart';
import 'CompleteV.dart';

class LoadVerify extends StatefulWidget {
  LoadVerify({Key? key}) : super(key: key);

  @override
  _LoadVerifyState createState() => _LoadVerifyState();
}

class _LoadVerifyState extends State<LoadVerify> {
  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              Container(
                child: Text(
                  "V  E  R  I  F  Y  I  N  G  .  .  .",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.grey),
                ),
              ),
              SizedBox(height: 300),
              CircularProgressIndicator(
                color: Colors.white,
                backgroundColor: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => CompleteV(),
        ),
      ),
    );
  }
}
