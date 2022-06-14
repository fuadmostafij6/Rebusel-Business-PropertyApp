import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rebusel/controller/property_controller.dart';

class MyPropertyScreen extends StatefulWidget {
  const MyPropertyScreen({Key? key}) : super(key: key);

  @override
  State<MyPropertyScreen> createState() => _MyPropertyScreenState();
}

class _MyPropertyScreenState extends State<MyPropertyScreen> {
  final MyPropertyController _myPropertyController =
      Get.put(MyPropertyController());

  @override
  Widget build(BuildContext context) {
    _myPropertyController.getDataCalling();
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [HexColor("#29AAE1"), HexColor("#283B8E"),HexColor("#3454D1")],
              begin: const FractionalOffset(0.0, 0.0,),

              // stops: [0.0, 1.0],
              // tileMode: TileMode.clamp
            ),
          ),
        ),

        elevation: 3,
        iconTheme: IconThemeData(color: Colors.white),
       // backgroundColor: Colors.white,
        title: Text(
          "Property",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),

      ),
      drawer: Drawer(),
      body: Obx(() {
        if (_myPropertyController.loader.value) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.purple,
            ),
          );
        } else {
          return  _myPropertyController.orderList.value.data!.properties!.isNotEmpty ? ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount:
                _myPropertyController.orderList.value.data!.properties!.length,
            itemBuilder: (_, index) {
              var data = _myPropertyController
                  .orderList.value.data!.properties![index];
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 12.0, top: 7, bottom: 9),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Row(
                                children: [
                                  Image.network(
                                    "${data.firstImage}",
                                    height: 110,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 18.0, left: 20, right: 10),
                                  child: Text("${data.name}",style: TextStyle(fontSize: 14,color: Colors.blueAccent),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, left: 20, right: 10, bottom: 0),
                                  child: Text("${data.unitUnit}"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),

                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: Colors.grey,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 0.0,
                                              left: 10,
                                              right: 10,
                                              bottom: 10),
                                          child: Text("${data.locationText}"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(indent: 15,endIndent: 10,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ) : Center(
            child: Text("No Data Found",style: TextStyle(fontSize: 18,color: Colors.black),),
          );
        }
      }),
    );
  }
}
