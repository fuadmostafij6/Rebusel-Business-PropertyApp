import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rebusel/utils/my_pref.dart';

class SendMessage extends StatefulWidget {
  const SendMessage({Key? key}) : super(key: key);

  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  TextEditingController sendMessageController = TextEditingController();
  Future sendMessage(String msg) async {
    String ? token;
    await MyPrefs.getToken().then((value) {
      setState((){
        token= value;
      });
    });
    final response = await post(
      Uri.parse('http://v2.rebusel.com/api/v1/conversations/message/send'),
      headers: {
        'Authorization': 'Bearer $token',
      },
      body: {'cid': '224', 'message': msg},
    );
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.only(left: 18.0,right: 18,bottom: 10),
            child: Container(

              height: 50,
              color: Colors.grey.shade200,
              child: TextField(
                controller: sendMessageController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                    suffix: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: IconButton(
                          onPressed: () {
                            print(sendMessageController.text);
                            sendMessage(sendMessageController.text);
                          },
                          icon: const Icon(
                            Icons.send,
                            color: Colors.deepPurple,
                          )),
                    ),
                    contentPadding: const EdgeInsets.all(12),
                    hintText: ""),
              ),
            ),
          )
        ],
      ),
    );
  }
}
