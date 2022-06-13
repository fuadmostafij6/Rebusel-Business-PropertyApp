import 'package:flutter/material.dart';
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 28.0, top: 10),
            child: CircleAvatar(
              radius: 26,
              child: CircleAvatar(
                radius: 29,
                backgroundColor: Colors.grey[200],
                backgroundImage: const AssetImage("assets/images/logo.jpeg"),
              ),
            ),
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 3,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "My Profile",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Consumer<ProfileProvider>(builder: (context, value, child) {
          if (value.profileModel == null) {
            return Center(child: const CircularProgressIndicator(color: Colors.purple,));
          } else {
            return value.error
                ? Text(value.errorMessage)
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 70,),
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
                          child: Text("${value.profileModel!.profile!.fullName}",style: TextStyle(fontSize: 18,color: Colors.black),),
                        ),
                        Text("${value.profileModel!.profile!.email}"),
                        SizedBox(height: 10,),
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
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.red,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 8)),
                          child: const Text(
                            "LogOut",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  );
          }
        }),
      ),
    );
  }
}
