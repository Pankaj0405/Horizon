import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import './firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import './home.dart';
import './profile.dart';
import './search.dart';
import './camera/phone_camera.dart';
import './volunteer.dart';
// import 'package:camera/camera.dart';

// late List<CameraDescription> cameras;
// late CameraController controller;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
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
  final List _pages =  [
    const Home(),
    const Search(),
    const CameraPage(),
    const VolunteerPage(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                Icons.photo_camera_outlined,
              ),
              label: "Camera",
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
      ),
    );
  }

  // Widget buildBigCard(String inputText1, String inputText2) => Stack(
  //       alignment: Alignment.bottomCenter,
  //       children: [
  //         Container(
  //           height: 190,
  //           width: 400,
  //           color: Colors.purple.shade300,
  //         ),
  //         Container(
  //           height: 100,
  //           width: 400,
  //           decoration: BoxDecoration(
  //               color: Colors.grey.shade300,
  //               borderRadius: BorderRadius.circular(15)),
  //           child: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Text(
  //               inputText1,
  //               style: const TextStyle(
  //                 fontSize: 25,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ),
  //         ),
  //         Container(
  //           height: 50,
  //           width: 400,
  //           decoration: BoxDecoration(
  //             color: Colors.grey.shade300,
  //           ),
  //           child: Padding(
  //             padding: const EdgeInsets.only(left: 9.0),
  //             child: Text(
  //               inputText2,
  //               style: const TextStyle(
  //                 fontSize: 18,
  //               ),
  //             ),
  //           ),
  //         )
  //       ],
  //     );
  //
  // Widget buildSmallCard(String inputText1, String inputText2) => Stack(
  //       alignment: Alignment.bottomCenter,
  //       children: [
  //         Container(
  //           height: 190,
  //           width: 200,
  //           decoration: BoxDecoration(
  //               color: Colors.pink.shade300,
  //               borderRadius: BorderRadius.circular(25)),
  //         ),
  //         Container(
  //           height: 100,
  //           width: 200,
  //           decoration: BoxDecoration(
  //               color: Colors.grey.shade300,
  //               borderRadius: BorderRadius.circular(15)),
  //           child: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Text(
  //               inputText1,
  //               style: const TextStyle(
  //                 fontSize: 25,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ),
  //         ),
  //         Container(
  //           height: 50,
  //           width: 200,
  //           decoration: BoxDecoration(
  //               color: Colors.grey.shade300,
  //               borderRadius: BorderRadius.circular(25)),
  //           child: Padding(
  //             padding: const EdgeInsets.only(left: 9.0),
  //             child: Text(
  //               inputText2,
  //               style: const TextStyle(
  //                 fontSize: 18,
  //               ),
  //             ),
  //           ),
  //         )
  //       ],
  //     );
}
