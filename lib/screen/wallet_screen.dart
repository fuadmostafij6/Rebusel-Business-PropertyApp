import 'package:flutter/material.dart';

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
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          "My Wallet",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),

      ),
      drawer: Drawer(),
      body: Center(
        child: Text("Upcoming",style: TextStyle(fontSize: 20,color: Colors.black),),
      ),
    );
  }
}
