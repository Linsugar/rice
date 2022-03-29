import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rice/ProviderData/GlobData.dart';
import 'Pages/HomePage/Home.dart';
import 'Pages/LoginPage/Login.dart';
import 'Routes/route.dart';

void main(){

  SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  runApp(ProviderScope(child:MainApp(),));

}

class MainApp extends ConsumerWidget {
  const MainApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.light
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false;
    //将内容与手机系统融为一体
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    //获取设备信息
    getDevices(ref);
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
      ),
      title: "宠爱",
      onGenerateRoute: RoutePage.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      home:  Home(),
      builder: EasyLoading.init(),
    );
  }
}

getDevices(WidgetRef ref)async{
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  print('Running on model${androidInfo.model}');  // e.g. "Moto G (4)"
  print('Running on androidId${androidInfo.androidId}');  // e.g. "Moto G (4)"
  print('Running on board${androidInfo.board}');  // e.g. "Moto G (4)"
  print('Running on device${androidInfo.device}');  // e.g. "Moto G (4)"
  print('Running on  isPhysicalDevice${androidInfo.isPhysicalDevice}');  // e.g. "Moto G (4)"
  print('Running on bootloader  ${androidInfo.bootloader}');  // e.g. "Moto G (4)"
  print('Running on tags ${androidInfo.tags}');  // e.g. "Moto G (4)"
  ref.read(GlobalData.AndroidDeviceInfo.state).state = androidInfo;
  // IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
  // ref.read(GlobalData.IOSDeviceInfo.state).state = iosInfo;
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
