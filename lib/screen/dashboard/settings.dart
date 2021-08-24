import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym/screen/firebase-service.dart';
import 'package:gym/style/exports.dart';

class SettingsPage extends StatefulWidget {
  final String uid;
  SettingsPage({Key? key, required this.uid}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final db = FirebaseDatabase.instance.reference().child("Users");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseService().signOutFromGoogle().then((value) {
                Navigator.of(context).pushReplacementNamed('/login');
              });
            },
            icon: Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: FutureBuilder(
        future: db.child('${widget.uid}').once(),
        builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('An error occured');
          } else if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/two.jpg'),
                        // backgroundImage: snapshot.data!.value['pic'].isEmpty ? AssetImage('assets/two.jpg') : Image.network('${snapshot.data!.value['pic']}'),
                        backgroundColor: Colors.white,
                        radius: 60,
                      ),
                      SizedBox(height: 16),
                      Text(
                        '${snapshot.data!.value['firstname']}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                      ),
                      Text('Member since june 2020', style: introSubtitle),
                      SizedBox(height: 20),
                      Container(
                        height: 80,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColor.mainColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            userStat('196 cm', 'height'),
                            userStat('27', 'years old'),
                            userStat('87,4 kg', 'weight'),
                          ],
                        ),
                      ),
                      SizedBox(height: 12),
                      Exampple(),
                    ],
                  ),
                ),
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget userStat(String title, subtitle) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: style1),
        Text(subtitle, style: style2),
      ],
    );
  }
}

final style1 = GoogleFonts.sourceSerifPro(
  fontSize: 16,
  fontWeight: FontWeight.w900,
);

final style2 = GoogleFonts.sourceSansPro(
  fontSize: 14,
  color: Colors.white60,
);

class Exampple extends StatelessWidget {
  const Exampple({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final db = FirebaseDatabase.instance.reference().child("Users");
    List<Map<dynamic, dynamic>> lists = [];

    return Container(
      child: FutureBuilder(
        future: db.once(),
        builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
          if (snapshot.hasData) {
            lists.clear();
            Map<dynamic, dynamic> values = snapshot.data!.value;
            values.forEach((key, values) {
              lists.add(values);
            });
            return ListView.builder(
              itemCount: lists.length,
              shrinkWrap: true,
              itemBuilder: (context, int index) {
                return Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Full name: ' + lists[index]['firstname'],
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'User ID: ' + lists[index]['uid'],
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Email address: ' + lists[index]['email'],
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
