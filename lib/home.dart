import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyAppState();
}

class _MyAppState extends State<Home> {
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
            padding: const EdgeInsets.all(4),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/profile.jpeg'),
            ),
          ),
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome to', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Text('Horizon',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),),
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
                          Text(
                            "You've contributed to marine",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "75% of your weekly goal is completed",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          LinearProgressIndicator(
                            value: 0.75,
                            minHeight: 10,
                            backgroundColor: Colors.white,
                            color: Colors.green.shade400,
                            borderRadius: BorderRadius.all(
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
                
                
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Most popular marine activities",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 80),
                    ),
                    Icon(Icons.keyboard_arrow_left_sharp),
                    Icon(Icons.keyboard_arrow_right_sharp),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),

                SizedBox(
                  height: 220,
                  // width: double.maxFinite,
                  child: PageView.builder(
                    padEnds: false,
                      itemCount: imageUrl.length,
                      controller: _controller,
                      itemBuilder: (context, index) {
                    return Stack(
                      fit: StackFit.loose,
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: 220,
                          // width: 800,
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(imageUrl[index], fit: BoxFit.fill,)),
                        ),
                        Container(
                            height: 70,
                            width: 270,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.only(
                              bottom: 10,
                            ),
                            child: ListTile(
                              title: Text('Marine Conservation'),
                              subtitle: Text('Adeteous Ide'),
                            ),
                        ),
                      ],
                    );
                  }),
                ),
                
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
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Quick marine workouts",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 135),
                    ),
                    Icon(Icons.keyboard_arrow_left_sharp),
                    Icon(Icons.keyboard_arrow_right_sharp),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
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
                const SizedBox(
                  height: 10,
                ),
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
                SizedBox(
                  height: 180,
                  // width: double.maxFinite,
                  child: PageView.builder(
                    padEnds: false,
                      itemCount: imageUrl.length,
                      controller: _controller,
                      itemBuilder: (context, index) {
                        return Stack(
                          fit: StackFit.loose,
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              height: 180,
                              width: 200,
                              // width: 800,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(imageUrl[index], fit: BoxFit.fill,)),
                            ),
                            Container(
                              height: 60,
                              width: 180,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              // padding: EdgeInsets.only(
                              //   bottom: 10,
                              // ),
                              child: ListTile(
                                title: Text('Marine Conservation'),
                                subtitle: Text('Adeteous Ide'),
                              ),
                            ),
                          ],
                        );
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text(
                    "Explore marine categories",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  // height: 150,
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(15),
                  color: Colors.grey.shade200,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 75,
                              width: 75,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: const Icon(
                                Icons.sports_volleyball,
                                size: 60,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Marine",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Container(
                              height: 75,
                              width: 75,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: const Icon(
                                Icons.sports_volleyball,
                                size: 60,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Marine",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Container(
                              height: 75,
                              width: 75,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: const Icon(
                                Icons.sports_volleyball,
                                size: 60,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Marine",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Container(
                              height: 75,
                              width: 75,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: const Icon(
                                Icons.sports_volleyball,
                                size: 60,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Marine",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          
        ),
    );
  }

  Widget buildBigCard(String inputText1, String inputText2, String imageUrl) => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 190,
            width: 380,
            // color: Colors.purple.shade300,
            child: Image.asset(imageUrl,fit: BoxFit.contain,),
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
