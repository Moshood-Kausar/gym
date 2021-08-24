import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym/auth/registration_page.dart';
import 'package:gym/screen/dashboard/homepage.dart';
import 'package:gym/widget/button.dart';
import 'package:gym/widget/text_form.dart';
import 'ForgotPass.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _email, _password;
  FocusNode? pass;
  String? email;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    User? result = FirebaseAuth.instance.currentUser;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 30,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => RegistrationScreen(),
                ),
              );
            },
            child: Text.rich(
              TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(color: Colors.grey),
                  children: [
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(color: Colors.black),
                    ),
                  ]),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 70),
                Text(
                  "ONE UP",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 40,
                      color: Colors.red),
                ),
                Text(
                  "FITNESS",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      letterSpacing: 8.5,
                      color: Colors.red),
                ),
                SizedBox(height: 60),
                Text("Welcome back!",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    )),
                SizedBox(height: 5),
                Text('Login into your OneUp Fitness Account',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.grey)),
                SizedBox(height: 40),
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
                          hintText: 'your@email.com',
                          icon: Icon(Icons.account_circle_rounded,
                              color: Colors.grey),
                          validator: (value) {
                            if (value!.isEmpty)
                              return 'Empty field detected';
                            else if (value.length < 6)
                              return 'email cannot be less than 6 characters';
                            else
                              return null;
                          },
                        ),
                        SizedBox(height: 15),
                        AppTextFormField(
                          controller: _password,
                          secure: true,
                          label: ' Password',
                          icon: Icon(Icons.lock, color: Colors.grey),
                          validator: (value) {
                            if (value!.isEmpty)
                              return 'Empty field detected';
                            else if (value.length < 6)
                              return 'password cannot be less than 6 characters';
                            else
                              return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => LoginPass()));
                      },
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 60),
                MyAppButton(
                  txt: 'LOG IN',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MyHomePage(uid: result!.uid),
                        ),
                      );
                    }
                  },
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _email!.dispose();
    _password!.dispose();
    super.dispose();
  }
}
