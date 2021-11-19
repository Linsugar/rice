import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Pages/HomePage/Home.dart';
import 'Pages/HomePage/Home2.dart';
import 'Pages/LaunchPage/Launch.dart';
import 'Pages/LoginPage/Login.dart';
import 'Pages/RegisterPage/Register.dart';
import 'Routes/route.dart';

void main(){

  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  runApp(ProviderScope(child:MainApp(),));
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  Color _color = Color.fromRGBO(249, 249, 249, 1);

  @override
  void initState() {
    // TODO: implement initState
    //将内容与手机系统融为一体
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness:Brightness.light,
        // primarySwatch: Colors.red,
      ),
      title: "宠爱",
      onGenerateRoute: RoutePage.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Color(0XFF64D0FF),
        resizeToAvoidBottomInset: false,
        body:Home(),
      ),
    );
  }
}



