import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qiniu_flutter_sdk/qiniu_flutter_sdk.dart';
import 'package:rice/ProviderData/GlobData.dart' as Glob;

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





//
// class LoadingShow{
//   static setEasyStyle (){
//     EasyLoading.instance
//     ..indicatorType =EasyLoadingIndicatorType.wave
//     ..loadingStyle=EasyLoadingStyle.light;
//   }
//   static showLoading(){
//     setEasyStyle();
//     return EasyLoading.show();
//   }
//   static disLoading(){
//     return EasyLoading.dismiss();
//   }
// }


//七牛云上传图片返回地址
// qiNiuUpImage(String path,String token)async{
//   LoadingShow.showLoading();
//   Storage stroge = Storage();
//   var result =  await stroge.putFile(File(path),token);
//   LoadingShow.disLoading();
//   return "http://cdn.tlapp.club/${result.key}";
// }


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


Widget LoginAlert(context){
  return Dialog(
    child: Container(
      color: Colors.green,
      child: Text("11122"),
    ),
  );
}



//协议通用组件
Widget ProtocolDetail(context){
  return Consumer(builder: (context,  ref, _,){
    return Row(
      children: [
        Expanded(flex: 1,child: Checkbox(onChanged: (value){
          ref.read(Glob.GlobalData.ProtocolStatue.state).state = value;
        },value: ref.watch(Glob.GlobalData.ProtocolStatue.state).state,)),
        Expanded(flex: 9,child: RichText(text:TextSpan(
            children: [
              TextSpan(text: "登录表示已阅读并同意",style: TextStyle(color: Colors.black45),),
              TextSpan(text: "《用户协议》",style: TextStyle(color: Colors.black),recognizer: TapGestureRecognizer()..onTap=(){
                print("用户协议");
              }),
              TextSpan(text: "与",style: TextStyle(color: Colors.black45),),
              TextSpan(text: "《隐私政策》",style: TextStyle(color: Colors.black),recognizer: TapGestureRecognizer()..onTap=(){
                print("隐私政策");
              }),
            ]
        ),))
      ],
    );
  });
}


//微信支付宝登录
Widget otherLogin(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircleAvatar(
        backgroundColor: Colors.white,
        backgroundImage: AssetImage("assets/images/weixin.webp"),
      ),
      SizedBox(width: 30,),
      CircleAvatar(
        backgroundColor: Colors.white,
        backgroundImage: AssetImage("assets/images/zhifubao.webp"),
      ),
    ],
  );
}