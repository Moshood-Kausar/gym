import 'package:flutter/material.dart';
import 'package:gym/widget/button.dart';
import 'package:gym/widget/text_form.dart';

import 'OTPVerify.dart';

class PhoneOTP extends StatefulWidget {
  PhoneOTP({Key? key}) : super(key: key);

  @override
  _PhoneOTPState createState() => _PhoneOTPState();
}

class _PhoneOTPState extends State<PhoneOTP> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _phone;

  @override
  void initState() {
    super.initState();
    _phone = TextEditingController();
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
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
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Text(
                          "Enter your Phone Number",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'We will send you the four digit verification code',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 30),
                        AppTextFormField(
                          controller: _phone,
                          secure: false,
                          label: 'Phone',
                          keyboardType: TextInputType.number,
                          icon: Icon(Icons.phone, color: Colors.grey),
                          validator: (value) {
                            if (value!.isEmpty)
                              return 'Empty field detected';
                            else if (value.length < 11)
                              return 'Number cannot be less than 11 characters';
                            else
                              return null;
                          },
                        ),
                        SizedBox(height: 100),
                        MyAppButton(
                          txt: 'GENERATE OTP',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              var materialPageRoute = MaterialPageRoute(
                                builder: (_) => OTPVerify(
                                  otp: _phone!.text,
                                ),
                              );
                              Navigator.push(
                                context,
                                materialPageRoute,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _phone!.dispose();
    super.dispose();
  }
}
