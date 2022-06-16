import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  List<Step> getStep() =>
      [Step(title: const Text("Pending"), content: Container())];
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_outlined),
        title: const Text("Order Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10.5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: const [Text("order number"), Text("date")],
                  ),
                  Column(
                    children: const [Text("order number"), Text("date")],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12.5,
            ),
            Container(
              color: Colors.black12,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [Text("Payment"), Text("Price")],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [Text("Payment Method"), Text("Card")],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Order Status"),
                        Text("Processing")
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "List of Orders",
                style: TextStyle(color: Colors.grey, fontSize: 15.0),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://yt3.ggpht.com/ytc/AKedOLRt1d4p7bPylasq_66BIC8-k3hkyVjJ2JICQITK=s900-c-k-c0x00ffffff-no-rj",
                                    scale: 1),
                                fit: BoxFit.fitHeight,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10.0),
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Processing",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.deepOrange),
                                ),
                                const Text(
                                  "Conference Table",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "100",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 18),
                                    ),
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const Text(
                                      "Quantity 1",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 18),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text("300"),
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://yt3.ggpht.com/ytc/AKedOLRt1d4p7bPylasq_66BIC8-k3hkyVjJ2JICQITK=s900-c-k-c0x00ffffff-no-rj",
                                    scale: 1),
                                fit: BoxFit.fitHeight,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10.0),
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Processing",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.deepOrange),
                                ),
                                const Text(
                                  "Conference Table",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "100",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 18),
                                    ),
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const Text(
                                      "Quantity 1",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 18),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text("300"),
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://yt3.ggpht.com/ytc/AKedOLRt1d4p7bPylasq_66BIC8-k3hkyVjJ2JICQITK=s900-c-k-c0x00ffffff-no-rj",
                                    scale: 1),
                                fit: BoxFit.fitHeight,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10.0),
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Processing",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.deepOrange),
                                ),
                                const Text(
                                  "Conference Table",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "100",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 18),
                                    ),
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const Text(
                                      "Quantity 1",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 18),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text("300"),
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://yt3.ggpht.com/ytc/AKedOLRt1d4p7bPylasq_66BIC8-k3hkyVjJ2JICQITK=s900-c-k-c0x00ffffff-no-rj",
                                    scale: 1),
                                fit: BoxFit.fitHeight,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10.0),
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Processing",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.deepOrange),
                                ),
                                const Text(
                                  "Conference Table",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "100",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 18),
                                    ),
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const Text(
                                      "Quantity 1",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 18),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text("300"),
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
                "Amounts",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Total Amount",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    "200",
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Discount",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    "200",
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Payable Amount",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    "200",
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Paid Amount",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    "200",
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
