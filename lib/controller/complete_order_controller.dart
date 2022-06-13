
import 'package:get/get.dart';
import 'package:rebusel/model/property_model.dart';
import 'package:rebusel/services/my_order_services.dart';

import '../model/my_order_model.dart';
import '../services/complete_order_sercies.dart';
import '../services/my_property_services.dart';

class CompleteOrderController extends GetxController {
  var orderList = MyOrderModel().obs;

  var loader = true.obs;
  final CompleteOrderServices _myPropertyServices = CompleteOrderServices();

  @override
  void onInit() {
    getDataCalling();
    super.onInit();
  }

  void getDataCalling() async {
    try {
      loader(true);
      var dataServices = await _myPropertyServices.fetchData();

      if (dataServices != null) {
        orderList.value = dataServices;
        update();
      }
    } finally {
      loader(false);
    }
  }
}
