import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './controller/homepage_controller.dart';
import './screens/tours_screen.dart';
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
                      child: Card(
                        color: const Color.fromARGB(255, 7, 159, 159)
                            .withOpacity(0.8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 15,
                                right: 10,
                                left: 10,
                                bottom: 10,
                              ),
                              child: Image.network(
                                tours
                                    .imagePath, // Replace 'image.png' with your image asset path
                                width: 150,
                                height: 150,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    tours.eventName,
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    'Organized By: \n${tours.organizationName}',
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                // SizedBox(
                                //   height: 80,
                                //   width: 150,
                                //   child: Text(
                                //     tours.description,
                                //     maxLines: 2,
                                //     style: const TextStyle(
                                //       fontSize: 18,
                                //       overflow: TextOverflow.ellipsis,
                                //       fontWeight: FontWeight.w300,
                                //       color: Colors.white,
                                //     ),
                                //   ),
                                // ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple,
                                  ),
                                  onPressed: () {
                                    Get.to(() => ToursScreen(
                                        tourName: tours.eventName,
                                        address: tours.address,
                                        imagePath: tours.imagePath,
                                        orgName: tours.organizationName,
                                        desc: tours.description,
                                        price: tours.price,
                                        id: tours.id));
                                  },
                                  child: const Text(
                                    'Details',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ],
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
                      child: Card(
                        color: const Color.fromARGB(255, 7, 159, 159)
                            .withOpacity(0.8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 15,
                                right: 15,
                                left: 10,
                                bottom: 10,
                              ),
                              child: Image.network(
                                events
                                    .imagePath, // Replace 'image.png' with your image asset path
                                width: 150,
                                height: 150,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    events.eventName,
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    'Organized By: \n${events.organizationName}',
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                // SizedBox(
                                //   height: 80,
                                //   width: 150,
                                //   child: Text(
                                //     tours.description,
                                //     maxLines: 2,
                                //     style: const TextStyle(
                                //       fontSize: 18,
                                //       overflow: TextOverflow.ellipsis,
                                //       fontWeight: FontWeight.w300,
                                //       color: Colors.white,
                                //     ),
                                //   ),
                                // ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple,
                                  ),
                                  onPressed: () {
                                    Get.to(() => EventsScreen(
                                        eventName: events.eventName,
                                        address: events.address,
                                        imagePath: events.imagePath,
                                        orgName: events.organizationName,
                                        desc: events.description,
                                        price: events.price,
                                        id: events.id));
                                  },
                                  child: const Text(
                                    'Details',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ],
                          // child: Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   children: [
                          //     Container(
                          //       height: 400,
                          //       width: 200,
                          //       child: imagePath != null? Image.asset(imagePath!.path, fit: BoxFit.fill,) : Container(color: Colors.blue,),
                          //     ),
                          //     Column(
                          //       // crossAxisAlignment: CrossAxisAlignment.center,
                          //       children: [
                          //         cardListTile('Event: ', events.eventName),
                          //         cardListTile('Organized By: ', events.organizationName),
                          //         cardListTile('Description: ', events.description),
                          //       ],
                          //     ),
                          //   ],
                          // ),
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
