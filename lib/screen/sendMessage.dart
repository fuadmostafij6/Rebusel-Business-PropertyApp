import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart';
import 'package:rebusel/model/profile_model.dart';
import 'package:rebusel/utils/my_pref.dart';
import 'package:http/http.dart' as http;

import '../model/message_detail_model.dart';

class SendMessage extends StatefulWidget {
  final String? id;
  final String? name;
  const SendMessage({Key? key, this.id, required this.name}) : super(key: key);

  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  // MemberProvider memberProvider = MemberProvider();
  // ProfileProvider profileProvider = ProfileProvider();
  final _formKey = GlobalKey<FormState>();
  ProfileModel? profileModel;
  List<Order> messages = [];
  TextEditingController sendMessageController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  MessageDetailModel? messageDetailModel;
  bool isLoder = false;
  Future<MessageDetailModel?> getMessageDetail(String conversionId) async {
    setState(() {
      isLoder = true;
    });
    String? token;
    await MyPrefs.getToken().then((value) {
      setState(() {
        token = value;
      });
    });
    var url = "http://v2.rebusel.com/api/v1/conversations/$conversionId";
    var res = await http.get(
      Uri.parse("$url"),
      headers: {"Authorization": "Bearer $token"},
    );
    if (res.statusCode == 200) {
      print("URL__${url}->${token}");
      log(res.body);
      setState(() {
        messageDetailModel = messageDetailModelFromJson(res.body);
        isLoder = false;
      });
    } else {
      setState(() {
        isLoder = false;
      });
    }
    return messageDetailModel;
  }

  String? userId;
  String? userType;

  @override
  void initState() {
    // memberProvider.fetchData();
    // profileProvider.fetchData();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        getMessageDetail(widget.id!);
        MyPrefs.getid().then((value) {
          setState(() {
            userId = value;
          });
        });
        MyPrefs.getUserType().then((value) {
          setState(() {
            userType = value;
          });
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(userType);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                HexColor("#29AAE1"),
                HexColor("#283B8E"),
                HexColor("#3454D1")
              ],
              begin: const FractionalOffset(
                0.0,
                0.0,
              ),
            ),
          ),
        ),
        title: Text(widget.name!),
      ),
      body: isLoder
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            )
          : Column(
              children: [
                Expanded(
                    child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: messageDetailModel!.data!.orders!.length,
                  itemBuilder: (_, index) {
                    var revers =
                        messageDetailModel!.data!.orders!.reversed.toList();
                    var data = revers[index];
                    var isRight = data.createdBy == userId ? true : false;
                    log("${isRight}");
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 12.0, right: 12.0, top: 5),
                      child: Row(
                        mainAxisAlignment: isRight
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          Card(
                            color:
                                isRight ? Colors.blue[800] : Colors.grey[200],
                            elevation: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                data.message!,
                                style: TextStyle(
                                    color:
                                        isRight ? Colors.white : Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                )),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 18.0, right: 18, bottom: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          height: 50,
                          child: TextField(
                            controller: sendMessageController,
                            decoration: const InputDecoration(
                                border: InputBorder.none,

                                // border:
                                // suffixIcon: Container(
                                //   decoration:  BoxDecoration(
                                //       color: Colors.white,
                                //       borderRadius: BorderRadius.circular(30)),
                                //   child: IconButton(
                                //       onPressed: () {
                                //
                                //       },
                                //       icon: const Icon(
                                //         Icons.send,
                                //         color: Colors.deepPurple,
                                //       )),
                                // ),
                                contentPadding: EdgeInsets.all(12),
                                hintText: "Send message"),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 13.0, bottom: 10),
                      child: Container(
                        padding: const EdgeInsets.all(14.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          gradient: LinearGradient(
                            colors: [
                              HexColor("#29AAE1"),
                              HexColor("#283B8E"),
                              HexColor("#3454D1")
                            ],
                            begin: const FractionalOffset(
                              0.0,
                              0.0,
                            ),

                            // stops: [0.0, 1.0],
                            // tileMode: TileMode.clamp
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              sendMessage(sendMessageController.text);

                              sendMessageController.text = "";
                            });
                          },
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    userType == "Services Provider"
                        ? TextButton(
                            onPressed: () {
                              inquiryDialog(context);
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                            child: const Text(
                              "? Send Inquiry",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        : SizedBox()
                  ],
                ),
              ],
            ),
    );
  }

  void inquiryDialog(BuildContext context) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Column(
              children: [
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              child: Text("Send Message"),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, top: 10),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.close)),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: nameController,
                            keyboardType: TextInputType.text,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "your Name is empty";
                              }
                              return null;
                            },
                            enableSuggestions: true,
                            decoration: InputDecoration(
                              focusColor: Colors.white,
                              //add prefix icon

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),

                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 1.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              fillColor: Colors.grey,

                              hintText: "Name",

                              //make hint text
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontFamily: "verdana_regular",
                                fontWeight: FontWeight.w400,
                              ),

                              labelText: 'Name',

                              labelStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontFamily: "verdana_regular",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.text,
                            validator: (val) {
                              bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(val!);
                              if (emailValid == false) {
                                return "your email is not valid";
                              } else if (val.isEmpty) {
                                return "your email is empty";
                              }
                              return null;
                            },
                            enableSuggestions: true,
                            decoration: InputDecoration(
                              focusColor: Colors.white,
                              //add prefix icon

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),

                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 1.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              fillColor: Colors.grey,

                              hintText: "Email",

                              //make hint text
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontFamily: "verdana_regular",
                                fontWeight: FontWeight.w400,
                              ),

                              labelText: 'Email',

                              labelStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontFamily: "verdana_regular",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.text,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "your Phone number is empty";
                              }
                              return null;
                            },
                            enableSuggestions: true,
                            decoration: InputDecoration(
                              focusColor: Colors.white,
                              //add prefix icon

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),

                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 1.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              fillColor: Colors.grey,

                              hintText: "Phone",

                              //make hint text
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontFamily: "verdana_regular",
                                fontWeight: FontWeight.w400,
                              ),

                              labelText: 'Phone',

                              labelStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontFamily: "verdana_regular",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: addressController,
                            maxLines: 7,
                            minLines: 4,
                            keyboardType: TextInputType.text,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "your address is empty";
                              }
                              return null;
                            },
                            enableSuggestions: true,
                            decoration: InputDecoration(
                              focusColor: Colors.white,
                              //add prefix icon

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),

                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 1.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              fillColor: Colors.grey,

                              hintText: "Address",

                              //make hint text
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontFamily: "verdana_regular",
                                fontWeight: FontWeight.w400,
                              ),

                              labelText: 'Address',

                              labelStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontFamily: "verdana_regular",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                inquiryPost(
                                    nameController.text,
                                    emailController.text,
                                    phoneController.text,
                                    addressController.text);
                                sendMessage(
                                    "name: ${nameController.text} \nEmail:${emailController.text} \nPhone: ${phoneController.text} \nAddress: ${addressController.text}");
                                nameController.text = "";
                                emailController.text = "";
                                addressController.text = "";
                                phoneController.text = "";
                              }
                            },
                            child: const Text("Submit"))
                      ],
                    )),
              ],
            ),
          );
        },
      );

  Future inquiryPost(
      String name, String email, String phone, String address) async {
    String? token;
    await MyPrefs.getToken().then((value) {
      setState(() {
        token = value;
      });
    });
    final response = await post(
      Uri.parse('http://v2.rebusel.com/api/v1/invoice/invoice-inquiry-data'),
      headers: {
        'Authorization': 'Bearer $token',
      },
      body: {
        'conv_id': widget.id,
        'name': name,
        'email': email,
        'phone': phone,
        'address': address
      },
    );
    print(response.body + " Inquiry");
  }

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
      body: {'cid': widget.id, 'message': msg},
    );
    print("send data ---${response.body}");
    // messageDetailModel!.data!.orders!.add(Order(
    //   id: messageDetailModel!.data!.orders!.last.id! + 1,
    //   message: msg,
    // ));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var odr = Order(
        conversationId: data["message"]["conversation_id"],
        id: data["message"]["id"],
        message: data["message"]["message"],
      );
      messageDetailModel!.data!.orders!.insert(0, odr);

      setState(() {});
    }
    print(widget.id! + "dadad");
    print(response.body);
  }
}
