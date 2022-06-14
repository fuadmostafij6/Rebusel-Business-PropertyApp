import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:rebusel/Provider/memberProvider.dart';
import 'package:rebusel/model/member_model.dart';
import 'package:rebusel/screen/sendMessage.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  MemberProvider memberProvider = MemberProvider();
  @override
  void initState() {
    memberProvider.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<MemberProvider>().fetchData();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [HexColor("#29AAE1"), HexColor("#283B8E"),HexColor("#3454D1")],
              begin: const FractionalOffset(0.0, 0.0,),

              // stops: [0.0, 1.0],
              // tileMode: TileMode.clamp
            ),
          ),
        ),

        actions: [
          // Padding(
          //   padding: const EdgeInsets.only(right: 28.0, top: 10),
          //   child: CircleAvatar(
          //     radius: 26,
          //     child: CircleAvatar(
          //       radius: 29,
          //       backgroundColor: Colors.grey[200],
          //       backgroundImage: const AssetImage("assets/images/logo.jpeg"),
          //     ),
          //   ),
          // ),
        ],
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Property",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18, top: 18),
                child: Card(
                  //    margin: EdgeInsets.all(5),

                  elevation: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please enter your valid keyword";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: "Search People",
                        contentPadding: const EdgeInsets.only(
                            top: 13, left: 12, bottom: 12),
                        fillColor: Colors.grey[300],
                        filled: true,
                        focusColor: Colors.grey[300],
                        // focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 22.0, left: 20, right: 30),
                  child: Center(
                    child: Text(
                      "Recent",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 22.0,
                left: 20,
              ),
              child: Text(
                "Messages",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Consumer<MemberProvider>(builder: (context, value, child) {
              if (value.memberModel == null) {
                return Padding(
                  padding: const EdgeInsets.only(top: 100.0,left: 60),
                  child: const CircularProgressIndicator(color:  Colors.blueAccent),
                );
              } else {
                return value.memberModel!.conversations!.isEmpty && !value.error
                    ? const Center(
                        child: Text("There is no Data"),
                      )
                    : value.error
                        ? Text(value.errorMessage)
                        : ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: value.memberModel!.conversations!.length,
                            itemBuilder: (context, index) {
                              return ListView.builder(
                                shrinkWrap: true,
                                primary: false,
                                itemCount: value.memberModel!
                                    .conversations![index].members!.length,
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index2) {
                                  return InkWell(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SendMessage(
                                                  name:
                                                      '${value.memberModel!.conversations![index].members![index2].name}',
                                                  id: '${value.memberModel!.conversations![index].members![index2].userId}',
                                                ))),
                                    child: ListTile(
                                      trailing: Column(
                                        children: [
                                          int.parse("${value.memberModel!.conversations![index].members![index2].seen}") !=
                                                  0
                                              ? Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20)),
                                                          color:  Colors.blueAccent),
                                                  width: 22,
                                                  height: 22,
                                                  child: Center(
                                                    child: Text(
                                                      "${value.memberModel!.conversations![index].members![index2].seen}",
                                                      style: const TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                )
                                              : const Icon(
                                                  Icons.check_circle_outline,
                                                  color: Colors.blueAccent,
                                                )
                                        ],
                                      ),
                                      leading: CircleAvatar(
                                        radius: 25.0,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          child: Image.asset(
                                              'assets/images/logo.jpeg'),
                                        ),
                                      ),
                                      title: Text(
                                          "${value.memberModel!.conversations![index].members![index2].name}"),
                                      subtitle: Text(
                                          "${value.memberModel!.conversations![index].members![index2].email}"),
                                    ),
                                  );
                                },
                              );
                            },
                          );
              }
            }),
          ],
        ),
      ),
    );
  }
}
