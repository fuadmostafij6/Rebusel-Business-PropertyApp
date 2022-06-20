
import 'package:shared_preferences/shared_preferences.dart';

import 'constace.dart';

class MyPrefs {
  SharedPreferences? preferences;

  static Future<void> setToken(String authcode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Constance.authCode, authcode);
  }

  static Future<String> getToken() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(Constance.authCode) ?? "";
  }


  static Future<void> setId(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Constance.id, id);
  }

  static Future<String> getid() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(Constance.id) ?? "";
  }
  static Future<void> setUserType(String userType) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Constance.user_type, userType);
  }

  static Future<String> getUserType() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(Constance.user_type) ?? "";
  }
}
