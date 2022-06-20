import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:rebusel/Provider/ProfileProvider.dart';

import '../utils/constace.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileProvider profileProvider = ProfileProvider();

  @override
  void initState() {
    profileProvider.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<ProfileProvider>().fetchData();
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
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

              // stops: [0.0, 1.0],
              // tileMode: TileMode.clamp
            ),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
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
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "My Profile",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Consumer<ProfileProvider>(builder: (context, value, child) {
          if (value.profileModel == null) {
            return Center(
                child: const CircularProgressIndicator(
              color: Colors.blue,
            ));
          } else {
            return value.error
                ? Text(value.errorMessage)
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 60.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.network(value
                                        .profileModel!.profile!.image !=
                                    ""
                                ? "https://v2.rebusel.com/${value.profileModel!.profile!.image}"
                                : "https://cdn1.iconfinder.com/data/icons/get-me-home/512/account_avater_male_person_profile_user_logged-512.png"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${value.profileModel!.profile!.fullName}",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                        Text("${value.profileModel!.profile!.email}"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("${value.profileModel!.profile!.phone}"),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                                color: Colors.blue,
                                iconSize: 40,
                                onPressed: () {},
                                icon: const FaIcon(
                                    FontAwesomeIcons.facebookSquare)),
                            IconButton(
                                color: Colors.blue,
                                iconSize: 40,
                                onPressed: () {},
                                icon: const FaIcon(
                                    FontAwesomeIcons.twitterSquare)),
                            IconButton(
                                color: Colors.deepOrange,
                                iconSize: 40,
                                onPressed: () {},
                                icon: const FaIcon(
                                    FontAwesomeIcons.instagramSquare)),
                            IconButton(
                                color: Colors.red,
                                iconSize: 40,
                                onPressed: () {},
                                icon: const FaIcon(
                                    FontAwesomeIcons.youtubeSquare))
                          ],
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 18.0, right: 18.0, bottom: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  //  alignment: Alignment.center,
                                  height: 150,
                                  width: MediaQuery.of(context).size.width,
                                  child: Card(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        Text(
                                          "Property owner",
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.blue),
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          "Agent Type",
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  //  alignment: Alignment.center,
                                  height: 150,
                                  width: MediaQuery.of(context).size.width,
                                  child: Card(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Madhu City",
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.blue),
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          "Agent Name",
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.red,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 8)),
                          child: const Text(
                            "           LogOut             ",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
          }
        }),
      ),
    );
  }
}
