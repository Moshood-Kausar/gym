import 'package:flutter/material.dart';
import 'package:gym/screen/dashboard/homepage.dart';
import 'package:gym/screen/dashboard/settings.dart';
import 'package:gym/style/exports.dart';

class MainPage extends StatefulWidget {
  final String? uid;
  MainPage({Key? key, this.uid}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  List<Widget> _children = [];

  @override
  void initState() {
    super.initState();
    _children.insert(0, MyHomePage(uid: '${widget.uid}'));
    _children.insert(1, MyHomePage(uid: '${widget.uid}'));
    _children.insert(2, SettingsPage(uid: '${widget.uid}'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: AppColor.mainColor,
        unselectedItemColor: Colors.grey,
        iconSize: 26,
        selectedFontSize: 0,
        elevation: 0,
        onTap: onTabTapped,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.self_improvement_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: ''),
        ],
      ),
      body: _children[_currentIndex],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
