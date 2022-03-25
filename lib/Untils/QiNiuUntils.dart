import 'dart:io';

import 'package:qiniu_flutter_sdk/qiniu_flutter_sdk.dart';

class QiuNiu{
  QiuNiu._privateConstructor();
  static final QiuNiu _instance = QiuNiu._privateConstructor();
  // 创建 storage 对象
 var _storage = Storage();
  factory QiuNiu(){
    return _instance;
  }

 PusImage(String file,String token){
   // 使用 storage 的 putFile 对象进行文件上传
   _storage.putFile(File(file), token);
 }

}



