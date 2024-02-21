import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/homepage_controller.dart';

// ignore: must_be_immutable
class EventsScreen extends StatefulWidget {
  String eventName;
  String address;
  String imagePath;
  String orgName;
  String desc;
  String price;
  String id;

  EventsScreen(
      {required this.id,
      required this.desc,
      required this.price,
      required this.address,
      required this.orgName,
      required this.imagePath,
      required this.eventName,
      super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {

  final _authController = Get.put(AuthController());

  var textStyle = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    overflow: TextOverflow.ellipsis,
    // Customize text color
  );

  Future<void> _openDialogBox() async {
    return showDialog<void> (
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Bookings', style: textStyle,),
            content: const Text('Are you sure to book?', style: TextStyle(fontSize: 20),),
            actions: [
              ElevatedButton(onPressed: () {
                Get.back();
              }, child: const Text('Cancel')),
              ElevatedButton(onPressed: () {
                _authController.eventBookings(widget.id);
                Get.back();
              }, child: const Text('Book')),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.eventName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    widget.imagePath, // Replace 'image.png' with your image asset path
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                const Divider(
                  height: 30,
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Organized By: ', style: textStyle,),
                      Text(widget.orgName,maxLines: 2, style: textStyle),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Location: ', style: textStyle,),
                      Text(widget.address,maxLines: 2, style: textStyle),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Booking Price: ', style: textStyle,),
                      Text(widget.price, style: textStyle),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Description: ', style: textStyle,),
                      Text(widget.desc,maxLines: 6, style: textStyle),
                    ],
                  ),
                ),
                // Text(
                //   'Organized By: ${widget.orgName}',
                //   style: TextStyle(
                //     fontSize: 24,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.black, // Customize text color
                //   ),
                // ),
                // Text(
                //   'Location: ${widget.address}',
                //   style: TextStyle(
                //     fontSize: 20,
                //     color: Colors.black, // Customize text color
                //   ),
                // ),
                // Text(
                //   'Booking Price: ${widget.price}',
                //   style: TextStyle(
                //     fontSize: 20,
                //     color: Colors.black, // Customize text color
                //   ),
                // ),
                // Text(
                //   'Description: ${widget.desc}',
                //   style: TextStyle(
                //     fontSize: 20,
                //     color: Colors.black, // Customize text color
                //   ),
                // ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _openDialogBox();
                    // Button action
                  },
                  child: const Text('Book'),
                ),
              ],
            ),
          ),
        ));
  }
}
