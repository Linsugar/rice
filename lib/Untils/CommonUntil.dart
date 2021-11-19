import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:qiniu_flutter_sdk/qiniu_flutter_sdk.dart';

Widget homeInput(TextEditingController textController,FocusNode focusNode){
  return Container(
    margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white,width: 1.0)),
      padding: EdgeInsets.only(left: 10,right: 10),
      child:TextField(
        controller: textController,
        focusNode: focusNode,
        decoration: InputDecoration(
            border: InputBorder.none,
            icon: Icon(Icons.search),suffixIcon: Icon(Icons.arrow_drop_down),hintText: '请输入搜索内容'),)
  );
}






class LoadingShow{
  static setEasyStyle (){
    EasyLoading.instance
    ..indicatorType =EasyLoadingIndicatorType.wave
    ..loadingStyle=EasyLoadingStyle.light;
  }
  static showLoading(){
    setEasyStyle();
    return EasyLoading.show();
  }
  static disLoading(){
    return EasyLoading.dismiss();
  }
}


//七牛云上传图片返回地址
qiNiuUpImage(String path,String token)async{
  LoadingShow.showLoading();
  Storage stroge = Storage();
  var result =  await stroge.putFile(File(path),token);
  LoadingShow.disLoading();
  return "http://cdn.tlapp.club/${result.key}";
}


timeCheck(afterTime){
  if(afterTime == null){
    return;
  }
 var currentTime = DateTime.now().millisecondsSinceEpoch;
  print("当前时间错：$currentTime");
 if(afterTime>currentTime){
   return true;
 }else{
   return false;
 }
}
saveTime(){
  var afterTime = DateTime.now().add(Duration(days: 1)).millisecondsSinceEpoch;
  print("缓存时间戳:$afterTime");
  return afterTime;
}




