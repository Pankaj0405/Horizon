import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyAppState();
}

class _MyAppState extends State<Home> {
  // ignore: unused_field
  final PageController _controller = PageController(viewportFraction: 0.8);
  final List<String> imageUrl = [
    'assets/images/sc1.jpeg',
    'assets/images/sc2.jpeg',
    'assets/images/sc3.jpeg'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          leading: const Padding(
            padding: EdgeInsets.all(4),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/profile.jpeg'),
            ),
          ),
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Horizon',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: ListView(
            children: [
              // ----------------------------Top part -----------------
              // Container(
              //   // height: 100,
              //   width: double.maxFinite,
              //   color: Colors.blue.shade100,
              //   child: ListTile(
              //     leading: CircleAvatar(
              //       radius: 22,
              //       backgroundImage: AssetImage('assets/images/profile.jpeg'),
              //     ),
              //     title: Text('Welcome to', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              //     subtitle: Text('Horizon',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),),
              //   ),
              //   // Row(
              //   //   children: [
              //   //     Padding(
              //   //       padding: const EdgeInsets.all(8.0),
              //   //       child: Container(
              //   //         height: 70,
              //   //         width: 70,
              //   //         decoration: BoxDecoration(
              //   //             borderRadius: BorderRadius.circular(45),
              //   //             color: Colors.green),
              //   //       ),
              //   //     ),
              //   //     const Padding(
              //   //       padding: EdgeInsets.only(top: 30),
              //   //       child: Column(
              //   //         children: [
              //   //           Padding(
              //   //             padding: EdgeInsets.only(left: 15.0),
              //   //             child: Text(
              //   //               "welcome To",
              //   //               style: TextStyle(
              //   //                   fontSize: 22, fontWeight: FontWeight.bold),
              //   //             ),
              //   //           ),
              //   //           Padding(
              //   //             padding: EdgeInsets.only(left: 0.0),
              //   //             child: Text("lorem lipsum"),
              //   //           ),
              //   //         ],
              //   //       ),
              //   //     ),
              //   //   ],
              //   // ),
              // ),

              // ----------------------contribution-----------------------------
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  // left: 15,
                  // right: 15,
                ),
                child: Container(
                  // height: 150,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "You've contributed to Marine",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "75% of your weekly goal is completed",
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LinearProgressIndicator(
                          value: 0.75,
                          minHeight: 10,
                          backgroundColor: Colors.white,
                          color: Colors.green.shade400,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // ------------------------------search bar--------------------------------

              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: SearchAnchor(
                  isFullScreen: false,
                  viewConstraints: const BoxConstraints(
                    maxHeight: 200,
                  ),
                  builder: (BuildContext context, SearchController controller) {
                    return SearchBar(
                      controller: controller,
                      padding: const MaterialStatePropertyAll<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 16.0)),
                      onTap: () {
                        controller.openView();
                      },
                      onChanged: (_) {
                        controller.openView();
                      },
                      leading: const Icon(Icons.search),
                      hintText: "Search for marine activities",
                    );
                  },
                  suggestionsBuilder:
                      (BuildContext context, SearchController controller) {
                    return List<ListTile>.generate(
                      5,
                      (int index) {
                        final String item = 'item $index';
                        return ListTile(
                          title: Text(item),
                          onTap: () {
                            setState(
                              () {
                                controller.closeView(item);
                              },
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              // const Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Text(
              //       "Most popular marine activities",
              //       style: TextStyle(
              //         fontSize: 20,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //     Padding(
              //       padding: EdgeInsets.only(left: 80),
              //     ),
              //     SizedBox(
              //       height: 5,
              //     ),
              //   ],
              // ),
              const SizedBox(height: 35),

              // SizedBox(
              //   height: 220,
              //   // width: double.maxFinite,
              //   child: PageView.builder(
              //       padEnds: false,
              //       itemCount: imageUrl.length,
              //       controller: _controller,
              //       itemBuilder: (context, index) {
              //         return Stack(
              //           fit: StackFit.loose,
              //           alignment: Alignment.bottomCenter,
              //           children: [
              //             Container(
              //               height: 220,
              //               // width: 800,
              //               padding: const EdgeInsets.symmetric(
              //                 horizontal: 10,
              //               ),
              //               child: ClipRRect(
              //                   borderRadius: BorderRadius.circular(10),
              //                   child: Image.asset(
              //                     imageUrl[index],
              //                     fit: BoxFit.fill,
              //                   )),
              //             ),
              //             Container(
              //               height: 70,
              //               width: 270,
              //               decoration: BoxDecoration(
              //                 color: Colors.grey[300],
              //                 borderRadius: BorderRadius.circular(10),
              //               ),
              //               padding: const EdgeInsets.only(
              //                 bottom: 10,
              //               ),
              //               child: const ListTile(
              //                 title: Text('Marine Conservation'),
              //                 subtitle: Text('Adeteous Ide'),
              //               ),
              //             ),
              //           ],
              //         );
              //       }),
              // ),

              // Card(
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   color: Colors.blue.shade400,
              //   child: SingleChildScrollView(
              //     scrollDirection: Axis.horizontal,
              //     child: Row(
              //       children: [
              //         buildBigCard(
              //           "Marine conservation",
              //           "Tadius ideas",
              //           'assets/images/sc1.jpeg'
              //         ),
              //         const SizedBox(
              //           width: 10,
              //         ),
              //         buildBigCard(
              //           "Marine",
              //           "Tadius ideas",
              //             'assets/images/sc2.jpeg'
              //         ),
              //         const SizedBox(
              //           width: 10,
              //         ),
              //         buildBigCard(
              //           "conservation",
              //           "Tadius ideas",
              //             'assets/images/sc3.jpeg'
              //         ),
              //         const SizedBox(
              //           width: 10,
              //         ),
              //         buildBigCard(
              //           "Marine conservation",
              //           "Tadius ideas",
              //             'assets/images/sc1.jpeg'
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              //-------------------------------------------------------------------------------------------------------------
              // Container(
              //   height: 40,
              //   width: double.maxFinite,
              //   child: const Row(
              //     children: [
              //       Text(
              //         "Quick marine workouts",
              //         style: TextStyle(
              //           fontSize: 18,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //       Padding(
              //         padding: EdgeInsets.only(left: 80),
              //       ),
              //       Icon(Icons.keyboard_arrow_left_sharp),
              //       Icon(Icons.keyboard_arrow_right_sharp),
              //       SizedBox(
              //         height: 5,
              //       ),
              //     ],
              //   ),
              // ),

              // Container(
              //   height: 200,
              //   width: double.maxFinite,
              //   color: Colors.blue.shade400,
              //   child: SingleChildScrollView(
              //     scrollDirection: Axis.horizontal,
              //     child: Row(
              //       children: [
              //         buildSmallCard(
              //           "Marine conservation",
              //           "Tadius ideas",
              //         ),
              //         const SizedBox(
              //           width: 10,
              //         ),
              //         buildSmallCard(
              //           "Marine",
              //           "Tadius ideas",
              //         ),
              //         const SizedBox(
              //           width: 10,
              //         ),
              //         buildSmallCard(
              //           "conservation",
              //           "Tadius ideas",
              //         ),
              //         const SizedBox(
              //           width: 10,
              //         ),
              //         buildSmallCard(
              //           "Marine conservation",
              //           "Tadius ideas",
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 180,
              //   // width: double.maxFinite,
              //   child: PageView.builder(
              //       padEnds: false,
              //       itemCount: imageUrl.length,
              //       controller: _controller,
              //       itemBuilder: (context, index) {
              //         return Stack(
              //           fit: StackFit.loose,
              //           alignment: Alignment.bottomCenter,
              //           children: [
              //             SizedBox(
              //               height: 180,
              //               width: 200,
              //               // width: 800,
              //               child: ClipRRect(
              //                   borderRadius: BorderRadius.circular(10),
              //                   child: Image.asset(
              //                     imageUrl[index],
              //                     fit: BoxFit.fill,
              //                   )),
              //             ),
              //             Container(
              //               height: 60,
              //               width: 180,
              //               decoration: BoxDecoration(
              //                 color: Colors.grey[300],
              //                 borderRadius: BorderRadius.circular(10),
              //               ),
              //               // padding: EdgeInsets.only(
              //               //   bottom: 10,
              //               // ),
              //               child: const ListTile(
              //                 title: Text('Marine Conservation'),
              //                 subtitle: Text('Adeteous Ide'),
              //               ),
              //             ),
              //           ],
              //         );
              //       }),
              // ),
              // Container(
              //   // height: 150,
              //   width: double.maxFinite,
              //   padding: const EdgeInsets.all(15),
              //   color: Colors.grey.shade200,
              //   child: SingleChildScrollView(
              //     scrollDirection: Axis.horizontal,
              //     child: Row(
              //       children: [
              //         Column(
              //           children: [
              //             Container(
              //               height: 75,
              //               width: 75,
              //               decoration: BoxDecoration(
              //                 border: Border.all(
              //                   color: Colors.black,
              //                   width: 2,
              //                 ),
              //                 borderRadius: const BorderRadius.all(
              //                   Radius.circular(15),
              //                 ),
              //               ),
              //               child: const Icon(
              //                 Icons.sports_volleyball,
              //                 size: 60,
              //               ),
              //             ),
              //             const SizedBox(
              //               height: 5,
              //             ),
              //             const Text(
              //               "Marine",
              //               style: TextStyle(
              //                 fontSize: 18,
              //               ),
              //             ),
              //           ],
              //         ),
              //         const SizedBox(
              //           width: 20,
              //         ),
              //         Column(
              //           children: [
              //             Container(
              //               height: 75,
              //               width: 75,
              //               decoration: BoxDecoration(
              //                 border: Border.all(
              //                   color: Colors.black,
              //                   width: 2,
              //                 ),
              //                 borderRadius: const BorderRadius.all(
              //                   Radius.circular(15),
              //                 ),
              //               ),
              //               child: const Icon(
              //                 Icons.sports_volleyball,
              //                 size: 60,
              //               ),
              //             ),
              //             const SizedBox(
              //               height: 5,
              //             ),
              //             const Text(
              //               "Marine",
              //               style: TextStyle(
              //                 fontSize: 18,
              //               ),
              //             ),
              //           ],
              //         ),
              //         const SizedBox(
              //           width: 20,
              //         ),
              //         Column(
              //           children: [
              //             Container(
              //               height: 75,
              //               width: 75,
              //               decoration: BoxDecoration(
              //                 border: Border.all(
              //                   color: Colors.black,
              //                   width: 2,
              //                 ),
              //                 borderRadius: const BorderRadius.all(
              //                   Radius.circular(15),
              //                 ),
              //               ),
              //               child: const Icon(
              //                 Icons.sports_volleyball,
              //                 size: 60,
              //               ),
              //             ),
              //             const SizedBox(
              //               height: 5,
              //             ),
              //             const Text(
              //               "Marine",
              //               style: TextStyle(
              //                 fontSize: 18,
              //               ),
              //             ),
              //           ],
              //         ),
              //         const SizedBox(
              //           width: 20,
              //         ),
              //         Column(
              //           children: [
              //             Container(
              //               height: 75,
              //               width: 75,
              //               decoration: BoxDecoration(
              //                 border: Border.all(
              //                   color: Colors.black,
              //                   width: 2,
              //                 ),
              //                 borderRadius: const BorderRadius.all(
              //                   Radius.circular(15),
              //                 ),
              //               ),
              //               child: const Icon(
              //                 Icons.sports_volleyball,
              //                 size: 60,
              //               ),
              //             ),
              //             const SizedBox(
              //               height: 5,
              //             ),
              //             const Text(
              //               "Marine",
              //               style: TextStyle(
              //                 fontSize: 18,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              const MostPopularMarine(),
              const SizedBox(height: 35),
              const QuickMarineWorkout(),
              const SizedBox(height: 35),
              const PopularTours(),
              const SizedBox(height: 35),
              const PopularEvents(),
              const SizedBox(height: 35),
              const PopularVolunteer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBigCard(String inputText1, String inputText2, String imageUrl) =>
      Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: 190,
            width: 380,
            // color: Colors.purple.shade300,
            child: Image.asset(
              imageUrl,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            height: 100,
            width: 380,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                inputText1,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 9.0),
              child: Text(
                inputText2,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
      );

  Widget buildSmallCard(String inputText1, String inputText2) => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 190,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.pink.shade300,
                borderRadius: BorderRadius.circular(25)),
          ),
          Container(
            height: 100,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                inputText1,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: const EdgeInsets.only(left: 9.0),
              child: Text(
                inputText2,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
      );
}

//----------- Most popular marine activities------------------------

class MostPopularMarine extends StatefulWidget {
  const MostPopularMarine({super.key});

  @override
  State<MostPopularMarine> createState() => _MostPopularMarineState();
}

class _MostPopularMarineState extends State<MostPopularMarine> {
  List upcomingEventsCards = [
    // color will be replaced by images
    ["Hatchling hustle", "watching sea turtles going on their journey", true, "assets/images/tour3.jpeg"],
    ["Scubadiving", "Explore the sea and it's creatures", false, "assets/images/tour5.jpg"],
    ["Beach wedding", "A wedding wave is going to strike the beach", true, "assets/images/event2.jpeg"],
    ["Scubasauras", "The jurrasic for scuba divers", true, "assets/images/tour5.jpg"],
     ["Beach sand party", "it's can't be rock because it's a beach with sand", true, "assets/images/event5.jpg"],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 22.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Most popular marine activities",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        CarouselSlider(
          items: upcomingEventsCards
              .map(
                (item) => InkWell(
                  onTap: () {},
                  child: Container(
                    width: 400,
                    decoration: BoxDecoration(
                      image:  DecorationImage(
                        image: AssetImage(item[3]),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              item[0],
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              item[1],
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              autoPlay: true,
              enableInfiniteScroll: true,
              viewportFraction: 0.8,
              animateToClosest: true,
              height: 170),
        ),
      ],
    );
  }
}

//----------- Quick marine workouts------------------------

class QuickMarineWorkout extends StatefulWidget {
  const QuickMarineWorkout({super.key});

  @override
  State<QuickMarineWorkout> createState() => _QuickMarineWorkoutState();
}

class _QuickMarineWorkoutState extends State<QuickMarineWorkout> {
  List upcomingEventsCards = [
    // color will be replaced by images
    ["Title", "description", true],
    ["inputText1", "inputText2", false],
    ["inputText2", "inputText2", true],
    ["inputText3", "inputText2", false],
    ["inputText4", "inputText2", true],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 22.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Quick Marine Workouts",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        CarouselSlider(
          items: upcomingEventsCards
              .map(
                (item) => InkWell(
                  onTap: () {},
                  child: Container(
                    width: 400,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("assets/images/sc1.jpeg"),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              item[0],
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              item[1],
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              autoPlay: false,
              enableInfiniteScroll: true,
              viewportFraction: 0.8,
              animateToClosest: true,
              height: 170),
        ),
      ],
    );
  }
}

//----------- Popular tour------------------------

class PopularTours extends StatefulWidget {
  const PopularTours({super.key});

  @override
  State<PopularTours> createState() => _PopularToursState();
}

class _PopularToursState extends State<PopularTours> {
  List upcomingEventsCards = [
    // color will be replaced by images
    ["The silent sea", "Perfect for embrassing the nature", true, "assets/images/tour1.jpeg"],
    ["The swim beach", "If you like swimming in ocean and watch the aquatics, this is the place", false, "assets/images/tour2.jpg"],
    ["Galgibaga", "Perfect for watching the new journey of hatchligs", true, "assets/images/tour3.jpeg"],
    ["The blue lagoon", "If you want to see the real untouchd beauty of nature", false, "assets/images/tour4.jpg"],
    ["Scubasauras", "The jurrasic for scuba divers", true, "assets/images/tour5.jpg"],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 22.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Popular Tours",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        CarouselSlider(
          items: upcomingEventsCards
              .map(
                (item) => InkWell(
                  onTap: () {},
                  child: Container(
                    width: 400,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(item[3]),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              item[0],
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              item[1],
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              autoPlay: false,
              enableInfiniteScroll: true,
              viewportFraction: 0.8,
              animateToClosest: true,
              height: 170),
        ),
      ],
    );
  }
}

//----------- Popular Events------------------------

class PopularEvents extends StatefulWidget {
  const PopularEvents({super.key});

  @override
  State<PopularEvents> createState() => _PopularEventsState();
}

class _PopularEventsState extends State<PopularEvents> {
  List upcomingEventsCards = [
    // color will be replaced by images
    ["The Fire Night", "enjoy a night in the city but differently", true, "assets/images/event1.jpg"],
    ["Beach wedding", "A wedding wave is going to strike the beach", false, "assets/images/event2.jpeg"],
    ["The beach get together", "meet new people and discuss about, well it's up to you", true, "assets/images/event3.jpeg"],
    ["Hatchling festival", "see the turtles emerging from the earth", false, "assets/images/event4.jpeg"],
    ["Beach sand party", "it's can't be rock because it's a beach with sand", true, "assets/images/event5.jpg"],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 22.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Popular Events",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        CarouselSlider(
          items: upcomingEventsCards
              .map(
                (item) => InkWell(
                  onTap: () {},
                  child: Container(
                    width: 400,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(item[3]),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              item[0],
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              item[1],
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              autoPlay: false,
              enableInfiniteScroll: true,
              viewportFraction: 0.8,
              animateToClosest: true,
              height: 170),
        ),
      ],
    );
  }
}

//----------- Popular volunteer------------------------

class PopularVolunteer extends StatefulWidget {
  const PopularVolunteer({super.key});

  @override
  State<PopularVolunteer> createState() => _PopularVolunteerState();
}

class _PopularVolunteerState extends State<PopularVolunteer> {
  List upcomingEventsCards = [
    // color will be replaced by images
    ["Denice", "An enthusiast about octopus", true, "assets/images/tour2.jpg"],
    [
      "Alice",
      "Lives to follow the hatchlings",
      false,
      "assets/images/event1.jpg"
    ],
    [
      "Maya",
      "comes outside to escape the city",
      true,
      "assets/images/tour2.jpg"
    ],
    ["Jack", "explorer of the corals", false, "assets/images/event2.jpeg"],
    ["Jimmy", "Loves the beach vibes", true, "assets/images/tour3.jpeg"],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 22.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Popular Volunteers",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        CarouselSlider(
          items: upcomingEventsCards
              .map(
                (item) => InkWell(
                  onTap: () {},
                  child: Container(
                    width: 400,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(item[3]),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              item[0],
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              item[1],
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              autoPlay: false,
              enableInfiniteScroll: true,
              viewportFraction: 0.8,
              animateToClosest: true,
              height: 170),
        ),
      ],
    );
  }
}
