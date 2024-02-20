import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './controller/homepage_controller.dart';

class VolunteerPage extends StatefulWidget {
  const VolunteerPage({super.key});

  @override
  State<VolunteerPage> createState() => _VolunteerPageState();
}

class _VolunteerPageState extends State<VolunteerPage> with TickerProviderStateMixin{

  final _authController = Get.put(AuthController());
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _authController.getVolunteers();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // toolbarHeight: 120,
          title: Text(
            "Volunteers",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          // flexibleSpace: const Column(
          //   children: [
          //     Text(
          //       "Tours and Events",
          //       style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          //     ),
          //     SizedBox(
          //       height: 20,
          //     ),
          //     Padding(
          //       padding: EdgeInsets.symmetric(horizontal: 20),
          //       child: EventSearchBar(),
          //     ),
          //   ],
          // ),
          // centerTitle: true,
          bottom: TabBar(
            controller: _tabController,
            tabs: const <Widget>[
              Tab(
                icon: Icon(Icons.tour),
                text: "Tours",
              ),
              Tab(
                icon: Icon(Icons.event),
                text: "Events",
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Obx(
                  () => ListView.builder(
                  itemCount: _authController.volunteerData.length,
                  itemBuilder: (BuildContext context, int index) {
                    final volunteers = _authController.volunteerData[index];
                    return volunteers.type == "Tour"
                        ? Padding(
                      padding: EdgeInsets.all(8),
                      child: Card(
                        color: const Color.fromARGB(255, 7, 159, 159)
                            .withOpacity(0.6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 20.h, left: 10.w),
                              child: Image.asset(
                                "", // Replace 'image.png' with your image asset path
                                width: 100.w,
                                height: 200.h,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(width: 20.w),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  volunteers.eventName,
                                  style: TextStyle(
                                    fontSize: 26.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  'Volunteers: ${volunteers.volNumber}',
                                  style: TextStyle(
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                // cardListTile('', events.description),
                                SizedBox(
                                  height: 80.h,
                                  width: 150.w,
                                  child: Text(
                                    volunteers.role,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 17.sp,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                        : null;
                  }),
            ),
            Obx(
                  () => ListView.builder(
                  itemCount: _authController.volunteerData.length,
                  itemBuilder: (BuildContext context, int index) {
                    final volunteers = _authController.volunteerData[index];
                    return volunteers.type == "Event"
                        ? Padding(
                      padding: EdgeInsets.all(8.r),
                      child: Card(
                        color: const Color.fromARGB(255, 7, 159, 159)
                            .withOpacity(0.6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 20.h, left: 10.w),
                              child: Image.asset(
                                "", // Replace 'image.png' with your image asset path
                                width: 100.w,
                                height: 200.h,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(width: 20.w),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  volunteers.eventName,
                                  style: TextStyle(
                                    fontSize: 26.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  'Volunteers: ${volunteers.volNumber}',
                                  style: TextStyle(
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                // cardListTile('', events.description),
                                SizedBox(
                                  height: 80.h,
                                  width: 150.w,
                                  child: Text(
                                    volunteers.role,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 17.sp,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                        : null;
                  }),
            ),
          ],
        ),

        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Colors.green,
        //   child: const Icon(
        //     Icons.add,
        //     color: Colors.white,
        //   ),
        //   onPressed: () {
        //     openBottomSheet();
        //   },
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      ),
    );
    // return Scaffold(
    //   body: SingleChildScrollView(
    //     child: Padding(
    //       padding: const EdgeInsets.only(top: 80),
    //       child: Column(
    //         children: [
    //           Row(
    //             children: [
    //               ElevatedButton(
    //                 onPressed: () {
    //                   setState(() {
    //                     Navigator.push(
    //                       context,
    //                       MaterialPageRoute(
    //                         builder: (context) =>  const MyApp(),
    //                       ),
    //                     );
    //                   });
    //                 },
    //                 clipBehavior: Clip.none,
    //                 style: const ButtonStyle(
    //                   backgroundColor: MaterialStatePropertyAll(
    //                     Colors.white,
    //                   ),
    //                   iconSize: MaterialStatePropertyAll(50),
    //                   elevation: MaterialStatePropertyAll(0),
    //                 ),
    //                 child: const Icon(
    //                   Icons.arrow_back,
    //                   size: 30,
    //                   weight: 100,
    //                   color: Colors.black,
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 50,
    //                 width: 300,
    //                 child: SearchAnchor(
    //                   builder:
    //                       (BuildContext context, SearchController controller) {
    //                     return SearchBar(
    //                       controller: controller,
    //                       padding: const MaterialStatePropertyAll<EdgeInsets>(
    //                           EdgeInsets.symmetric(horizontal: 16.0)),
    //                       onTap: () {
    //                         controller.openView();
    //                       },
    //                       onChanged: (_) {
    //                         controller.openView();
    //                       },
    //                       leading: const Icon(Icons.search),
    //                       hintText: "Search for marine activities",
    //                       shape: const MaterialStatePropertyAll(
    //                         RoundedRectangleBorder(
    //                           borderRadius: BorderRadius.all(
    //                             Radius.circular(10),
    //                           ),
    //                         ),
    //                       ),
    //                     );
    //                   },
    //                   suggestionsBuilder:
    //                       (BuildContext context, SearchController controller) {
    //                     return List<ListTile>.generate(
    //                       5,
    //                       (int index) {
    //                         final String item = 'item $index';
    //                         return ListTile(
    //                           title: Text(item),
    //                           onTap: () {
    //                             setState(
    //                               () {
    //                                 controller.closeView(item);
    //                               },
    //                             );
    //                           },
    //                         );
    //                       },
    //                     );
    //                   },
    //                 ),
    //               ),
    //             ],
    //           ),
    //           const SizedBox(
    //             height: 30,
    //           ),
    //           const Destinationcards(),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}



// class Destinationcards extends StatefulWidget {
//   const Destinationcards({super.key});
//
//   @override
//   State<Destinationcards> createState() => _DestinationcardsState();
// }
//
// class _DestinationcardsState extends State<Destinationcards> {
//   List<String> destinationList = [
//     "destination1",
//     "destination1",
//     "destination1",
//     "destination1",
//     "destination1",
//     "destination1",
//   ];
//
//   List<double> rating = [
//     3.5,
//     3.5,
//     3.5,
//     3.5,
//     3.5,
//     3.5,
//   ];
//
//   List<Color> myCol = [
//     Colors.pink.shade100,
//     Colors.pink.shade200,
//     Colors.pink.shade300,
//     Colors.pink.shade400,
//     Colors.pink.shade500,
//     Colors.pink.shade600,
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: SizedBox(
//         height: 600,
//         child: ListView(
//           children: List.generate(
//             destinationList.length,
//             (index) {
//               return Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Column(
//                   children: [
//                     Container(
//                       height: 210,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         color: Colors.grey.shade300,
//                       ),
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(
//                               top: 8.0,
//                               right: 8.0,
//                               left: 8.0,
//                             ),
//                             child: Container(
//                               height: 150,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(15),
//                                 color: myCol[index],
//                               ),
//                               alignment: Alignment.topCenter,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: Row(
//                                   children: [
//                                     Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Container(
//                                         height: 30,
//                                         width: 70,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(15),
//                                           color: Colors.white.withOpacity(0.5),
//                                         ),
//                                         child: Center(
//                                           child: Row(
//                                             children: [
//                                               const Expanded(
//                                                 child: Icon(
//                                                   Icons.star_outlined,
//                                                   size: 20,
//                                                 ),
//                                               ),
//                                               Expanded(
//                                                 child: Text(
//                                                   rating[index].toString(),
//                                                   style: const TextStyle(
//                                                       fontSize: 16,
//                                                       fontWeight:
//                                                           FontWeight.bold),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     Expanded(
//                                       child: Align(
//                                         alignment: Alignment.topRight,
//                                         child: Container(
//                                           decoration: BoxDecoration(
//                                               shape: BoxShape.circle,
//                                               color: Colors.white
//                                                   .withOpacity(0.5)),
//                                           child: const Padding(
//                                             padding: EdgeInsets.all(4.0),
//                                             child: Icon(Icons.favorite),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Row(
//                               children: [
//                                 Align(
//                                   alignment: Alignment.bottomLeft,
//                                   child: Text(
//                                     destinationList[index],
//                                     style: const TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Align(
//                                     alignment: Alignment.bottomRight,
//                                     child: InkWell(
//                                       onTap: () {
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) =>
//                                                 const DestinationDetails(),
//                                           ),
//                                         );
//                                       },
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                             color: Colors.black,
//                                             borderRadius:
//                                                 BorderRadius.circular(10)),
//                                         child: const Padding(
//                                           padding: EdgeInsets.only(
//                                               left: 15.0,
//                                               right: 15.0,
//                                               top: 5,
//                                               bottom: 5),
//                                           child: Text(
//                                             "Details",
//                                             style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 15,
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
