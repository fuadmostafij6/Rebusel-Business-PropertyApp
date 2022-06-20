import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rebusel/controller/my_order_controller.dart';

class AllScreen extends StatefulWidget {
  const AllScreen({Key? key}) : super(key: key);

  @override
  State<AllScreen> createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen> {
  final MyOrderController _myOrderController = Get.put(MyOrderController());

  @override
  Widget build(BuildContext context) {
    _myOrderController.getDataCalling();
    return  Obx((){
      if(_myOrderController.loader.value){
        return Center(child: CircularProgressIndicator(color: Colors.blue,),);
      }else{
        return _myOrderController.orderList.value.data!.orders!.isNotEmpty ? ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: _myOrderController.orderList.value.data!.orders!.length,
          itemBuilder: (_,index){
            var data = _myOrderController.orderList.value.data!.orders![index];
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 18.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.blueAccent,
                                        borderRadius: BorderRadius.circular(10.0)
                                    ),
                                    child: Icon(
                                      Icons.shopping_cart,
                                      color: Colors.white,
                                      size: 50,
                                    ),
                                  ),
                                )
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
                                child: Text("Order# ${data.orderId}",style: TextStyle(fontSize: 18,color: Colors.black),),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, left: 20, right: 10, bottom: 0),
                                    child: Text("${DateFormat().add_yMMMd().format(data.createdAt!)}"),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, left: 20, right: 20, bottom: 0),
                                    child: Text(" P ${data.totalPrice}",style: TextStyle(fontSize: 17,color: Colors.black),),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),

                                child: Row(
                                  children: [
                                    // Icon(
                                    //   Icons.location_on_outlined,
                                    //   color: Colors.grey,
                                    // ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0,
                                            left: 10,
                                            right: 10,
                                            bottom: 10),
                                        child: Text("Complete",style: TextStyle(fontSize: 16,color: Colors.amber),),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // /  Divider(indent: 15,endIndent: 10,),
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
        )

            : Center(
          child: Text("No Order Found",style: TextStyle(fontSize: 17,color: Colors.black),),
        );
      }
    });
  }
}