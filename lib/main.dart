import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:horizon/profilepicScreen.dart';
import 'package:horizon/splash_Screen.dart';
import './firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import './home.dart';
import './profile.dart';
import './search.dart';
import './camera/phone_camera.dart';
import './volunteer.dart';
// import 'package:camera/camera.dart';
// chatbot
// late List<CameraDescription> cameras;
// late CameraController controller;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // final apiKey = Platform.environment['AIzaSyB6rlfCo-J1SHsuT1ORnEInttpiCwXV864'];
  // if (apiKey == null) {
  //   print('No \$API_KEY environment variable');
  //   exit(1);
  // }

  // The Gemini 1.5 models are versatile and work with most use cases
  // final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
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
