//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:gym/widget/button.dart';

class MyHomePage extends StatefulWidget {
  final String uid;
  MyHomePage({Key? key, required this.uid}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hello",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    )),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/two.jpg'),
                  backgroundColor: Colors.white,
                  radius: 25,
                ),
              ],
            ),
            Text(
              "John Smith",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 25),
            Text("Let's continue your fitness challenge.",
                style: TextStyle(
                  color: Colors.grey,
                )),
            SizedBox(height: 20),
            Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(14)),
              child: number(),
            ),
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 120,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/gym-m.jpg',
                            ),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.black45, BlendMode.darken),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 25.0,
                              top: 30,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Today's workout",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text("12 excercises")
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 65.0, right: 10.0),
                          child: MyAppButton(
                            txt: 'START',
                            onPressed: () {
                              Navigator.of(context).pushReplacementNamed('/');
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 120,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/sit.jpg',
                    ),
                    fit: BoxFit.cover,
                    colorFilter:
                        ColorFilter.mode(Colors.black45, BlendMode.darken),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 25.0,
                    top: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Quads & Deltoids",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text("7 excercises completed"),
                      SizedBox(height: 15),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(14)),
                          height: 30,
                          width: 180,
                          child: Center(child: Text("Previous Workout"))),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 120,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 25.0, top: 20),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Connect your devices',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Bluetooth',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                        margin: EdgeInsets.only(left: 12, bottom: 12, top: 12),
                        // height: 60,
                        // width: 60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/newp.jpg'),
                            fit: BoxFit.cover,
                          ),
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 120,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/gym_girl.jpg',
                    ),
                    fit: BoxFit.cover,
                    colorFilter:
                        ColorFilter.mode(Colors.black45, BlendMode.darken),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 25.0,
                    top: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Push up Routine",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text("12 excercises"),
                      SizedBox(height: 15),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(14)),
                          height: 30,
                          width: 180,
                          child: Center(child: Text("Medium difficulty"))),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget number() {
    return ListView.builder(
      itemCount: 12,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        var count = index + 1;
        return Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.only(top: 10),
          child: CircleAvatar(
            child: Text('$count'),
            radius: 20,
            backgroundColor: Colors.red,
          ),
        );
      },
    );
  }
}
