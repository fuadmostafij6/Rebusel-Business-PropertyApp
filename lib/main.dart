import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:rebusel/screen/BNVScreen.dart';
import 'package:rebusel/screen/introduction_page.dart';
import 'package:rebusel/utils/my_pref.dart';
import 'Provider/ProfileProvider.dart';
import 'Provider/memberProvider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => MemberProvider()),
    ChangeNotifierProvider(create: (_) => ProfileProvider()),
  ], child: const MyApp()));
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.ring
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 30.0
    ..radius = 5.0
    ..progressColor = Colors.white
    ..backgroundColor = Colors.deepOrange
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false;
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? token;
  @override
  void initState() {
    MyPrefs.getToken().then((value) {
      setState(() {
        token = value;
        print(token);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: token == "" ? const IntroDuctionScreen() : const BottomNavBar(),
    );
  }
}
