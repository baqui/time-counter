import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _index = 0;

  void _setTab(index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
  return BottomNavigationBar(
      currentIndex: _index,
      onTap: _setTab,
      fixedColor: Colors.white,
      backgroundColor: Colors.black45,
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.calendar_today),
          title: new Text('Calendar'),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.work),
          title: new Text('Projects'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile')
        )
      ],
    );
  }
}