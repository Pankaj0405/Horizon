import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:horizon/camera/phone_camera.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
class ChatPage1 extends StatefulWidget {
  static const routeName  = '/chat';
  const ChatPage1({super.key});

  @override
  State<ChatPage1> createState() => _ChatPage1State();
}

class _ChatPage1State extends State<ChatPage1> {
  final TextEditingController _chatController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<Map<String, dynamic>> _chatHistory = [];
  void getAnswer() async {
    // final url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=";
    // final uri = Uri.parse(url);
    const apiKey = '';
    print(apiKey);
    if (apiKey == null) {
      print('No \$API_KEY environment variable');

    }
    final (firstImage, secondImage) = await (
   image!.readAsBytes(),
    image!.readAsBytes()
    ).wait;
    final imageParts = [
      DataPart('image/jpeg', firstImage),
      DataPart('image/jpeg', secondImage),
    ];
    final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey!);
    final response = await model.generateContent([
      Content.multi([...imageParts])
    ]);
    print(response.text);

    setState(() {
      _chatHistory.add({
        "time": DateTime.now(),
        "message": response.text,
        "isSender": false,
      });
    });

    _scrollController.jumpTo(
      _scrollController.position.maxScrollExtent,
    );
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
  final ImagePicker picker = ImagePicker();
  List<String> _imageLabels = [];
  // final ImageLabeler _imageLabeler = GoogleMlKit.vision.imageLabeler();
  bool isLoading1 = false;
  String? link;
  File? image;
  bool isLoading = false;
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

          _chatHistory.add({
            "time": DateTime.now(),
            "message": imageTemp,
            "isSender": true,
          });
          _scrollController.jumpTo(
            _scrollController.position.maxScrollExtent,
          );


        setState(() {
          this.image = imageTemp;
          isLoading=false;

        });
          getAnswer();
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
        try {

          setState(() {
            this.image = imageTemp;
            isLoading=false;

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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chat", style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Stack(
        children: [
          Container(
            //get max height
            height: MediaQuery
                .of(context)
                .size
                .height - 160,
            child: ListView.builder(
              itemCount: _chatHistory.length,
              shrinkWrap: false,
              controller: _scrollController,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(
                      left: 14, right: 14, top: 10, bottom: 10),
                  child: Align(
                    alignment: (_chatHistory[index]["isSender"] ? Alignment
                        .topRight : Alignment.topLeft),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        color: (_chatHistory[index]["isSender"] ? Color(
                            0xFFF69170) : Colors.white),
                      ),
                      padding: EdgeInsets.all(16),
                      child:_chatHistory[index]["isSender"]?  Container(
                          height: 190,
                          width: 190,
                          child: Image.file(_chatHistory[index]["message"]!)):Text(_chatHistory[index]["message"],
                          style: TextStyle(fontSize: 15,
                              color: _chatHistory[index]["isSender"] ? Colors
                                  .white : Colors.black)),
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0, vertical: 8.0),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    _showBottomSheet();

                  });

                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                padding: const EdgeInsets.all(0.0),
                child: Ink(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFF69170),
                          Color(0xFF7D96E6),
                        ]
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  ),
                  child: Container(
                      constraints: const BoxConstraints(
                          minWidth: 88.0, minHeight: 36.0),
                      // min sizes for Material buttons
                      alignment: Alignment.center,
                      child: const Icon(Icons.send, color: Colors.white,)
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}