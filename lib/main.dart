import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym/routes/routes.dart';
import 'package:gym/style/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'One Up - Gym your :)',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.grey),
        ),
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme:
            BottomNavigationBarThemeData(backgroundColor: Colors.white),
        primaryColor: AppColor.mainColor,
        accentColor: AppColor.mainColor,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme.apply(bodyColor: AppColor.white),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/intro1',
      routes: NavigateRoute.routes,
    );
  }
}


// keytool -list -v -alias androiddebugkey -keystore C:\Users\USER\.android\debug.keystore

// class TTTTTi extends StatelessWidget {
//   const TTTTTi({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: null,
//     );
//   }
// }

// class FlutterTips extends StatefulWidget {
//   final Widget? title1;
//   FlutterTips({Key? key, this.title1}) : super(key: key);

//   @override
//   _FlutterTipsState createState() => _FlutterTipsState(title2: title1);
// }

// class _FlutterTipsState extends State<FlutterTips> {
//   final Widget? title2;
//   _FlutterTipsState({this.title2});

//   bool hideShow = false;
//   String name = '';

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       // appBar: AppBar(),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               // RichText(
//               //   text: TextSpan(
//               //     text: "Didn't remmber password?",
//               //     style: TextStyle(color: Colors.grey),
//               //     children: [
//               //       TextSpan(
//               //         text: 'click here',
//               //         recognizer: TapGestureRecognizer()
//               //           ..onTap = () => print('clciked me'),
//               //         style: TextStyle(
//               //           color: Colors.blue,
//               //         ),
//               //       )
//               //     ],
//               //   ),
//               // ),
//               // Text.rich(
//               //   TextSpan(
//               //     text: "Didn't remmber password?",
//               //     style: TextStyle(color: Colors.grey),
//               //     children: [
//               //       TextSpan(
//               //         text: 'click here',
//               //         recognizer: TapGestureRecognizer()
//               //           ..onTap = () => print('clciked me'),
//               //         style: TextStyle(
//               //           color: Colors.blue,
//               //         ),
//               //       ),
//               //       TextSpan(text: 'did not remmber password')
//               //     ],
//               //   ),
//               // ),
//               // Flexible(flex: 1, child: Container(color: Colors.green)),
//               // Flexible(flex: 2, child: Container(color: Colors.pink)),
//               // Flexible(flex: 3, child: Container(color: Colors.amber)),
//               // Flexible(flex: 2, child: Container(color: Colors.purple)),
//               Container(
//                 height: 300,
//                 child: Row(
//                   children: [
//                     Expanded(flex: 5, child: Container(color: Colors.white)),
//                     Expanded(child: Container(color: Colors.pink)),
//                     Expanded(child: Container(color: Colors.red)),
//                     Expanded(child: Container(color: Colors.pink)),
//                   ],
//                 ),
//               ),
//               Wrap(
//                 children: List.generate(
//                   color.length,
//                   (index) => InteractiveViewer(
//                     boundaryMargin: EdgeInsets.all(8.0),
//                     alignPanAxis: true,
//                     child: CircleAvatar(
//                       backgroundColor: color[index],
//                       // backgroundColor:
//                       //     index.isEven ? Colors.green : Colors.yellow,
//                       child: Icon(Icons.calculate),
//                       radius: 60,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 height: 50,
//                 width: 60,
//                 color: Colors.green,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     FittedBox(
//                       child: Text(
//                         'sds djsjksdkjsdkjdskskskkdskdskdks',
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               TextButton(
//                 child: Text('Hide me'),
//                 onPressed: () {
//                   setState(() {
//                     hideShow = !hideShow;
//                   });
//                 },
//               ),
//               SizedBox(height: 60),
//               Visibility(
//                 visible: hideShow,
//                 child: TextButton(
//                   onPressed: () => showSnackBar(
//                     text: 'SnackBar showing',
//                     // label: 'SnackBar',
//                     onPressed: () => print('Just clicking'),
//                   ),
//                   child: Text('Click me'),
//                 ),
//               ),

//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: LinearProgressIndicator(
//                     color: Colors.red,
//                     backgroundColor: Colors.black38,
//                     minHeight: 20,
//                     value: 1.0, // 0.1 - 1.0
//                   ),
//                 ),
//               ),
//               SelectableText('Width: ${size.width}', style: TextStyle()),

//               Text(
//                 ' Height: ${size.height}',
//                 style: TextStyle(
//                   color: AppColor.red,
//                 ),
//               ),
//               Container(
//                 height: size.height * 0.1,
//                 width: size.width / 12,
//                 color: Colors.green,
//               ),
//               // Column(
//               //   children: List.generate(133, (index) => Text('$index')),
//               // ),
//               title2 ?? Text('${widget.title1}'),
//               GestureDetector(
//                 onTap: () {
//                   // Navigator.pushNamed(context, 'second');
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (_) => SecondScreen(),
//                     ),
//                   );
//                 },
//                 child: InteractiveViewer(
//                   child: Hero(
//                     tag: 'move',
//                     child: CircleAvatar(
//                       backgroundImage: AssetImage('assets/two.jpg'),
//                       radius: 50,
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   showSnackBar({required String? text, label, Function()? onPressed}) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('$text'),
//         backgroundColor: Colors.green,
//         duration: Duration(seconds: 7),
//         action: SnackBarAction(
//           textColor: Colors.red,
//           label: label ?? 'Close me', // label == null ? 'Close' : label,
//           onPressed: onPressed ??
//               () => ScaffoldMessenger.of(context).removeCurrentSnackBar(),
//         ),
//       ),
//     );
//   }

//   List<Color> color = [
//     Colors.red,
//     Colors.yellow,
//     Colors.blue,
//     Colors.purple,
//     Colors.pink,
//     Colors.orange,
//     Colors.black
//   ];
// }

// class SecondScreen extends StatelessWidget {
//   const SecondScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Hero(
//             tag: 'move',
//             child: Image.asset('assets/gymgirl.jpg'),
//           ),
//         ],
//       ),
//     );
//   }
// }
