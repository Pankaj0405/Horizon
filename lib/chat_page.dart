import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizon/chat.dart';
import 'package:horizon/chat1.dart';
import 'package:horizon/gradient_text.dart';
import 'package:horizon/profilepicScreen.dart';

class ChatyPage extends StatelessWidget {
  const ChatyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AI ChatBot", style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          //get colors from hex
                          Colors.lightBlueAccent,
                          Colors.blueAccent,
                        ]
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 16.0, left: 16.0),
                            child: (
                                Text("Hi! You Can Ask Me", style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white))
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: (
                                Text("Anything", style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white))
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 16.0, bottom: 16.0),
                            child: (
                                TextButton(
                                    onPressed: (){
                                    Get.to(()=>ChatPage());
                                      },
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                                      child: GradientText(
                                        "Ask Now",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        gradient: LinearGradient(
                                            colors: [
                                              Color(0xFFF69170),
                                              Color(0xFF7D96E6),
                                            ]
                                        ),
                                      ),
                                    )
                                )
                            ),
                          ),
                        ],
                      ),
                      // const Padding(
                      //   padding: EdgeInsets.only(left: 16.0),
                      //   child: DecoratedBox(
                      //     decoration: BoxDecoration(
                      //       image: DecorationImage(image: AssetImage("assets/images/icon.png"), fit: BoxFit.cover),
                      //     ),
                      //     child: SizedBox(height: 150, width: 150,),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          //get colors from hex
                          Colors.lightBlueAccent,
                          Colors.blueAccent,
                        ]
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 16.0, left: 16.0),
                            child: (
                                Text("Explore Image Classification ", style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white))
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: (
                                Text("with Our Chatbot", style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white))
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 16.0, bottom: 16.0),
                            child: (
                                TextButton(
                                    onPressed: (){
                                      Get.to(()=>ChatPage1());
                                    },
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                                      child: GradientText(
                                        "Ask Now",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        gradient: LinearGradient(
                                            colors: [
                                              Colors.lightBlueAccent,
                                              Colors.blueAccent,
                                            ]
                                        ),
                                      ),
                                    )
                                )
                            ),
                          ),
                        ],
                      ),
                      // const Padding(
                      //   padding: EdgeInsets.only(left: 16.0),
                      //   child: DecoratedBox(
                      //     decoration: BoxDecoration(
                      //       image: DecorationImage(image: AssetImage("assets/images/icon.png"), fit: BoxFit.cover),
                      //     ),
                      //     child: SizedBox(height: 150, width: 150,),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          //get colors from hex
                          Colors.lightBlueAccent,
                          Colors.blueAccent,
                        ]
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 16.0, left: 16.0),
                            child: (
                                Text("Incident Alert!", style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white))
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: (
                                Text("Report Here", style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white))
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 16.0, bottom: 16.0),
                            child: (
                                TextButton(
                                    onPressed: (){
                                      Get.to(()=>ProfilePic());
                                    },
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                                      child: GradientText(
                                        "Report",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        gradient: LinearGradient(
                                            colors: [
                                              Colors.lightBlueAccent,
                                              Colors.blueAccent,
                                            ]
                                        ),
                                      ),
                                    )
                                )
                            ),
                          ),
                        ],
                      ),
                      // const Padding(
                      //   padding: EdgeInsets.only(left: 16.0),
                      //   child: DecoratedBox(
                      //     decoration: BoxDecoration(
                      //       image: DecorationImage(image: AssetImage("assets/images/icon.png"), fit: BoxFit.cover),
                      //     ),
                      //     child: SizedBox(height: 150, width: 150,),
                      //   ),
                      // )
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
}
