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
              Card(
                elevation: 4,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10.0),

                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/images/pay.png",height: 50,width: 60,),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("paypal",style: TextStyle(fontSize: 16,color: Colors.black),),
                            SizedBox(height: 5,),
                            Text("June 20,2022",style: TextStyle(fontSize: 14,color: Colors.black),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Rebusel Amount",style: TextStyle(fontSize: 13,color: Colors.black),),
                            SizedBox(height: 5,),
                            Center(child: Text("400",style: TextStyle(fontSize: 12,color: Colors.black),textAlign: TextAlign.center,)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Peso",style: TextStyle(fontSize: 13,color: Colors.black),),
                            SizedBox(height: 5,),
                            Text("400",style: TextStyle(fontSize: 12,color: Colors.black),),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
