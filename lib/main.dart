import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Pages/HomePage/Home.dart';
import 'Pages/LoginPage/Login.dart';
import 'Routes/route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(){

  SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  runApp(ProviderScope(child:MainApp(),));
}


class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //将内容与手机系统融为一体
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
      ),
      title: "宠爱",
      onGenerateRoute: RoutePage.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}






class test1 extends StatefulWidget {
  const test1({Key? key}) : super(key: key);

  @override
  _test1State createState() => _test1State();

}

class _test1State extends State<test1> {


  @override
  void initState() {
    // TODO: implement initState
    //到时候他就会先使用这个来提示
    showDialog(context: context, builder:(context){
      return Text("222");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
