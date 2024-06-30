import 'package:flutter/material.dart';
import 'package:horizon/chat_page.dart';
import 'package:horizon/home.dart';
import 'package:horizon/profile.dart';
import 'package:horizon/profilepicScreen.dart';
import 'package:horizon/search.dart';
import 'package:horizon/volunteer.dart';

class Home1 extends StatefulWidget {
  const Home1({super.key});

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  int _selectedIndex = 0;

  void _navigateBottomeBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

// ignore: unused_element
  final List _pages =  [
    const Home(),
    const Search(),
   ChatyPage(),
    const VolunteerPage(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _navigateBottomeBar,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.event,
            ),
            label: "Events & Tours",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
            ),
            label: "ChatBot",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.volunteer_activism_outlined,
            ),
            label: "Volunteers",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
            ),
            label: "Profile",
          ),
        ],
        iconSize: 25,
        elevation: 50,
      ),
    );
  }
}
