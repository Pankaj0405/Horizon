import 'package:flutter/material.dart';
import './edit_profile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: StackExample(),
      ),
    );
  }
}

class StackExample extends StatelessWidget {
  const StackExample({super.key});

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
                  color: Colors.green,
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
            "Profile name",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text("@nickname"),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              hobbyCard(),
              const SizedBox(
                width: 10,
              ),
              hobbyCard(),
              const SizedBox(
                width: 10,
              ),
              hobbyCard(),
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
                onPressed: () {},
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
                      "0",
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
                      "0",
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
                      "0",
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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 13,
                  top: 13,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "Tours",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.keyboard_arrow_right,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        const Text(
                          "nickname",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Text(
                      "Welcome to Seaventure! Discover amazing sea-related tours events, and volunteering opportunities.",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget hobbyCard() {
  return Container(
    height: 25,
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(25),
    ),
    child: const Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Text(
        "hobby",
        style: TextStyle(fontSize: 16),
      ),
    ),
  );
}
