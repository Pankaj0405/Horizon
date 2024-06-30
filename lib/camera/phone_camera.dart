// camera_screen.dart
// ignore_for_file: avoid_print

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraScreen3 extends StatefulWidget {
  final CameraDescription camera;

  const CameraScreen3({super.key, required this.camera});

  @override
  // ignore: library_private_types_in_public_api
  _CameraScreen3State createState() => _CameraScreen3State();
}

class _CameraScreen3State extends State<CameraScreen3> {
  late CameraController _controller;
  late int _selectedCameraIndex;
  bool _isFlashOn = false;
  List<IconData> iconList = [
    //list of icons that required by animated navigation bar.
    Icons.switch_camera_outlined,
    Icons.flash_off_outlined,
  ];

  @override
  void initState() {
    super.initState();
    _selectedCameraIndex = 0;
    _initCameraController();
  }
  int _bottomNavIndex = 0;

  Future<void> _initCameraController() async {
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    await _controller.initialize();

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Container();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Screen'),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CameraPreview(_controller),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     IconButton(
          //       onPressed: _onSwitchCamera,
          //       icon: Icon(Icons.switch_camera),
          //       color: Colors.white,
          //     ),
          //     IconButton(
          //       onPressed: _onToggleFlash,
          //       icon: _isFlashOn
          //           ? Icon(Icons.flash_on)
          //           : Icon(Icons.flash_off),
          //       color: Colors.white,
          //     ),
          //   ],
          // ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 100,
        width: 100,
        child: ClipOval(
          child: FloatingActionButton(
            onPressed: () async {
              try {
                final XFile image = await _controller.takePicture();

                // ignore: use_build_context_synchronously
                Navigator.pop(context, image.path);
              } catch (e) {
                print('Failed to take picture: $e');
              }
            },
            child: const Icon(Icons.camera),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 105,
        child: AnimatedBottomNavigationBar.builder(
          itemCount: iconList.length,
          tabBuilder: (int index, bool isActive) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconList[index],
                  size: 25,
                  color: Colors.white,
                ),
                const SizedBox(height: 4),
                // Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 8),
                //     child: Text(
                //       iconname[index],
                //       style: TextStyle(
                //         fontSize: 15,
                //         color: Colors.white,
                //       ),
                //     ))
              ],
            );
          },
          height: 80,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          notchMargin: 06,
          gapWidth: 110,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          notchSmoothness: NotchSmoothness.defaultEdge,
          onTap: (index) {
            setState(() {
              _bottomNavIndex = index;
              if(index==0){
                // Get.to(HomePage());
                _onSwitchCamera();
              }
              else{
                // Get.to(SettlementsScreen());
                _onToggleFlash();
              }
              print(_bottomNavIndex);
            });
          },
          backgroundColor: const Color(0xFF728adf),
        ),
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _onSwitchCamera() async {
    // Get the list of available cameras
    List<CameraDescription> cameras = await availableCameras();

    // Find the index of the front-facing camera
    // ignore: unused_local_variable
    int frontCameraIndex = cameras.indexWhere(
          (camera) => camera.lensDirection == CameraLensDirection.front,
    );

    // Toggle between front and back cameras
    _selectedCameraIndex = (_selectedCameraIndex + 1) % cameras.length;

    // Update the camera controller with the selected camera
    await _controller.dispose();
    _controller = CameraController(
      cameras[_selectedCameraIndex],
      ResolutionPreset.medium,
    );

    // Initialize the updated camera controller
    await _controller.initialize();
    setState(() {
      _isFlashOn = false;
      _isFlashOn?iconList[1]=Icons.flash_on_outlined:iconList[1]=Icons.flash_off_outlined;
    });
  }

  void _onToggleFlash() {
    setState(() {
      _isFlashOn = !_isFlashOn;
    });

    _controller.setFlashMode(_isFlashOn ? FlashMode.torch : FlashMode.off);
    setState(() {
      _isFlashOn?iconList[1]=Icons.flash_on_outlined:iconList[1]=Icons.flash_off_outlined;
    });
  }
}