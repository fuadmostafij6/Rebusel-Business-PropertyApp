import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rebusel/model/forgot_password_model.dart';

import 'login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final key = GlobalKey<FormState>();
  late ForgotPassModel _forgotPassModel;

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
                            padding: const EdgeInsets.only(top: 29.0),
                            child: Center(
                              child: Text(
                                "Forgot Password",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 40, right: 30),
                            child: Center(
                              child: Text(
                                "Please enter your Email to reset your Password",
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
                                "assets/images/forgot_pass.png",
                                fit: BoxFit.contain,
                                height: 100,
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

                          SizedBox(
                            height: 40,
                          ),

                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 18.0, top: 10),
                                child: Text(
                                  "Password reset Link",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 18.0),
                                child: GestureDetector(
                                  onTap: () {
                                    if (key.currentState!.validate()) {
                                      checkAPI();
                                    }
                                  },
                                  child: Center(
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 35,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [HexColor("#29AAE1"), HexColor("#283B8E"),HexColor("#3454D1")],
                                          begin: const FractionalOffset(0.0, 0.0,),

                                          // stops: [0.0, 1.0],
                                          // tileMode: TileMode.clamp
                                        ),
                                      //  color: HexColor("#29AAE1"),
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      child: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),

                          InkWell(
                            onTap: (){
                              Navigator.pop(context,true);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 1.0, top: 50),
                              child: Text(
                                "Back to Login",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
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
    };

    try {
      final response = await http.post(
        Uri.parse("http://v2.rebusel.com/api/v1/forgot-password"),
        headers: {
          "Accept": "application/json",
        },
        encoding: Encoding.getByName("utf-8"),
        body: jsonMap,
      );

      EasyLoading.dismiss();
      _forgotPassModel = forgotPassModelFromJson(response.body);

      if (response.statusCode == 200) {
        if (_forgotPassModel.status == 200) {
          Get.defaultDialog(
              title: "Password reset link send",
              content: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text("We have e-mailed your password reset link!"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: Center(
                        child: ElevatedButton(
                            onPressed: () {
                              Get.off(LoginScreen());
                            },
                            child: Text("OK")),
                      ),
                    ),
                  ],
                ),
              ));

        } else if (_forgotPassModel.status == 400) {
          var error = json.decode(response.body);

          print("ERROR___${error['errors']['email'][0]}");

          Get.defaultDialog(
              title: "Error!",
              content: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0),
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

          // Fluttertoast.showToast(
          //     msg: "dhshshsh",
          //     toastLength: Toast.LENGTH_SHORT,
          //     gravity: ToastGravity.CENTER,
          //     timeInSecForIosWeb: 1,
          //     backgroundColor: Colors.red,
          //     textColor: Colors.white,
          //     fontSize: 16.0);
        }
      } else if (_forgotPassModel.status == 400) {
        var error = json.decode(response.body);

        print("ERROR___${error['errors']['email'][0]}");

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
