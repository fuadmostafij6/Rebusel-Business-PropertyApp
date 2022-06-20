import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart';
import 'package:rebusel/controller/property_controller.dart';
import 'package:rebusel/screen/propertiesDetails.dart';

import '../utils/my_pref.dart';

class MyPropertyScreen extends StatefulWidget {
  const MyPropertyScreen({Key? key}) : super(key: key);

  @override
  State<MyPropertyScreen> createState() => _MyPropertyScreenState();
}

class _MyPropertyScreenState extends State<MyPropertyScreen> {
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  DateTime? date;
  TimeOfDay? time;
  final MyPropertyController _myPropertyController =
      Get.put(MyPropertyController());
  bool threeDotClick = false;
  bool switchValue = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    _myPropertyController.getDataCalling();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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

        elevation: 3,
        iconTheme: const IconThemeData(color: Colors.white),
        // backgroundColor: Colors.white,
        title: const Text(
          "Property",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
      drawer: const Drawer(),
      body: Obx(() {
        if (_myPropertyController.loader.value) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        } else {
          return _myPropertyController
                  .orderList.value.data!.properties!.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: _myPropertyController
                      .orderList.value.data!.properties!.length,
                  itemBuilder: (_, index) {
                    var data = _myPropertyController
                        .orderList.value.data!.properties![index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PropertiesDetailsScreen(
                                      id: "${data.id}",
                                    )));
                      },
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 18.0, left: 20, right: 10),
                                        child: Text(
                                          "${data.name}",
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.blueAccent),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0,
                                            left: 20,
                                            right: 10,
                                            bottom: 0),
                                        child: Text("${data.unitUnit}"),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Row(
                                          children: [
                                            const Icon(
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
                                                child: Text(
                                                    "${data.locationText}"),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Divider(
                                        indent: 15,
                                        endIndent: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                        context: context,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(20))),
                                        builder: (context) =>
                                            propertiesSelectedDiagram(context));
                                  },
                                  icon: Icon(
                                    Icons.more_vert_rounded,
                                    color: threeDotClick == true
                                        ? Colors.blue
                                        : Colors.black,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text(
                    "No Data Found",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                );
        }
      }),
    );
  }

  Widget propertiesSelectedDiagram(BuildContext context) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Status",
                style: TextStyle(fontSize: 20),
              ),
              Transform.scale(
                scale: 1,
                child:
                    Switch.adaptive(value: switchValue, onChanged: (value) {}),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Row(
                      children: const [
                        Icon(
                          Icons.document_scanner_sharp,
                          color: Colors.grey,
                        ),
                        Text(
                          "View Property",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20))),
                          builder: (context) => addPropertySchedule(context));
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.document_scanner_sharp,
                          color: Colors.grey,
                        ),
                        Text(
                          "Property Schedule",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ],
      );
  Widget addPropertySchedule(BuildContext context) => DraggableScrollableSheet(
      initialChildSize: .8,
      builder: (_, controller) => Container(
            color: Colors.white,
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              controller: controller,
              children: [
                const SizedBox(
                  height: 15.0,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Add Schedule",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text("Date"),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: TextFormField(
                              controller: dateController,
                              keyboardType: TextInputType.text,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "your Date empty";
                                }
                                return null;
                              },
                              enableSuggestions: true,
                              decoration: InputDecoration(
                                focusColor: Colors.white,
                                //add prefix icon
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    pickDate(context);
                                  },
                                  icon: const Icon(Icons.date_range_rounded),
                                ),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),

                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 1.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                fillColor: Colors.grey,

                                hintText: "Date",

                                //make hint text
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontFamily: "verdana_regular",
                                  fontWeight: FontWeight.w400,
                                ),

                                labelText: 'Date',

                                labelStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontFamily: "verdana_regular",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text("Time"),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: TextFormField(
                              controller: timeController,
                              keyboardType: TextInputType.text,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "your Time empty";
                                }
                                return null;
                              },
                              enableSuggestions: true,
                              decoration: InputDecoration(
                                focusColor: Colors.white,
                                //add prefix icon
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.timer),
                                  onPressed: () {
                                    pickTime(context);
                                  },
                                ),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),

                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 1.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                fillColor: Colors.grey,

                                hintText: "Time",

                                //make hint text
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontFamily: "verdana_regular",
                                  fontWeight: FontWeight.w400,
                                ),

                                labelText: 'Time',

                                labelStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontFamily: "verdana_regular",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 50.0,
                                  height: 50.0,
                                  color: const Color(0xffefeeee),
                                  alignment: Alignment.center,
                                  transformAlignment: Alignment.center,
                                  child: Center(
                                    child: Container(
                                      color: const Color(0xffefeeee),
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffefeeee),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          gradient: const LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Color(0xffefeeee),
                                              Color(0xffefeeee),
                                            ],
                                          ),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0xffffffff),
                                              offset: Offset(-20.0, -20.0),
                                              blurRadius: 16,
                                              spreadRadius: 0.0,
                                            ),
                                            BoxShadow(
                                              color: Color(0xffd1d0d0),
                                              offset: Offset(20.0, 20.0),
                                              blurRadius: 16,
                                              spreadRadius: 0.0,
                                            ),
                                          ],
                                        ),
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.deepPurple,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    createSchedule(
                                        "${date!.year}-${date!.minute}-${date!.day}",
                                        "${time!.hour}:${time!.minute}");

                                    dateController.text = "";
                                    timeController.text = "";
                                  }
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: <Color>[
                                          Color(0xFF29AAE1),
                                          Color(0xFF283B8E),
                                          Color(0xFF3454D1),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(80.0))),
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  child: const Text('Save',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ));

  Future createSchedule(String date, String time) async {
    String? token;
    await MyPrefs.getToken().then((value) {
      setState(() {
        token = value;
      });
    });
    final response = await post(
      Uri.parse(
          'http://v2.rebusel.com/api/v1/my-properties/167/schedule/create'),
      headers: {
        'Authorization': 'Bearer $token',
      },
      body: {'date': date, 'time': time},
    );
    print("send schedule ---${response.body}");
    // messageDetailModel!.data!.orders!.add(Order(
    //   id: messageDetailModel!.data!.orders!.last.id! + 1,
    //   message: msg,
    // ));
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5));
    if (newDate == null) return;
    setState(() {
      dateController.text = "${newDate.month}, ${newDate.day},${newDate.year}";
      date = newDate;
    });
  }

  Future pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime =
        await showTimePicker(context: context, initialTime: initialTime);

    if (newTime == null) return;
    setState(() {
      timeController.text = newTime.format(context);
      time = newTime;
    });
  }
}
