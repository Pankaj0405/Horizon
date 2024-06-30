import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:http/http.dart' as http;
class ChatPage extends StatefulWidget {
  static const routeName  = '/chat';
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _chatController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<Map<String, dynamic>> _chatHistory = [];
  void getAnswer() async {
    // final url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=AIzaSyB6rlfCo-J1SHsuT1ORnEInttpiCwXV864";
    // final uri = Uri.parse(url);
    const apiKey = '';
    print(apiKey);
    if (apiKey == null) {
      print('No \$API_KEY environment variable');

    }
    List<Content> msg = [];

    for (var i = 0; i < _chatHistory.length-1; i++) {
      msg.add(Content.text(_chatHistory[i]["message"]));
    }

    // Map<String, dynamic> request = {
    //   "prompt": {
    //     "messages": [msg]
    //   },
    //   "temperature": 0.25,
    //   "candidateCount": 1,
    //   "topP": 1,
    //   "topK": 1
    // };
    //
    // final response = await http.post(uri, body: jsonEncode(request));
    final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey!);
    final chat = model.startChat(history: msg);
    final content =  Content.text(_chatHistory[_chatHistory.length-1]["message"]);
    final response = await chat.sendMessage(content);
    print(response.text);

    setState(() {
      _chatHistory.add({
        "time": DateTime.now(),
        "message": response.text,
        "isSender": false,
      });
    });

    _scrollController.jumpTo(
      _scrollController.position.maxScrollExtent,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chat", style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Stack(
        children: [
          Container(
            //get max height
            height: MediaQuery
                .of(context)
                .size
                .height - 160,
            child: ListView.builder(
              itemCount: _chatHistory.length,
              shrinkWrap: false,
              controller: _scrollController,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(
                      left: 14, right: 14, top: 10, bottom: 10),
                  child: Align(
                    alignment: (_chatHistory[index]["isSender"] ? Alignment
                        .topRight : Alignment.topLeft),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        color: (_chatHistory[index]["isSender"] ? Color(
                            0xFFF69170) : Colors.white),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Text(_chatHistory[index]["message"],
                          style: TextStyle(fontSize: 15,
                              color: _chatHistory[index]["isSender"] ? Colors
                                  .white : Colors.black)),
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0, vertical: 8.0),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        border: GradientBoxBorder(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFFF69170),
                                Color(0xFF7D96E6),
                              ]
                          ),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: "Type a message",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(8.0),
                          ),
                          controller: _chatController,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4.0,),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        if(_chatController.text.isNotEmpty){
                          _chatHistory.add({
                            "time": DateTime.now(),
                            "message": _chatController.text,
                            "isSender": true,
                          });
                          _chatController.clear();

                        }
                      });
                      _scrollController.jumpTo(
                        _scrollController.position.maxScrollExtent,
                      );
                      getAnswer();
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    padding: const EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFFF69170),
                              Color(0xFF7D96E6),
                            ]
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      child: Container(
                          constraints: const BoxConstraints(
                              minWidth: 88.0, minHeight: 36.0),
                          // min sizes for Material buttons
                          alignment: Alignment.center,
                          child: const Icon(Icons.send, color: Colors.white,)
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}