import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:rebusel/Provider/memberProvider.dart';
import 'package:rebusel/model/messegesModel.dart';
import 'package:rebusel/utils/my_pref.dart';

class SendMessage extends StatefulWidget {
  const SendMessage({Key? key}) : super(key: key);

  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  MemberProvider memberProvider = MemberProvider();

  TextEditingController sendMessageController = TextEditingController();

  List<Messages> message = [
    Messages(
        text: "hey",
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: false),
    Messages(
        text: "How are you?",
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: true),
    Messages(
        text: "fine",
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: false),
    Messages(
        text: "okay",
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: true),
    Messages(
        text: "hey",
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: false),
  ];
  Future sendMessage(String msg) async {
    String? token;
    await MyPrefs.getToken().then((value) {
      setState(() {
        token = value;
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
  void initState() {
    memberProvider.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
      ),
      body: Column(
        children: [
          Expanded(
              child: GroupedListView<Messages, DateTime>(
            reverse: true,
            order: GroupedListOrder.DESC,
            padding: const EdgeInsets.all(8),
            groupHeaderBuilder: (Messages message) => const SizedBox(),
            elements: message,
            groupBy: (Messages element) => DateTime(
                element.date.year, element.date.month, element.date.day),
            itemBuilder: (context, Messages messages) => Align(
              alignment: messages.isSentByMe
                  ? Alignment.bottomRight
                  : Alignment.centerLeft,
              child: Card(
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(messages.text),
                ),
              ),
            ),
          )),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18, bottom: 10),
            child: Container(
              height: 50,
              color: Colors.grey.shade200,
              child: TextField(
                controller: sendMessageController,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    suffixIcon: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: IconButton(
                          onPressed: () {
                            final messages = Messages(
                                text: sendMessageController.text,
                                date: DateTime.now(),
                                isSentByMe: true);
                            setState(() => message.add(messages));
                            sendMessageController.text = "";
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
