import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rebusel/screen/transactiuon_history_screen.dart';

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
        body: ListView(
          shrinkWrap: true,
          primary: false,
          children: [
            CreditCardWidget(
              cardNumber: "000000000",
              expiryDate: "MM/DD",
              cardHolderName: "Abir",
              cvvCode: "1234",
              showBackView: false,
              obscureCardNumber: true,
              obscureCardCvv: true,
              height: 175,
              textStyle: TextStyle(color: Colors.yellowAccent),
              width: MediaQuery.of(context).size.width,
              animationDuration: Duration(milliseconds: 1000),
              onCreditCardWidgetChange: (CreditCardBrand) {},
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 38.0, right: 38),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  height: 130,
                  width: MediaQuery.of(context).size.height,
                  child: Card(
                    elevation: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Available Funds",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "RE 40.49",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height:50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Center(
                    child: Container(
                      alignment: Alignment.center,
                      height: 45,
                      width: 100,
                      decoration: BoxDecoration(
                        // /   color: HexColor("#29AAE1"),
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
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Text(
                        "Cash in",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30,),
                GestureDetector(
                  onTap: () {
                    Get.to(TransactionHistory());
                  },
                  child: Center(
                    child: Container(
                      alignment: Alignment.center,
                      height: 45,
                      width: 100,
                      decoration: BoxDecoration(
                        // /   color: HexColor("#29AAE1"),
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
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Text(
                        "History",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
