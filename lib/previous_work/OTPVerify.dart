import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:gym/widget/button.dart';

import 'CompleteV.dart';

class OTPVerify extends StatefulWidget {
  final String? otp;
  OTPVerify({Key? key, this.otp}) : super(key: key);

  @override
  _OTPVerifyState createState() => _OTPVerifyState();
}

class _OTPVerifyState extends State<OTPVerify> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  bool _isLoading = false;

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.red),
      borderRadius: BorderRadius.circular(20.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Text(
                "ONE UP",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    color: Colors.red),
              ),
              Text(
                "F  I  T  N  E  S  S",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.red),
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
        body: SingleChildScrollView(
            child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/newp.jpg"),
                      fit: BoxFit.cover,
                    )),
                  ),
                  SizedBox(height: 100),
                  Text(
                    "OTP Verification",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Enter the OTP sent to ${widget.otp} ****',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 30),
                  Container(
                    margin: const EdgeInsets.all(20.0),
                    padding: const EdgeInsets.all(20.0),
                    child: PinPut(
                      fieldsCount: 4,
                      focusNode: _pinPutFocusNode,
                      controller: _pinPutController,
                      submittedFieldDecoration: _pinPutDecoration.copyWith(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      // validator: ,
                      selectedFieldDecoration: _pinPutDecoration,
                      followingFieldDecoration: _pinPutDecoration.copyWith(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextButton(
                        onPressed: () => _pinPutController.text = '',
                        child: const Text('Clear All'),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Text.rich(
                    TextSpan(
                      text: "Didn't recieve OTP?",
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: 'Resend',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  !_isLoading
                      ? MyAppButton(
                          txt: 'VERIFY & CONTINUE',
                          onPressed: () {
                            if (_pinPutController.text.length != 4) {
                              print('errr');
                            } else
                              setState(() {
                                _isLoading = true;
                              });
                            Timer(Duration(seconds: 6), () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => CompleteV(),
                                ),
                              );
                              setState(() {
                                _isLoading = false;
                              });
                            });
                          },
                        )
                      : CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        )));
  }
  // void _showSnackBar(String pin, BuildContext context) {
  // final snackBar = SnackBar(
  //   duration: const Duration(seconds: 3),
  // content: Container(
  //   height: 80.0,
  //   child: Center(
  //     child: Text(
  //       'Pin Submitted. Value: $pin',
  //       style: const TextStyle(fontSize: 25.0),
  //     ),
  //   ),
  // ),
  //     backgroundColor: Colors.red,
  //   );
  //   Scaffold.of(context)
  //     ..hideCurrentSnackBar()
  //     ..showSnackBar(snackBar);
  // }
}
