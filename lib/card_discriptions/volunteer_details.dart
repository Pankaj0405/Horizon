import 'package:flutter/material.dart';

// ignore: must_be_immutable
class VolunteerScreen extends StatefulWidget {
  String imagePath;
  String eventName;
  String maxSlots;
  String role;
  String fromDate;
  String toDate;
  String startTime;
  String endTime;
  String address;
  VolunteerScreen({required this.imagePath, required this.eventName, required this.role, required this.fromDate, required this.maxSlots, required this.toDate, required this.endTime, required this.startTime, required this.address,super.key});

  @override
  State<VolunteerScreen> createState() => _VolunteerScreenState();
}

class _VolunteerScreenState extends State<VolunteerScreen> {

  var textStyle1= const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  var textStyle2 = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 270,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(widget.imagePath),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0, left: 15),
                      child: IconButton(
                        style: const ButtonStyle(
                          backgroundColor:
                          MaterialStatePropertyAll(Colors.white54),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              ListTile(
                // leading: Icon(Icons.event),
                title: Text(
                  widget.eventName,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.location_on_outlined),
                title: Text(
                  widget.address,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.calendar_month_outlined),
                title: Text(
                  '${widget.fromDate} - ${widget.toDate}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.alarm),
                title: Text(
                  '${widget.startTime} - ${widget.endTime}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.people_alt_outlined),
                title: Text(
                  widget.maxSlots,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.role,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     // crossAxisAlignment: CrossAxisAlignment.stretch,
              //     children: [
              //       Card(
              //         child: Padding(
              //           padding: const EdgeInsets.all(10),
              //           child: Column(
              //             children: [
              //               Text('Last Date:', style: textStyle1,),
              //               Text(widget.fromDate, style: textStyle2,),
              //             ],
              //           ),
              //         ),
              //       ),
              //       Card(
              //         child: Padding(
              //           padding: const EdgeInsets.all(10),
              //           child: Column(
              //             children: [
              //               Text('Max-Users:', style: textStyle1,),
              //               Text(widget.maxSlots, style: textStyle2,),
              //             ],
              //           ),
              //         ),
              //       ),
              //       // ListTile(
              //       //   leading: Text('From:', style: textStyle1,),
              //       //   trailing: Text(widget.fromDate, style: textStyle2,),
              //       // ),
              //       // ListTile(
              //       //   leading: Text('To:', style: textStyle1,),
              //       //   trailing: Text(widget.toDate, style: textStyle2,),
              //       // ),
              //       // ListTile(
              //       //   leading: Text('Max-Users:', style: textStyle1,),
              //       //   trailing: Text(widget.maxSlots, style: textStyle2,),
              //       // ),
              //       // Padding(
              //       //   padding: const EdgeInsets.all(8.0),
              //       //   child: Text(
              //       //     'From: ${widget.fromDate}',
              //       //     style: TextStyle(
              //       //       fontSize: 18,
              //       //       fontWeight: FontWeight.w500,
              //       //     ),
              //       //   ),
              //       // ),
              //       // Padding(
              //       //   padding: const EdgeInsets.all(8.0),
              //       //   child: Text(
              //       //     'To: ${widget.toDate}',
              //       //     style: TextStyle(
              //       //       fontSize: 18,
              //       //       fontWeight: FontWeight.w500,
              //       //     ),
              //       //   ),
              //       // ),
              //       // Padding(
              //       //   padding: const EdgeInsets.symmetric(
              //       //     horizontal: 8,
              //       //   ),
              //       //   child: Text('Max-Users: ${widget.maxSlots}', style: TextStyle(
              //       //     fontSize: 20,
              //       //     fontWeight: FontWeight.w500,
              //       //   ),),
              //       // ),
              //     ],
              //   ),
              // ),
              // Column(
              //   // mainAxisAlignment: MainAxisAlignment.start,
              //   // crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text(
              //       "Organised By: ${widget.orgName}",
              //       style: TextStyle(
              //         fontSize: 22,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //     SizedBox(height: 8),
              //     Padding(
              //       padding: EdgeInsets.only(left: 8.0),
              //       child: Text(
              //         widget.orgName,
              //         style: TextStyle(
              //           fontSize: 20,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 15),
              // Description(eventDescription: widget.eventDescription),
              // const SizedBox(height: 25),
              // PlacePictures(),
              // const SizedBox(height: 25),
              // const Details(),
              // const SizedBox(height: 25),
              // const Align(
              //   alignment: Alignment.centerLeft,
              //   child: Padding(
              //     padding: EdgeInsets.only(left: 25.0),
              //     child: Text(
              //       "Location",
              //       style: TextStyle(
              //         fontSize: 20,
              //       ),
              //     ),
              //   ),
              // ),
              // const LocationDetails(),
            ],
          ),
        ),
        // floatingActionButton: Container(
        //   width: 100,
        //   child: FloatingActionButton(
        //     onPressed: () {},
        //     // isExtended: true,
        //     child: Text(widget.price, style: TextStyle(
        //       fontSize: 20,
        //       fontWeight: FontWeight.bold,
        //     ),),
        //   ),
        // ),
        bottomNavigationBar: Container(
          // color: Colors.grey[200],
          decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(
                    color: Colors.grey, width: 1, style: BorderStyle.solid)),
          ),
          height: 70,
          width: double.maxFinite,
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Text(
              //   'Rs ${widget.}',
              //   style: TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              ElevatedButton(
                onPressed: () {},
                // isExtended: true,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                child: const Text(
                  'APPLY',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

