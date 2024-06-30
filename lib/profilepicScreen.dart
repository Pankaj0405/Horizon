import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horizon/camera/phone_camera.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  final ImagePicker picker = ImagePicker();
  List<String> _imageLabels = [];
  // final ImageLabeler _imageLabeler = GoogleMlKit.vision.imageLabeler();
  bool isLoading1 = false;
  String? link;
  File? image;
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  Future<String> fetchData() async {
    setState(() {
      isLoading =
          true; // Set isLoading to false to hide the circular progress indicator
    });
    // await venueController.fetchallUser();

    setState(() {
      isLoading =
          false; // Set isLoading to false to hide the circular progress indicator
    });
    return "Data fetched successfully";
  }

  void _showBottomSheet() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.2,
          maxWidth: double.infinity,
        ),
        context: context,
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _getImageFromCamera();
                      },
                      child: Column(
                        children: [
                          Container(
                            child: Icon(Icons.camera_alt_outlined),
                            width: 40,
                            height: 30,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Camera",
                            style: GoogleFonts.saira(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _getImageFromGallery();
                      },
                      child: Column(
                        children: [
                          Container(
                            child: Icon(Icons.browse_gallery),
                            width: 40,
                            height: 30,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Gallery",
                            style: GoogleFonts.saira(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        });
  }

  Future _getImageFromGallery() async {
    Get.back();
    try {
      setState(() {
        isLoading=true;
      });
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      // final InputImage inputImage = InputImage.fromFilePath(image.path);
      try {
        // final List<ImageLabel> labels = await _imageLabeler.processImage(inputImage);
        List<String> labelsText = [];
        // for (ImageLabel label in labels) {
        //   final String text = label.label; // Image Label
        //   final double confidence = label.confidence; // Label Confidence
        //   labelsText.add('$text: ${(confidence * 100).toStringAsFixed(2)}%');
        // }
        setState(() {
          this.image = imageTemp;
          isLoading=false;
          _imageLabels = labelsText;
        });
      } catch (e) {
        setState(() {
          isLoading=false;
        });
        print("Error processing image: $e");
      }

    } on PlatformException catch (e) {
      setState(() {
        isLoading=false;
      });
      print('Failed to pick image: $e');
    }
  }

  List<CameraDescription> cameras = [];

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
  }

  Future<void> _getImageFromCamera() async {
    Get.back();

    if (cameras.isEmpty) {
      // Initialize cameras if not already done
      await _initializeCamera();
    }

    // final CameraController controller = CameraController(
    //   cameras[0], // Use the first camera
    //   ResolutionPreset.medium,
    // );
    //
    // await controller.initialize();
    setState(() {
      isLoading=true;
    });
    final result = await Get.to(() => CameraScreen3(camera: cameras[0]));

    try {
      if (result != null) {
        final imageTemp = File(result);
        // final InputImage inputImage = InputImage.fromFilePath(result);
        try {
          // final List<ImageLabel> labels = await _imageLabeler.processImage(inputImage);
          List<String> labelsText = [];
          // for (ImageLabel label in labels) {
          //   final String text = label.label; // Image Label
          //   final double confidence = label.confidence; // Label Confidence
          //   labelsText.add('$text: ${(confidence * 100).toStringAsFixed(2)}%');
          // }
          setState(() {
            this.image = imageTemp;
            isLoading=false;
            _imageLabels = labelsText;
          });
        } catch (e) {
          setState(() {
            isLoading=false;
          });
          print("Error processing image: $e");
        }

      }
      // final XFile image = await controller.takePicture();
      //
      // final imageTemp = File(image.path);
      // link = await upload(imageTemp);
      //
      // setState(() {
      //   this.image = imageTemp;
      // });
    } catch (e) {
      setState(() {
        isLoading=false;
      });
      print('Failed to take picture: $e');
    }
    // finally {
    //   await controller.dispose();
    // }
  }


  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: 50,
          width: 50,
          child: CircularProgressIndicator(
            backgroundColor: Colors.green.shade100,
            color: Colors.blueAccent,
          ),
        ),
      ),
    ):Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title:  Text("Report an Incident",
            style: GoogleFonts.saira(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w600)),
      ),
      body:  Container(
        margin: EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 55),
        width: MediaQuery.of(context).size.width * 1,
        child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                _showBottomSheet();
              },
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: image == null
                        ? AssetImage('assets/images/logo.png') as ImageProvider: FileImage(image!),
                  ),
                  borderRadius: BorderRadius.circular(100)

                ),

              ),
            ),
            SizedBox(height: 20),
            TextField(
              // enabled: false,
              maxLines: 3,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(

                hintText: 'Report an Incident',
                filled: true,
                fillColor: Colors.grey.shade100,
              ),
            ),
            GestureDetector(
              onTap: (){
                Get.back();
                Get.snackbar("Thank You!","Incident Report Successfully",titleText: Text("Thank You!",style: TextStyle(
                    color: Colors.green
                ),), messageText: Text("Incident Report Successfully",style: TextStyle(
                    color: Colors.green
                ),),backgroundColor: Colors.white);

              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                 width: MediaQuery.of(context).size.width*1,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10)
                ),
                margin: EdgeInsets.only(top: 30)
                ,child: Center(
                  child: Text(
                    'ADD',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
