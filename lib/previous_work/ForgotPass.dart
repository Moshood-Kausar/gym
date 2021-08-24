import 'package:flutter/material.dart';
import 'package:gym/widget/button.dart';
import 'package:gym/widget/text_form.dart';
import 'LoginPage.dart';
import 'PhoneOTP.dart';

class LoginPass extends StatefulWidget {
  LoginPass({Key? key}) : super(key: key);

  @override
  _LoginPassState createState() => _LoginPassState();
}

class _LoginPassState extends State<LoginPass> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _email;
  FocusNode? pass;
  String? email;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
  }

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
        child: SingleChildScrollView(
          child: Container(
            height: size.height,
            width: size.width,
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: size.height / 12),
                  Text(
                    "Forgot your Password?",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Enter your email to recover your password.',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: size.height / 19),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          AppTextFormField(
                            controller: _email,
                            secure: false,
                            label: 'Email',
                            icon: Icon(Icons.email, color: Colors.grey),
                            validator: (value) {
                              if (value!.isEmpty)
                                return 'Empty field detected';
                              else if (value.length < 6)
                                return 'email cannot be less than 6 characters';
                              else
                                return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 80),
                  Container(
                    height: 220,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MyAppButton(
                          txt: 'SEND PASSWORD',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              var materialPageRoute = MaterialPageRoute(
                                builder: (_) => PhoneOTP(),
                              );
                              Navigator.push(
                                context,
                                materialPageRoute,
                              );
                            }
                          },
                        ),
                        SizedBox(height: 30),
                        Container(
                            child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => LoginPage()));
                          },
                          child: Text.rich(
                            TextSpan(
                                text: "Remember your password?",
                                style: TextStyle(color: Colors.grey),
                                children: [
                                  TextSpan(
                                    text: 'Login here',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ]),
                          ),
                        )),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _email!.dispose();
    super.dispose();
  }
}
