import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
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
          "Transaction History",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: 10,
        itemBuilder: (_,index){
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.0),

                ),
              )
            ],
          );
        },
      ),
    );
  }
}
