
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:rebusel/screen/all_order_screen.dart';
import 'package:rebusel/screen/complete_screen.dart';
import 'package:rebusel/screen/pending_order_screen.dart';
import 'package:rebusel/screen/process_order_screen.dart';
import 'package:rebusel/screen/reject_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Example(),
    );
  }
}

class Example extends StatefulWidget {
  Example({Key? key}) : super(key: key);

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          "My Order",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
      drawer: Drawer(),
      body: SafeArea(
        child: DefaultTabController(
          length: 5,
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              children: <Widget>[
                ButtonsTabBar(
                  backgroundColor: Colors.blue,
                  unselectedBackgroundColor: Colors.grey[300],
                  unselectedLabelStyle: TextStyle(color: Colors.black),
                  labelStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  tabs: [
                    Tab(
                      text: "         All           ",
                    ),
                    Tab(
                      text: "    Pending     ",
                    ),
                    Tab(
                      text: "       Processing     ",
                    ),
                    Tab(
                      text: "       Complete     ",
                    ),
                    Tab(
                      text: "       Reject     ",
                    ),
                    // Tab(icon: Icon(Icons.directions_bike)),
                    // Tab(icon: Icon(Icons.directions_car)),
                    // Tab(icon: Icon(Icons.directions_transit)),
                    // Tab(icon: Icon(Icons.directions_bike)),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                   AllScreen(),
                     PendiingOrderScreen(),
                    ProcessOrderScreen(),
                      CompleteScreen(),
                     RejectScreen(),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}