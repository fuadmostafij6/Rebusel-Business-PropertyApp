import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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

        backgroundColor: Colors.white,
        title: Text(
          "My Wallet",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),

      ),
      drawer: Drawer(),
      body: Center(
        child: Text("Upcoming",style: TextStyle(fontSize: 20,color: Colors.black),),
      ),
    );
  }
}
