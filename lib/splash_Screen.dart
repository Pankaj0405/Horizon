import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizon/constants.dart';
import 'package:horizon/controller/auth_controller1.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthController1 authController = Get.put(AuthController1());

  Future<void> checkFirstTimeLogin() async {
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2),()=>authController.checkLoginStatus(firebaseAuth.currentUser));
  }
  @override
  Widget build(BuildContext context) {
    checkFirstTimeLogin();
    return Scaffold(
backgroundColor: Colors.white,
        body: Center(
          child: Container(
            child: const Image(
              image: AssetImage(
                'assets/images/logo.png'
              ),
            ),
          ),
        )
    );
  }
}