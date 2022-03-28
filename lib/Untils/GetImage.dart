
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:rice/Untils/QiNiuUntils.dart';

class Creamer{
  static ImagePicker _imagePicker = ImagePicker();

  static Future  GetCramer()async{
    //使用照相机拍摄
    try{
      var result = await  _imagePicker.pickImage(source:ImageSource.camera);
      return result?.path;
    }catch(e){
      print("e:$e");
    }

  }
  static  Future GetGrally(String token)async{
    //使用相册
    try{
      print("当前返回的token:$token");
      var result =  await _imagePicker.pickImage(source:ImageSource.gallery);
      // return result?.path;
      print("当前返回的result:${result!.path}");
      var url= await QiuNiu().PusImage(result.path, token);
      print("当前返回的url:${url.key}");
      return "http://cdn.tlapp.club/${url.key}";

    }catch(e){
      print("e:$e");
    }

  }

}