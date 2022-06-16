import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:rebusel/Provider/propertiesDetailsProvider.dart';

class PropertiesDetailsScreen extends StatefulWidget {
  final String id;
  const PropertiesDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<PropertiesDetailsScreen> createState() =>
      _PropertiesDetailsScreenState();
}

class _PropertiesDetailsScreenState extends State<PropertiesDetailsScreen> {
  PropertiesDetailProvider propertiesDetailProvider =
      PropertiesDetailProvider();

  @override
  void initState() {
    propertiesDetailProvider.fetchData(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<PropertiesDetailProvider>().fetchData(widget.id);
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
          "Property Details",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<PropertiesDetailProvider>(
            builder: (context, value, child) {
          if (value.propertyDetails == null) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.purple,
              ),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Image.network(
                        "http://v2.rebusel.com${value.propertyDetails!.property!.propertyPhoto![0].image!}",
                        height: MediaQuery.of(context).size.height * 0.4,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.39,
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(
                            "http://v2.rebusel.com${value.propertyDetails!.property!.propertyPhoto![1].image!}",
                            height: MediaQuery.of(context).size.height *
                                0.4 /
                                (3.2),
                            fit: BoxFit.fitWidth,
                          ),
                          Image.network(
                            "http://v2.rebusel.com${value.propertyDetails!.property!.propertyPhoto![2].image!}",
                            height: MediaQuery.of(context).size.height *
                                0.4 /
                                (3.2),
                            fit: BoxFit.fitWidth,
                          ),
                          Image.network(
                            "http://v2.rebusel.com${value.propertyDetails!.property!.propertyPhoto![3].image!}",
                            height: MediaQuery.of(context).size.height *
                                0.4 /
                                (3.2),
                            fit: BoxFit.fitWidth,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(value.propertyDetails!.property!.name!),
                          Text(value.propertyDetails!.property!.propertyType!),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.grey,
                                  size: 18,
                                ),
                                Expanded(
                                  child: Text(
                                    value.propertyDetails!.property!.addedBy!
                                        .address!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Text(value.propertyDetails!.property!.price!)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.bed,
                            color: Colors.grey,
                          ),
                          Text(
                            "${value.propertyDetails!.property!.units![0].bed} Bedrooms",
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.bed,
                            color: Colors.grey,
                          ),
                          Text(
                            "${value.propertyDetails!.property!.units![0].bath} Bathrooms",
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.bed,
                            color: Colors.grey,
                          ),
                          Text(
                            "${value.propertyDetails!.property!.units![0].sqft} Sq fit",
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Card(
                  color: Colors.white54,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "http://v2.rebusel.com${value.propertyDetails!.property!.propertyPhoto![0].image!}",
                                        scale: 1),
                                    fit: BoxFit.fitHeight,
                                    alignment: Alignment.center,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${value.propertyDetails!.property!.addedBy!.name}",
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    const Text(
                                      "Property owner",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                    padding: EdgeInsets.all(0.0),
                                    child: Icon(Icons.phone)),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                    padding: EdgeInsets.all(0.0),
                                    child: Icon(Icons.message)),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Utilities",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                                color: Colors.white10,
                                shape: BoxShape.rectangle),
                            child: Icon(
                              Icons.gas_meter,
                              color: Colors.grey,
                            ),
                          ),
                          Text("Gas")
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                                color: Colors.white10,
                                shape: BoxShape.rectangle),
                            child: Icon(
                              Icons.gas_meter,
                              color: Colors.grey,
                            ),
                          ),
                          Text("Gas")
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                                color: Colors.white10,
                                shape: BoxShape.rectangle),
                            child: Icon(
                              Icons.gas_meter,
                              color: Colors.grey,
                            ),
                          ),
                          Text("Gas")
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                                color: Colors.white10,
                                shape: BoxShape.rectangle),
                            child: Icon(
                              Icons.gas_meter,
                              color: Colors.grey,
                            ),
                          ),
                          Text("Gas")
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                                color: Colors.white10,
                                shape: BoxShape.rectangle),
                            child: Icon(
                              Icons.gas_meter,
                              color: Colors.grey,
                            ),
                          ),
                          Text("Gas")
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                                color: Colors.white10,
                                shape: BoxShape.rectangle),
                            child: Icon(
                              Icons.gas_meter,
                              color: Colors.grey,
                            ),
                          ),
                          Text("Gas")
                        ],
                      ),
                    ],
                  ),
                )
              ],
            );
          }
        }),
      ),
    );
  }
}
