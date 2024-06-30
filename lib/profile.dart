import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizon/controller/auth_controller1.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import './edit_profile.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        endDrawer: CustomDrawer(),
        body: StackExample(),
      ),
    );
  }
}

class StackExample extends StatefulWidget {
  const StackExample({super.key});

  @override
  State<StackExample> createState() => _StackExampleState();
}

class _StackExampleState extends State<StackExample> {
  final _controller = PageController(
    initialPage: 0, // Start at the second page (the first duplicate)
    viewportFraction: 0.9, // Adjust this value as needed
  );

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              // Bottom container
              const SizedBox(
                width: double.maxFinite,
                height: 200,
              ),
              //image holder
              Container(
                height: 150,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/tour1.jpeg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              // Circular widget in the middle
              const Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/profile.jpeg"),
                ),
                // Container(
                //   width: 100,
                //   height: 100,
                //   alignment: Alignment.bottomCenter,
                //   decoration: const BoxDecoration(
                //     shape: BoxShape.circle,
                //     color: Colors.red,
                //   ),
                // ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Alice Page",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text("@alicep43"),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              hobbyCard("Music"),
              const SizedBox(
                width: 10,
              ),
              hobbyCard("Swimming"),
              const SizedBox(
                width: 10,
              ),
              hobbyCard("Reading"),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfile(),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(10),
                highlightColor: Colors.blue.shade300,
                splashFactory: InkSplash.splashFactory,
                child: Container(
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200,
                  ),
                  child: const Center(
                    child: Text("Edit Profile"),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: const Icon(
                  Icons.settings,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "5",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Tours")
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "428",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Followers")
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "219",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Following")
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Guidelines",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  height: 170,
                  width: MediaQuery.of(context).size.width * 0.95,
                  margin: EdgeInsets.only(bottom: 10),
                  child: PageView.builder(
                      onPageChanged: (index) {
                        setState(() {
                          currentIndex = index;
                          // print(currentIndex);
                        });
                      },
                      controller: _controller,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        // currentIndex = index;

                        return Container(
                          width:  MediaQuery.of(context).size.width * 0.9,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:AssetImage(
                                      'assets/images/${index+1}.jpg'),
                                  fit: BoxFit.fill)),
                        );
                      }),
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 5,
                  effect: ExpandingDotsEffect(
                      activeDotColor: Colors.blueAccent,
                      dotColor: Colors.black,
                      dotHeight: 8,
                      dotWidth: 8),
                )
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: Container(
          //     height: 180,
          //     decoration: BoxDecoration(
          //       color: Colors.grey.shade200,
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //     child: Padding(
          //       padding: const EdgeInsets.only(
          //         left: 13,
          //         top: 13,
          //       ),
          //       child: Column(
          //         children: [
          //           Row(
          //             children: [
          //               const Expanded(
          //                 child: Text(
          //                   "Tours",
          //                   style: TextStyle(
          //                       fontSize: 16, fontWeight: FontWeight.bold),
          //                 ),
          //               ),
          //               Padding(
          //                 padding: const EdgeInsets.only(left: 30),
          //                 child: IconButton(
          //                   onPressed: () {},
          //                   icon: const Icon(
          //                     Icons.keyboard_arrow_right,
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //           const SizedBox(
          //             height: 8,
          //           ),
          //           Row(
          //             children: [
          //               Container(
          //                 height: 40,
          //                 width: 40,
          //                 decoration: const BoxDecoration(
          //                   shape: BoxShape.circle,
          //                   image: DecorationImage(
          //                     image: AssetImage("assets/images/profile.jpeg"),
          //                     fit: BoxFit.fill,
          //                   ),
          //                 ),
          //               ),
          //               const SizedBox(
          //                 width: 7,
          //               ),
          //               const Text(
          //                 "@alicep43",
          //                 style: TextStyle(fontWeight: FontWeight.bold),
          //               ),
          //             ],
          //           ),
          //           const SizedBox(
          //             height: 6,
          //           ),
          //           const Text(
          //             "Welcome to Seaventure! Discover amazing sea-related tours events, and volunteering opportunities.",
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          // const Rating(),

          // const TopContributers(),
        ],
      ),
    );
  }
}
class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  final _authController = Get.put(AuthController1());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white.withOpacity(0.7),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notification'),
              onTap: () {
                // Handle notification tap
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sign Out'),
              onTap: () {
                // Handle sign out tap
                _authController.logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget hobbyCard(hobyName) {
  return Container(
    height: 25,
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(25),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Text(
        hobyName,
        style: const TextStyle(fontSize: 16),
      ),
    ),
  );
}

//------------------rating----------

class Rating extends StatelessWidget {
  const Rating({super.key});
  final double cutomRating = 2.7;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade200,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text(
                  "Contribution",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 5),
              RatingBar.builder(
                initialRating: cutomRating,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                maxRating: 5,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                ignoreGestures: true,
                itemSize: 20,
                onRatingUpdate: (value) {},
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text(
                  "discription......\ndiscription......\ndiscription......\ndiscription......",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------Top Contributers---------------
class TopContributers extends StatefulWidget {
  const TopContributers({super.key});

  @override
  State<TopContributers> createState() => _TopContributersState();
}

class _TopContributersState extends State<TopContributers> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        width: double.maxFinite,
        height: 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade200,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            padding: const EdgeInsets.all(5),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(top: 5),
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(width: 1)),
                ),
                child: const ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profile.jpeg"),
                    radius: 30,
                  ),
                  title: Text("@alicep43"),
                  contentPadding: EdgeInsets.all(5),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
