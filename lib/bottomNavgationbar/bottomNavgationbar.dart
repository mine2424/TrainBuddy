import 'package:flutter/material.dart';
import 'package:trainBuddy/home/home.dart';
import 'package:trainBuddy/settings/setting.dart';
import 'package:trainBuddy/station/station.dart';

class BottomNavgationBarPage extends StatefulWidget {
  @override
  _BottomNavgationBarPageState createState() => _BottomNavgationBarPageState();
}

class _BottomNavgationBarPageState extends State<BottomNavgationBarPage> {
  int _selectedIndex = 0;
  final _pageWidgets = [HomePage(), StationRoutePage(), SettingPage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "train buddy",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: _pageWidgets.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.train_outlined, color: Colors.white),
              label: 'station'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.white),
              label: 'setting'),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.white,
        backgroundColor: Colors.black,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
