import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../model/property_details_model.dart';
import '../utils/constace.dart';
import '../utils/my_pref.dart';

class PropertiesDetailProvider with ChangeNotifier {
  PropertyDetails? propertyDetails;
  BuildContext? context;
  bool _error = true;
  bool get error => _error;
  Map<String, dynamic> _map = {};
  Map<String, dynamic> get map => _map;
  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  // MemberProvider() {
  //   fetchData();
  // }
  void setView(BuildContext context) => this.context = context;

  Future fetchData(String id) async {
    String? token;
    await MyPrefs.getToken().then((value) {
      token = value;
    });
    final res = await get(
        Uri.parse(
          "${Constance.urlHost}/my-properties/details/$id",
        ),
        headers: {
          'Authorization': 'Bearer $token',
        });
    // _map = json.decode(res.body);
    print("${res.body}response2");

    if (res.statusCode == 200) {
      try {
        _map = json.decode(res.body);
        propertyDetails = PropertyDetails.fromJson(_map);

        _error = false;
        notifyListeners();
      } catch (e) {
        _map = {};
        _error = true;
        _errorMessage = e.toString();
        notifyListeners();
      }
    } else {
      _errorMessage = "May Be Internet Issue";
      _map = {};
      notifyListeners();
    }

    notifyListeners();
  }
}
