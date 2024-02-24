// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizon/card_discriptions/event_details.dart';
import './controller/homepage_controller.dart';
// ignore: unused_import
import './screens/tours_screen.dart';
// ignore: unused_import
import './screens/events_screen.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> with TickerProviderStateMixin {
  final _authController = Get.put(AuthController());
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List tourData = [];

  @override
  Widget build(BuildContext context) {
    _authController.getEvent();
    _authController.getTour();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // toolbarHeight: 120,
          title: const Text(
            "Tours and Events",
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
                  shrinkWrap: true,
                  itemCount: _authController.tourData.length,
                  itemBuilder: (BuildContext context, int index) {
                    final tours = _authController.tourData[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Get.to(
                            () => EventScreen(
                              maxSlots: "5",
                              address: "Goa",
                              eventName: "Turtle",
                              toDate: "2024-02-27",
                              fromDate: "2024-02-21",
                              orgName: "Karen",
                              price: "1200",
                              desc: "enjoy seeing the turtle",
                              imagePath: "assets/images/sc1.jpeg",
                              endTime: "10:15 PM",
                              startTime: "3:15 AM",
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.maxFinite,
                            height: 200,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: NetworkImage("assets/images/tour1.jpeg"),
                                fit: BoxFit.fill,
                                opacity: 0.6,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 2,
                                    ),
                                    child: Text(
                                      "Turtle",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 2,
                                    ),
                                    child: Text(
                                      '${"5"}, ${"Goa"}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.symmetric(
                                  //     horizontal: 10,
                                  //     vertical: 2,
                                  //   ),
                                  //   child: Text(
                                  //     'Max-Slots: ${tours.maxSlots}',
                                  //     style: const TextStyle(
                                  //       fontSize: 14,
                                  //       fontWeight: FontWeight.bold,
                                  //       color: Colors.white,
                                  //     ),
                                  //   ),
                                  // ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      "Enjoy watching the turtles",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Obx(
              () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: _authController.eventData.length,
                  itemBuilder: (BuildContext context, int index) {
                    final events = _authController.eventData[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Get.to(
                            () => EventScreen(
                              maxSlots: "5",
                              address: "Goa",
                              eventName: "Turtle",
                              toDate: "2024-02-27",
                              fromDate: "2024-02-21",
                              orgName: "Karen",
                              price: "1200",
                              desc: "enjoy seeing the turtle",
                              imagePath: "assets/images/sc1.jpeg",
                              endTime: "10:15 PM",
                              startTime: "3:15 AM",
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.maxFinite,
                            height: 200,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: NetworkImage("assets/images/tour1.jpeg"),
                                fit: BoxFit.fill,
                                opacity: 0.6,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 2,
                                    ),
                                    child: Text(
                                      "Turtle",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 2,
                                    ),
                                    child: Text(
                                      '${"5"}, ${"Goa"}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.symmetric(
                                  //     horizontal: 10,
                                  //     vertical: 2,
                                  //   ),
                                  //   child: Text(
                                  //     'Max-Slots: ${tours.maxSlots}',
                                  //     style: const TextStyle(
                                  //       fontSize: 14,
                                  //       fontWeight: FontWeight.bold,
                                  //       color: Colors.white,
                                  //     ),
                                  //   ),
                                  // ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      "Enjoy watching the turtles",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
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
  }
}

// class SearchHistory extends StatelessWidget {
//   const SearchHistory({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // Replace the items in the list with your actual search history
//     List<String> searchHistory = [
//       'Query 1',
//       'Query 2',
//       'Query 3',
//       'Query 4',
//       'Query 5'
//     ];
//
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey),
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Padding(
//             padding: EdgeInsets.only(
//               left: 8.0,
//               right: 8.0,
//             ),
//             child: Text(
//               'Search History',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 8.0, bottom: 10),
//             child: SizedBox(
//               height: 100.0, // Set the height of the grid as needed
//               child: GridView.builder(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3, // Set the number of columns in the grid
//                   crossAxisSpacing:
//                       15, // Set the horizontal spacing between items
//                   mainAxisSpacing:
//                       8.0, // Set the vertical spacing between items
//                   childAspectRatio: 4,
//                 ),
//                 itemCount: searchHistory.length,
//                 itemBuilder: (context, index) {
//                   return ElevatedButton(
//                     onPressed: () {
//                       // Handle tapping on a search history item
//                     },
//                     style: ButtonStyle(
//                         shape: MaterialStatePropertyAll(
//                           RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         iconSize: const MaterialStatePropertyAll(5)),
//                     child: Text(searchHistory[index]),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class SearchSugestion extends StatelessWidget {
//   const SearchSugestion({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // Replace the items in the list with your actual search history
//     List<String> searchSuggestion = [
//       'Query 1',
//       'Query 2',
//       'Query 3',
//       'Query 4',
//       'Query 5'
//     ];
//
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey),
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Padding(
//             padding: EdgeInsets.only(
//               left: 8.0,
//               right: 8.0,
//             ),
//             child: Text(
//               'Trending Search',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 8.0, bottom: 10),
//             child: SizedBox(
//               height: 100.0, // Set the height of the grid as needed
//               child: GridView.builder(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3, // Set the number of columns in the grid
//                   crossAxisSpacing:
//                       15, // Set the horizontal spacing between items
//                   mainAxisSpacing:
//                       8.0, // Set the vertical spacing between items
//                   childAspectRatio: 4,
//                 ),
//                 itemCount: searchSuggestion.length,
//                 itemBuilder: (context, index) {
//                   return ElevatedButton(
//                     onPressed: () {
//                       // Handle tapping on a search history item
//                     },
//                     style: ButtonStyle(
//                       backgroundColor: const MaterialStatePropertyAll(Color.fromARGB(255, 171, 215, 102)),
//                       shape: MaterialStatePropertyAll(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       iconSize: const MaterialStatePropertyAll(5),
//                     ),
//
//                     child: Text(searchSuggestion[index],
//                     style: const TextStyle(color: Colors.white),),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
