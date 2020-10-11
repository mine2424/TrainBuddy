import 'package:flutter/material.dart';
import 'package:trainBuddy/home/home.dart';
import 'package:trainBuddy/routeMap/route.dart';
import 'package:trainBuddy/station/station.dart';

class BottomNavgationBarPage extends StatefulWidget {
  @override
  _BottomNavgationBarPageState createState() => _BottomNavgationBarPageState();
}

class _BottomNavgationBarPageState extends State<BottomNavgationBarPage> {
  int _selectedIndex = 0;
  final _pageWidgets = [HomePage(), StationRoutePage(), RouteMapPage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30),
        child: AppBar(
          elevation: 0,
          title: Text(
            "train buddy",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
      ),
      body: _pageWidgets.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit, color: Colors.white), label: 'station'),
          BottomNavigationBarItem(
              icon: Icon(Icons.photo_album, color: Colors.white),
              label: 'route map'),
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
