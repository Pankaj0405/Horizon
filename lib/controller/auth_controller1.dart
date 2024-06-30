// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizon/constants.dart';
import 'package:horizon/home.dart';
import 'package:horizon/home1.dart';
import 'package:horizon/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthController1 extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxBool isLoading = false.obs;
  static AuthController1 instance = Get.find();
  var showPrefix = false.obs;
  var isLogin = true;
  var phoneNo = "".obs;
  var otp = "".obs;
  var isOtpSent = false.obs;
  var resendAfter = 30.obs;
  var resendOTP = false.obs;
  var firebaseVerificationId = "";
  var statusMessage = "".obs;
  var statusMessageColor = Colors.black.obs;
  // ignore: prefer_typing_uninitialized_variables
  var timer;
  SharedPreferences? prefs;
  // String uniqueId = "";
  DateTime latesteveningattendancedate = DateTime(1900);
  DateTime latestmorningattendancedate = DateTime(1900);
  DateTime latestdailyupdatedate = DateTime(1900);
  // ignore: unused_field
  final bool _h = false;
  // ignore: unused_field
  final bool _a = false;
  // ignore: unused_field
  final bool _d = false;
  String countKey = 'count';

  AuthController() {}
  late Rx<User?> _user;
  User get user => _user.value!;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // String phoneNumber =
    //     firebaseAuth.currentUser!.phoneNumber.toString().substring(3);
    //
    // String additionalChars = "whizz-ev";
    // uniqueId = generateCharacterUniqueId(phoneNumber, additionalChars);
    // checkLoginStatus(_user.value);
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    // checkLoginStatus(_user.value);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    // checkLoginStatus(_user.value);
  }

  // String generateCharacterUniqueId(String phoneNumber, String additionalChars) {
  //   // Remove any non-numeric characters from the phone number
  //   String cleanedPhoneNumber = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
  //
  //   // Combine phone number and additional characters
  //   String combinedData = '$cleanedPhoneNumber$additionalChars';
  //
  //   // Hash the combined data using a simple hash function
  //   double hash = 0;
  //   for (int i = 0; i < combinedData.length; i++) {
  //     hash = 31 * hash + combinedData.codeUnitAt(i);
  //   }
  //
  //   // Convert the hash to a string
  //   String id = hash.toStringAsExponential();
  //
  //   return id;
  // }
  // ignore: unused_field
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  checkLoginStatus(User? user) async {
    // Your logic to check if the user is logged in
    // For demonstration purposes, let's assume isLoggedIn becomes true
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool firstTimeLogin = prefs.getBool('first_time_login') ?? true;
    if (firstTimeLogin) {
      prefs.setBool('first_time_login', false);
      Get.to(() => const LoginPage()); // Navigate to intro screen on first time login
    } else {
      if (user == null) {
        Get.to(() => const LoginPage());
      } else {
Get.offAll(()=>const Home1());
      }
    }
  }

  Future<void> fetchProfileData() async {

  }


  void login() {
    Get.offAll(const Home());
  }

  Future<void> logout() async {
    isOtpSent.value = false;
    Get.offAll(const LoginPage());

    await firebaseAuth.signOut();

    // Get.offAll(LoginPage());
  }

  getOtp() async {
    try {
      firebaseAuth.verifyPhoneNumber(
        phoneNumber: '+91${phoneNo.value}',
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          // Handle verification failure, e.g., show an error message
          print("Verification failed: ${e.message}");
          Get.snackbar("Attention","$e",titleText: const Text("Attention",style: TextStyle(
              color: Colors.black
          ),), messageText: Text("$e",style: const TextStyle(
              color: Colors.red
          ),),backgroundColor: Colors.white);
          authController.isLoading.value = false;
        },
        codeSent: (String verificationId, int? resendToken) {
          firebaseVerificationId = verificationId;
          isOtpSent.value = true;
          statusMessage.value = "OTP sent to +91${phoneNo.value}";
          startResendOtpTimer();

          authController.isLoading.value = false;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      // Handle any other exceptions that might occur during the process
      print("Error: $e");
      Get.snackbar("Attention","$e",titleText: const Text("Attention",style: TextStyle(
          color: Colors.black
      ),), messageText: Text("$e",style: const TextStyle(
          color: Colors.red
      ),),backgroundColor: Colors.white);
      authController.isLoading.value = false;
    }
  }


  resendOtp() async {
    resendOTP.value = false;
    firebaseAuth.verifyPhoneNumber(
      phoneNumber: '+91${phoneNo.value}',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        firebaseVerificationId = verificationId;
        isOtpSent.value = true;
        statusMessage.value = "OTP re-sent to +91${phoneNo.value}";
        Get.snackbar("Attention","OTP re-sent to +91 ${phoneNo.value}",titleText: const Text("Attention",style: TextStyle(
            color: Colors.black
        ),), messageText: Text("OTP re-sent to +91 ${phoneNo.value}",style: const TextStyle(
            color: Colors.green
        ),),backgroundColor: Colors.white);
        startResendOtpTimer();
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  verifyOTP() async {
    try {
      authController.isLoading.value=true;
      statusMessage.value = "Verifying... ${otp.value}";
      // Create a PhoneAuthCredential with the code
      print(firebaseVerificationId);
      print(otp.value);
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: firebaseVerificationId, smsCode: otp.value);
      // Sign the user in (or link) with the credential
      UserCredential userCredential= await firebaseAuth.signInWithCredential(credential);
     // collection vendors doc(userCredential.user!.uid) set(phone, userId) setMergeOptions true
      final vendorId = firebaseAuth.currentUser!.uid;

      await _firestore.collection('vendors').doc(vendorId).set({
        'phone': phoneNo.value,
        'userId': vendorId,
        'usertype': 'vendor',
      }, SetOptions(merge: true));

      print('user credential ${userCredential.user!.uid}');
      // await fetchProfileData();
      Get.offAll(()=>const Home1());
      Get.snackbar("Success","Login Successfully",titleText: const Text("Success",style: TextStyle(
          color: Colors.black
      ),), messageText: const Text("Login Successfully",style: TextStyle(
          color: Colors.green
      ),),backgroundColor: Colors.white);
      authController.isLoading.value=false;
    } catch (e) {
      statusMessage.value = "Invalid or Incorrect OTP.Please retry!";
      statusMessageColor = Colors.red.obs;
      print("reason $e");
      Get.snackbar("Attention","Invalid or Incorrect OTP.Please retry!",titleText: const Text("Attention",style: TextStyle(
          color: Colors.black
      ),), messageText: const Text("Invalid or Incorrect OTP.Please retry!",style: TextStyle(
          color: Colors.red
      ),),backgroundColor: Colors.white);
      authController.isLoading.value=false;
    }
  }

  startResendOtpTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendAfter.value != 0) {
        resendAfter.value--;
      } else {
        resendAfter.value = 30;
        resendOTP.value = true;
        timer.cancel();
      }
      update();
    });
  }

}
