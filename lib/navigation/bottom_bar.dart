import 'package:fitness_app/pages/agenda_page.dart';
import 'package:fitness_app/pages/home_page.dart';
import 'package:fitness_app/pages/notification_page.dart';
import 'package:fitness_app/pages/static_page.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart'; // Import for Material Design Icons

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  // List of pages for navigation
  final List<Widget> _pages = [
    HomePage(),
    StaticPage(),
    AgendaPage(),
    NotificationPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.dumbbell), // Fitness icon for Home
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                MdiIcons.heartPulse), // Fitness icon for Static Page (Health)
            label: 'Health',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.calendarCheck), // Fitness icon for Agenda
            label: 'Agenda',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.bell), // Notifications icon
            label: 'Notifications',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFF547B0),
        unselectedItemColor: Colors.grey[500],
        onTap: _onItemTapped,
      ),
    );
  }
}
