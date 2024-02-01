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
              const SizedBox(height: 30),
              const SearchHistory(),
              const SizedBox(height: 30),
              const SearchSugestion(),
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
                      backgroundColor: const MaterialStatePropertyAll(Color.fromARGB(255, 171, 215, 102)),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      iconSize: const MaterialStatePropertyAll(5),
                    ),
                    
                    child: Text(searchSuggestion[index],
                    style: const TextStyle(color: Colors.white),),
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
