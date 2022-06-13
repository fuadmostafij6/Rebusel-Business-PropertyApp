
import 'package:get/get.dart';
import 'package:rebusel/model/my_order_model.dart';
import 'package:rebusel/model/property_model.dart';
import 'package:rebusel/services/reject_services.dart';

import '../services/my_property_services.dart';

class RejectController extends GetxController {
  var orderList = MyOrderModel().obs;

  var loader = true.obs;
  final RejectServices _myPropertyServices = RejectServices();

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
