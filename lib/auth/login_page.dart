import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym/auth/registration_page.dart';
import 'package:gym/screen/dashboard/homepage.dart';
import 'package:gym/screen/dashboard/main_page.dart';
import 'package:gym/style/colors.dart';
import 'package:gym/style/exports.dart';
import 'package:gym/widget/widget_exports.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _email, _password;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 35,
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
              text: "Don't have an account?  ",
              style: TextStyle(color: Colors.grey),
              children: [
                TextSpan(
                  text: 'Sign Up',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),
                    AppName(color: AppColor.mainColor),
                    SizedBox(height: 50),
                    Text("Welcome back!", style: kAuthHead),
                    SizedBox(height: 5),
                    Text('Login into your OneUp Fitness Account',
                        style: introSubtitle),
                    SizedBox(height: 40),
                    AppTextFormField(
                      controller: _email,
                      secure: false,
                      label: 'Email',
                      hintText: 'your@email.com',
                      suffixIcon: Icons.perm_identity,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: (String? value) {
                        if (value!.isEmpty)
                          return 'Empty field detected';
                        else if (value.length < 6)
                          return 'email cannot be less than 6 characters';
                        else if (!value.contains('@'))
                          return 'Invalid email address entered';
                        else
                          return null;
                      },
                    ),
                    SizedBox(height: 15),
                    AppTextFormField(
                      controller: _password,
                      secure: true,
                      label: ' Password',
                      suffixIcon: Icons.lock_outline,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value!.isEmpty)
                          return 'Empty field detected';
                        else if (value.length < 6)
                          return 'password cannot be less than 6 characters';
                        else
                          return null;
                      },
                    ),
                    _isLoading
                        ? Center(
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.2,
                              ),
                            ),
                          )
                        : TextButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  _isLoading = true;
                                });
                                try {
                                  await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: _email!.text,
                                          password: _password!.text)
                                      .then((value) {
                                    _isLoading = false;
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MainPage(uid: value.user!.uid),
                                      ),
                                    );
                                  }).timeout(timeOut);
                                } on SocketException catch (_) {
                                  snackBar(nointernet);
                                } on TimeoutException catch (_) {
                                  snackBar(timeMsg);
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'user-not-found') {
                                    snackBar('No user found for that email.');
                                  } else if (e.code == 'wrong-password') {
                                    snackBar(
                                        'Wrong password provided for that user.');
                                  } else
                                    snackBar('${e.message}');
                                }
                                setState(() {
                                  _isLoading = false;
                                });
                              }
                            },
                            child: Text('Sign In | email & password.'),
                          ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () => _showSnackBar('Comming Soon...'),
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
                    SizedBox(height: 30),
                    _isLoading
                        ? SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(
                              color: AppColor.mainColor,
                              strokeWidth: 2.2,
                            ),
                          )
                        : Text('d')
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // _loginFunction() {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   Timer(Duration(seconds: 5), () {
  //     if (_email!.text != 'yetunde@test.com' && _password!.text != 'pass1234') {
  //       _showSnackBar('Invalid email or password entered');
  //     } else {
  //       _showSnackBar('Login successful...');
  //       Navigator.of(context).pushNamed('/homepage');
  //     }
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   });
  // }

  _showSnackBar(String msg) {
    ScaffoldMessenger.of(context)
      ..showSnackBar(
        SnackBar(
          content: Text('$msg'),
          duration: Duration(seconds: 5),
          action: SnackBarAction(label: 'Close', onPressed: () {}),
        ),
      );
    // ..hideCurrentSnackBar();
  }

  snackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('$msg'),
      action: SnackBarAction(label: 'Close', onPressed: () {}),
    ));
  }
}
