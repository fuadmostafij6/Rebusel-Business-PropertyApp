import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart';
import 'package:rebusel/utils/my_pref.dart';

import '../model/member_model.dart';

class MemberProvider with ChangeNotifier {
  MemberModel? memberModel;
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

  Future fetchData() async {
    String ? token;
    await MyPrefs.getToken().then((value) {
      token = value;
    });
    final res = await get(
        Uri.parse(
          "http://v2.rebusel.com/api/v1/conversations/index",
        ),
        headers: {

          'Authorization': 'Bearer $token',
        });
    // _map = json.decode(res.body);
    // print(_map.toString() + "first");

    if (res.statusCode == 200) {
      try {
        _map = json.decode(res.body);
        memberModel = MemberModel.fromJson(_map);

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
