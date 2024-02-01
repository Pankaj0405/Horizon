import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  void openFiles() async {
    FilePickerResult? resultFile = await FilePicker.platform.pickFiles();
    if (resultFile != null) {
      // PlatformFile file = resultFile.files.first;
      // print(file.name);
      // print(file.bytes);
      // print(file.extension);
      // print(file.path);
    } else {}
  }

  late List<CameraDescription> cameras;
  late CameraController cameraController;

  int direction = 0;

  @override
  void initState() {
    startCamera(0);
    super.initState();
  }

  void startCamera(int direction) async {
    cameras = await availableCameras();

    cameraController = CameraController(
      cameras[direction],
      ResolutionPreset.high,
      enableAudio: false,
    );

    await cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {}); //   To refresh widget
    }).catchError((e) {});
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (cameraController.value.isInitialized) {
      return Scaffold(
        body: Stack(
          children: [
            CameraPreview(cameraController),
            GestureDetector(
              onTap: () {
                setState(() {
                  direction = direction == 0 ? 1 : 0;
                  startCamera(direction);
                });
              },
              child: button(
                Icons.flip_camera_android_outlined,
                Alignment.bottomLeft,
              ),
            ),
            GestureDetector(
              onTap: () {
                cameraController.takePicture().then(
                  (XFile? file) {
                    if (mounted) {
                      if (file != null) {}
                    }
                  },
                );
              },
              child: button(
                Icons.camera_alt_outlined,
                Alignment.bottomCenter,
              ),
            ),
            GestureDetector(
              onTap: () {
                openFiles();
              },
              child: button(
                Icons.image_outlined,
                Alignment.bottomRight,
              ),
            ),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  Widget button(IconData icon, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(2, 2),
              blurRadius: 10,
            ),
          ],
        ),
        child: Icon(
          icon,
          color: Colors.black54,
        ),
      ),
    );
  }
}
