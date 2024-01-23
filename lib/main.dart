import 'package:first_app/add.dart';
import 'package:first_app/home.dart';
import 'package:first_app/notification.dart';
import 'package:first_app/profile.dart';
import 'package:first_app/search.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  void _navigateBottomeBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

// ignore: unused_element
  final List _pages = const[
    Home(),
    Search(),
    Add(),
    NotificationPage(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          onTap: _navigateBottomeBar,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: "search",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle,
                
                grade: 70,
              ),
              label: "add",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.message,
              ),
              label: "message", 
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
              ),
              label: "profile",
            ),
          ],
          iconSize: 25,
          elevation: 50,
          
        ),
        
      ),
    );
  }

  Widget buildBigCard(String inputText1, String inputText2) => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 190,
            width: 400,
            color: Colors.purple.shade300,
          ),
          Container(
            height: 100,
            width: 400,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                inputText1,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 9.0),
              child: Text(
                inputText2,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
      );

  Widget buildSmallCard(String inputText1, String inputText2) => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 190,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.pink.shade300,
                borderRadius: BorderRadius.circular(25)),
          ),
          Container(
            height: 100,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                inputText1,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: const EdgeInsets.only(left: 9.0),
              child: Text(
                inputText2,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
      );
}
