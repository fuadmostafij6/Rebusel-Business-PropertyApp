
import 'package:get/get.dart';
import 'package:rebusel/model/property_model.dart';

import '../services/my_property_services.dart';

class MyPropertyController extends GetxController {
  var orderList = MyPropertyModel().obs;

  var loader = true.obs;
  final MyPropertyServices _myPropertyServices = MyPropertyServices();

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
