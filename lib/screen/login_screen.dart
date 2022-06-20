import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:rebusel/screen/forgot_password_screen.dart';
import 'package:rebusel/utils/my_pref.dart';

import '../model/login_model.dart';
import 'BNVScreen.dart';
import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSelect = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late LoginRes _loginRes;

  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [HexColor("#29AAE1"), HexColor("#283B8E"),HexColor("#3454D1")],
            begin: const FractionalOffset(0.0, 0.0,),

            // stops: [0.0, 1.0],
            // tileMode: TileMode.clamp
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: key,
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0, right: 28.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(33.0),
                    child: Container(
                      height: 500,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: Center(
                              child: Text(
                                "Login Account",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Center(
                              child: Text(
                                "Discover your social & try to login",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 28.0, bottom: 20),
                            child: Center(
                              child: Image.asset(
                                "assets/images/rebusel_image.jpeg",
                                fit: BoxFit.contain,
                                height: 40,
                              ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 18.0, right: 18, top: 18),
                              child: Card(
                                //    margin: EdgeInsets.all(5),

                                elevation: 3,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: TextFormField(
                                    controller: emailController,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Please enter your email";
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.email_outlined),
                                      hintText: "Email",
                                      contentPadding: EdgeInsets.only(
                                          top: 13, left: 12, bottom: 12),
                                      fillColor: Colors.white,
                                      filled: true,
                                      focusColor: Colors.white,
                                      // focusedBorder: InputBorder.none,
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(height: 15,),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 18.0, right: 18, top: 14),
                              child: Card(
                                //    margin: EdgeInsets.all(5),

                                elevation: 3,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: TextFormField(
                                    controller: passwordController,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Please enter your password";
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.lock_open),
                                      hintText: "Password",
                                      contentPadding: EdgeInsets.only(
                                          top: 13, left: 12, bottom: 12),
                                      fillColor: Colors.white,
                                      filled: true,
                                      focusColor: Colors.white,
                                      // focusedBorder: InputBorder.none,
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: isSelect,
                                        onChanged: (val) {
                                          setState(() {
                                            isSelect = val!;
                                          });
                                        }),
                                    Text("Remember Me"),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 18.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (_)=> ForgotPasswordScreen()));
                                  },
                                  child: Text("Forgot Password"),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),

                          GestureDetector(
                            onTap: () {
                              if (key.currentState!.validate()) {
                                checkAPI();
                              }
                            },
                            child: Center(
                              child: Container(
                                alignment: Alignment.center,
                                height: 45,
                                width: 200,
                                decoration: BoxDecoration(
                               // /   color: HexColor("#29AAE1"),
                                  gradient: LinearGradient(
                                    colors: [HexColor("#29AAE1"), HexColor("#283B8E"),HexColor("#3454D1")],
                                    begin: const FractionalOffset(0.0, 0.0,),

                                    // stops: [0.0, 1.0],
                                    // tileMode: TileMode.clamp
                                  ),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> checkAPI() async {
    EasyLoading.show(maskType: EasyLoadingMaskType.clear);
    Map<String, dynamic> jsonMap = {
      'email': "${emailController.text}",
      "password": "${passwordController.text}"
    };

    try {
      final response = await http.post(
        Uri.parse("http://v2.rebusel.com/api/v1/login"),
        headers: {
          "Accept": "application/json",
        },
        encoding: Encoding.getByName("utf-8"),
        body: jsonMap,
      );

      EasyLoading.dismiss();
      _loginRes = loginResFromJson(response.body);

      if (response.statusCode == 200) {
        if (_loginRes.status == 200) {
          MyPrefs.setToken(_loginRes.user!.apiToken.toString());
          MyPrefs.setId(_loginRes.user!.id.toString());
          MyPrefs.setUserType(_loginRes.user!.userType.toString());
          Fluttertoast.showToast(
              msg: "Login Successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BottomNavBar(),
          ));
        } else  {
          var error = json.decode(response.body);

       //   print("ERROR___${error['errors']['email'][0]}");
          print("ERROR___ Wrong${error['msg']}");


          if(_loginRes.status==400){
            Get.defaultDialog(
                title: "Error!",
                content: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0,bottom: 10),
                          child: Text("${error['errors']['email'][0]}"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: Center(
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                              child: Text("OK")),
                        ),
                      ),
                    ],
                  ),
                ));
          }else if(_loginRes.status==404){
            Get.defaultDialog(
                title: "Error!",
                content: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0,bottom: 10),
                          child: Text("${error['msg']}"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: Center(
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                              child: Text("OK")),
                        ),
                      ),
                    ],
                  ),
                ));
          }



          // Fluttertoast.showToast(
          //     msg: "dhshshsh",
          //     toastLength: Toast.LENGTH_SHORT,
          //     gravity: ToastGravity.CENTER,
          //     timeInSecForIosWeb: 1,
          //     backgroundColor: Colors.red,
          //     textColor: Colors.white,
          //     fontSize: 16.0);
        }
      } else  {
        // var error = json.decode(response.body);
        //
        // print("ERROR___${error['errors']['email'][0]}");
        //
        // Fluttertoast.showToast(
        //     msg: "${error['errors']['email'][0]}",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.red,
        //     textColor: Colors.white,
        //     fontSize: 16.0);
      }
      print(response.body);
    } on SocketException {
      EasyLoading.dismiss();
    }
  }
}
