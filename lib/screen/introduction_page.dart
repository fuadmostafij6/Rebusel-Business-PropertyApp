import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rebusel/screen/login_screen.dart';

class IntroDuctionScreen extends StatelessWidget {
  const IntroDuctionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Center(
              child: Image.asset(
            "assets/images/rebusel_image.jpeg",
            fit: BoxFit.contain,
            height: 50,
          )),
          SizedBox(
            height: 60,
          ),
          Center(
              child: Image.asset(
            "assets/images/introduction.png",
            fit: BoxFit.contain,
            height: 170,
          )),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              "Hello! Welcome",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Center(
              child: Text(
                "The First mate and his skipper too will ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 30),
            child: Center(
              child: Text(
                "do their very comfortable ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
          ),
          SizedBox(
            height: 70,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => LoginScreen()));
            },
            child: Center(
              child: Container(
                
                alignment: Alignment.center,
                height: 45,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  gradient: LinearGradient(
                      colors: [HexColor("#29AAE1"), HexColor("#283B8E"),HexColor("#3454D1")],
                    begin: const FractionalOffset(0.0, 0.0,),

                      // stops: [0.0, 1.0],
                      // tileMode: TileMode.clamp
                  ),
                
                ),
                
                child: Text(
                  "Lets Go",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
