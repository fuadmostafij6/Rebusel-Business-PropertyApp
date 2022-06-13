import 'package:http/http.dart' as http;
import 'package:rebusel/model/my_order_model.dart';
import 'package:rebusel/model/property_model.dart';
import 'package:rebusel/utils/my_pref.dart';



class MyOrderServices {
  Future<MyOrderModel?> fetchData() async {
    String ? token;
    await MyPrefs.getToken().then((value) {
      token = value;
    });

    String api = "http://v2.rebusel.com/api/v1/my-orders/all";

    print(" URL..>>>>>$api");
    var response = await http.get(
        Uri.parse(api),
        headers: {
          "Authorization" : "Bearer $token"
        }
    );
    print("Response_____   ${response.body}");

    if (response.statusCode == 200) {
      var allAds = response.body;
      print("Response ___${response.body}");

      return myOrderModelFromJson(allAds);
    } else {
      return null;
    }
  }
}