import 'package:first_app/destination_details.dart';
import 'package:first_app/main.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            children: [
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyApp(),
                          ),
                        );
                      });
                    },
                    clipBehavior: Clip.none,
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.white,
                      ),
                      iconSize: MaterialStatePropertyAll(50),
                      elevation: MaterialStatePropertyAll(0),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 30,
                      weight: 100,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: SearchAnchor(
                      builder:
                          (BuildContext context, SearchController controller) {
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
                          shape: const MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
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
                ],
              ),
              // const SizedBox(height: 30),
              // const SearchHistory(),
              // const SizedBox(height: 30),
              // const SearchSugestion(),
              const SizedBox(height: 30),
              const Destinationcards(),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchHistory extends StatelessWidget {
  const SearchHistory({super.key});

  @override
  Widget build(BuildContext context) {
    // Replace the items in the list with your actual search history
    List<String> searchHistory = [
      'Query 1',
      'Query 2',
      'Query 3',
      'Query 4',
      'Query 5'
    ];

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 8.0,
              right: 8.0,
            ),
            child: Text(
              'Search History',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 10),
            child: SizedBox(
              height: 100.0, // Set the height of the grid as needed
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Set the number of columns in the grid
                  crossAxisSpacing:
                      15, // Set the horizontal spacing between items
                  mainAxisSpacing:
                      8.0, // Set the vertical spacing between items
                  childAspectRatio: 4,
                ),
                itemCount: searchHistory.length,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    onPressed: () {
                      // Handle tapping on a search history item
                    },
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        iconSize: const MaterialStatePropertyAll(5)),
                    child: Text(searchHistory[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchSugestion extends StatelessWidget {
  const SearchSugestion({super.key});

  @override
  Widget build(BuildContext context) {
    // Replace the items in the list with your actual search history
    List<String> searchSuggestion = [
      'Query 1',
      'Query 2',
      'Query 3',
      'Query 4',
      'Query 5'
    ];

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 8.0,
              right: 8.0,
            ),
            child: Text(
              'Trending Search',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 10),
            child: SizedBox(
              height: 100.0, // Set the height of the grid as needed
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Set the number of columns in the grid
                  crossAxisSpacing:
                      15, // Set the horizontal spacing between items
                  mainAxisSpacing:
                      8.0, // Set the vertical spacing between items
                  childAspectRatio: 4,
                ),
                itemCount: searchSuggestion.length,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    onPressed: () {
                      // Handle tapping on a search history item
                    },
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        iconSize: const MaterialStatePropertyAll(5)),
                    child: Text(searchSuggestion[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Destinationcards extends StatefulWidget {
  const Destinationcards({super.key});

  @override
  State<Destinationcards> createState() => _DestinationcardsState();
}

class _DestinationcardsState extends State<Destinationcards> {
  List<String> destinationList = [
    "destination1",
    "destination1",
    "destination1",
    "destination1",
    "destination1",
    "destination1",
  ];

  List<double> rating = [
    3.5,
    3.5,
    3.5,
    3.5,
    3.5,
    3.5,
  ];

  List<Color> myCol = [
    Colors.pink.shade100,
    Colors.pink.shade200,
    Colors.pink.shade300,
    Colors.pink.shade400,
    Colors.pink.shade500,
    Colors.pink.shade600,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 600,
        child: ListView(
          children: List.generate(
            destinationList.length,
            (index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      height: 210,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade300,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8.0,
                              right: 8.0,
                              left: 8.0,
                            ),
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: myCol[index],
                              ),
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        height: 30,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white.withOpacity(0.5),
                                        ),
                                        child: Center(
                                          child: Row(
                                            children: [
                                              const Expanded(
                                                child: Icon(
                                                  Icons.star_outlined,
                                                  size: 20,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  rating[index].toString(),
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white
                                                  .withOpacity(0.5)),
                                          child: const Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Icon(Icons.favorite),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    destinationList[index],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const DestinationDetails(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Padding(
                                          padding: EdgeInsets.only(
                                              left: 15.0,
                                              right: 15.0,
                                              top: 5,
                                              bottom: 5),
                                          child: Text(
                                            "Details",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
