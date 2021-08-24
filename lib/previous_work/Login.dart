// import 'package:flutter/material.dart';
// import 'package:gym/screen/firebase-service.dart';

// import 'package:gym/widget/text_form.dart';
// import 'dart:async';
// import 'dart:io';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:gym/auth/login_page.dart';
// import 'package:gym/screen/dashboard/main_page.dart';

// class Login extends StatefulWidget {
//   Login({Key? key}) : super(key: key);

//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   final _formKey = GlobalKey<FormState>();
//   FirebaseService service = FirebaseService();
//   DatabaseReference db = FirebaseDatabase.instance.reference().child("Users");

//   TextEditingController? _lastname,
//       _firstname,
//       _email,
//       _phone,
//       _password,
//       _passwordd;
//   FocusNode? pass;
//   String? email;
//   bool _hideShow = true;
//   bool _hideshoww = true;
//   bool isLoading = false, btnLoad = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Column(
//           children: [
//             Text(
//               "ONE UP",
//               style: TextStyle(
//                   fontWeight: FontWeight.w700, fontSize: 30, color: Colors.red),
//             ),
//             Text(
//               "F  I  T  N  E  S  S",
//               style: TextStyle(
//                   fontWeight: FontWeight.w500, fontSize: 15, color: Colors.red),
//             ),
//           ],
//         ),
//         iconTheme: IconThemeData(
//           color: Colors.black,
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 SizedBox(height: 30),
//                 Text(
//                   "Let's get started!",
//                   style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.red),
//                 ),
//                 SizedBox(height: 5),
//                 Text(
//                   'Create an account to get all features',
//                   style: TextStyle(color: Colors.grey),
//                 ),
//                 SizedBox(height: 30),
//                 Form(
//                   key: _formKey,
//                   child: Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: Column(
//                       children: [
//                         AppTextFormField(
//                           controller: _lastname,
//                           secure: false,
//                           label: 'Lastname',
//                           icon: Icon(Icons.account_circle_rounded,
//                               color: Colors.grey),
//                           validator: (value) {
//                             if (value!.isEmpty)
//                               return 'Empty field detected';
//                             else if (value.length < 2)
//                               return 'Lastname cannot be less than 3 characters';
//                             else
//                               return null;
//                           },
//                         ),
//                         SizedBox(height: 15),
//                         AppTextFormField(
//                           controller: _firstname,
//                           secure: false,
//                           label: 'Firstname',
//                           icon: Icon(Icons.account_circle_rounded,
//                               color: Colors.grey),
//                           validator: (value) {
//                             if (value!.isEmpty)
//                               return 'Empty field detected';
//                             else if (value.length < 2)
//                               return 'Firstname cannot be less than 3 characters';
//                             else
//                               return null;
//                           },
//                         ),
//                         SizedBox(height: 15),
//                         AppTextFormField(
//                           controller: _email,
//                           secure: false,
//                           label: 'Email',
//                           icon: Icon(Icons.email, color: Colors.grey),
//                           validator: (value) {
//                             if (value!.isEmpty)
//                               return 'Empty field detected';
//                             else if (value.length < 6)
//                               return 'email cannot be less than 6 characters';
//                             else
//                               return null;
//                           },
//                         ),
//                         SizedBox(height: 15),
//                         AppTextFormField(
//                           controller: _phone,
//                           secure: false,
//                           label: 'Phone',
//                           keyboardType: TextInputType.number,
//                           icon: Icon(Icons.phone, color: Colors.grey),
//                           validator: (value) {
//                             if (value!.isEmpty)
//                               return 'Empty field detected';
//                             else if (value.length < 11)
//                               return 'Number cannot be less than 11 characters';
//                             else
//                               return null;
//                           },
//                         ),
//                         SizedBox(height: 15),
//                         AppTextFormField(
//                           controller: _password,
//                           secure: _hideShow,
//                           label: 'Password',
//                           // icon: Icon(Icons.visibility_off),
//                           icon: IconButton(
//                             onPressed: () {
//                               setState(() {
//                                 _hideShow = !_hideShow;
//                               });
//                             },
//                             icon: Icon(_hideShow ? Icons.lock : Icons.lock_open,
//                                 color: Colors.grey),
//                           ),
//                           validator: (value) {
//                             if (value!.isEmpty)
//                               return 'Empty field detected';
//                             else if (value.length < 6)
//                               return 'password cannot be less than 6 characters';
//                             else
//                               return null;
//                           },
//                         ),
//                         SizedBox(height: 15),
//                         AppTextFormField(
//                           controller: _passwordd,
//                           secure: _hideshoww,
//                           label: 'Confirm password',
//                           icon: IconButton(
//                             onPressed: () {
//                               setState(() {
//                                 _hideshoww = !_hideshoww;
//                               });
//                             },
//                             icon: Icon(
//                                 _hideshoww ? Icons.lock : Icons.lock_open,
//                                 color: Colors.grey),
//                           ),
//                           validator: (value) {
//                             if (value!.isEmpty)
//                               return 'Empty field detected';
//                             else if (value.length < 6)
//                               return 'password cannot be less than 6 characters';
//                             else if (value != _password!.text) {
//                               return ' password doesnt match';
//                             } else
//                               return null;
//                           },
//                         ),
//                         SizedBox(height: 30),
//                         !btnLoad
//                             ? TextButton(
//                                 onPressed: () async {
//                                   if (_formKey.currentState!.validate()) {
//                                     print(_phone!.text);
//                                     print(_email!.text);
//                                     print(_lastname!.text);
//                                     print(_firstname!.text);
//                                     // setState(() {
//                                     //   btnLoad = true;
//                                     // });
//                                     // try {
//                                     //   await FirebaseAuth.instance
//                                     //       .createUserWithEmailAndPassword(
//                                     //           email: _email!.text.trim(),
//                                     //           password: _password!.text)
//                                     //       .then((value) {
//                                     //     db.child(value.user!.uid).set({
//                                     //       "uid": value.user!.uid,
//                                     //       "email": _email!.text,
//                                     //       "lastname": _lastname!.text,
//                                     //       "firstname": _firstname!.text,
//                                     //       "phone": _phone!.text,
//                                     //     }).then((res) {
//                                     //       btnLoad = false;
//                                     //       Navigator.pushReplacement(
//                                     //         context,
//                                     //         MaterialPageRoute(
//                                     //           builder: (context) => MainPage(),
//                                     //         ),
//                                     //       );
//                                     //     });
//                                     //   }).timeout(timeOut);
//                                     // } on SocketException catch (_) {
//                                     //   snackBar(nointernet);
//                                     // } on TimeoutException catch (_) {
//                                     //   snackBar(timeMsg);
//                                     // } on FirebaseAuthException catch (e) {
//                                     //   if (e.code == 'email-already-in-use') {
//                                     //     snackBar(
//                                     //         'The email address is already in use by another account.');
//                                     //     print(e.message);
//                                     //   } else {
//                                     //     snackBar('${e.message}');
//                                     //   }
//                                     // }
//                                     // setState(() {
//                                     //   btnLoad = false;
//                                     // });
//                                   }
//                                 },
//                                 child: Text('Sign up',
//                                     style: TextStyle(color: Colors.red)))
//                             : Center(
//                                 child: SizedBox(
//                                   height: 30,
//                                   width: 30,
//                                   child: CircularProgressIndicator(
//                                     strokeWidth: 2.2,
//                                   ),
//                                 ),
//                               ),
//                         !isLoading
//                             ? TextButton(
//                                 onPressed: () async {
//                                   setState(() {
//                                     isLoading = true;
//                                   });
//                                   try {
//                                     await service.signInwithGoogle().then(
//                                       (value) {
//                                         Navigator.pushReplacement(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) => LoginScreen(),
//                                           ),
//                                         );
//                                       },
//                                     ).timeout(timeOut);
//                                     print(
//                                         'Sign with Google completed - navigate to home screen');
//                                   } on SocketException catch (_) {
//                                     snackBar(nointernet);
//                                   } on TimeoutException catch (_) {
//                                     snackBar(timeMsg);
//                                   } on FirebaseAuthException catch (e) {
//                                     if (e.code == 'email-already-in-use') {
//                                       snackBar(
//                                           'The email address is already in use by another account.');
//                                       print(e.message);
//                                     } else {
//                                       snackBar('${e.message}');
//                                     }
//                                   }
//                                   setState(() {
//                                     isLoading = false;
//                                   });
//                                 },
//                                 child: Text('Sign up with google',
//                                     style: TextStyle(color: Colors.red)),
//                               )
//                             : SizedBox(
//                                 height: 20,
//                                 width: 20,
//                                 child: CircularProgressIndicator(
//                                   strokeWidth: 2.2,
//                                 ),
//                               ),
//                         Container(
//                             child: GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (_) => LoginScreen()));
//                           },
//                           child: Text.rich(
//                             TextSpan(
//                                 text: "Already have an account?",
//                                 style: TextStyle(color: Colors.grey),
//                                 children: [
//                                   TextSpan(
//                                     text: 'Login here',
//                                     style: TextStyle(color: Colors.black),
//                                   ),
//                                 ]),
//                           ),
//                         )),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   snackBar(String msg) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text('$msg'),
//       action: SnackBarAction(label: 'Close', onPressed: () {}),
//     ));
//   }

//   @override
//   void initState() {
//     super.initState();
//     _lastname = TextEditingController();
//     _firstname = TextEditingController();
//     _email = TextEditingController();
//     _password = TextEditingController();
//     _passwordd = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _firstname!.dispose();
//     _lastname!.dispose();
//     _email!.dispose();
//     _password!.dispose();
//     _passwordd!.dispose();
//     super.dispose();
//   }
// }

// class TextFieldd extends StatelessWidget {
//   final TextEditingController? controller;
//   final String label;
//   const TextFieldd(this.controller, this.label);

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       style: TextStyle(color: Colors.black),
//       controller: controller,
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       validator: (value) {
//         if (value!.isEmpty)
//           return 'Empty field detected';
//         else
//           return null;
//       },
//       decoration: InputDecoration(
//         contentPadding: EdgeInsets.fromLTRB(5, 8, 10, 5),
//         isDense: true,
//         labelText: '$label',
//       ),
//     );
//   }
// }

// final Duration timeOut = Duration(seconds: 30);
// final String timeMsg = 'Request timeout. Kindly try again';
// final String nointernet = 'No active internet connection, Kindly try again!';
// final kStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
