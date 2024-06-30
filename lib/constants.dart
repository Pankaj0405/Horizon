import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:horizon/controller/auth_controller1.dart';
// import 'package:flutter/material.dart';
// import 'package:horizon_vendor/Controllers/auth_controller1.dart';

var firebaseAuth = FirebaseAuth.instance;
// var buttonColor = const Color(0xFF0098FF);
var firestore = FirebaseFirestore.instance;
var buttonColor = const Color(0xFF0098FF);
var authController = AuthController1.instance;