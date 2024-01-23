import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyAppState();
}

class _MyAppState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: [
            // ----------------------------Top part -----------------
            Container(
              height: 100,
              width: double.maxFinite,
              color: Colors.blue.shade100,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45),
                          color: Colors.green),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Text(
                            "welcome To",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 0.0),
                          child: Text("lorem lipsum"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // ----------------------contribution-----------------------------
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
                left: 15,
                right: 15,
              ),
              child: Container(
                height: 150,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                        right: 20,
                      ),
                      child: Text(
                        "You've contributed to marine",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        right: 55,
                      ),
                      child: Text(
                        "75% of your waekly goal is completed",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 15, bottom: 10),
                      child: LinearProgressIndicator(
                        value: 0.75,
                        minHeight: 15,
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),

            // ------------------------------search bar--------------------------------

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchAnchor(
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
              height: 20,
            ),
            Container(
              height: 40,
              width: double.maxFinite,
              color: Colors.blue.shade300,
              child: const Row(
                children: [
                  Text(
                    "Most popular marine activities",
                    style: TextStyle(
                      fontSize: 18,
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
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: double.maxFinite,
              color: Colors.blue.shade400,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildBigCard(
                      "Marine conservation",
                      "Tadius ideas",
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    buildBigCard(
                      "Marine",
                      "Tadius ideas",
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    buildBigCard(
                      "conservation",
                      "Tadius ideas",
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    buildBigCard(
                      "Marine conservation",
                      "Tadius ideas",
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              width: double.maxFinite,
              color: Colors.blue.shade300,
              child: const Row(
                children: [
                  Text(
                    "Quick marine workouts",
                    style: TextStyle(
                      fontSize: 18,
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
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: double.maxFinite,
              color: Colors.blue.shade400,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildSmallCard(
                      "Marine conservation",
                      "Tadius ideas",
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    buildSmallCard(
                      "Marine",
                      "Tadius ideas",
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    buildSmallCard(
                      "conservation",
                      "Tadius ideas",
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    buildSmallCard(
                      "Marine conservation",
                      "Tadius ideas",
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.blue.shade400,
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(
                  "Explore marine categories",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 150,
              width: double.maxFinite,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(color: Colors.blue.shade500),
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
          ],
        ),
        
      ),
    );
  }

  Widget buildBigCard(String inputText1, String inputText2) => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 190,
            width: 400,
            color: Colors.purple.shade300,
          ),
          Container(
            height: 100,
            width: 400,
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
