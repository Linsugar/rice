import 'dart:io';

import 'package:qiniu_flutter_sdk/qiniu_flutter_sdk.dart';

class QiuNiu{
  // 创建 storage 对象
static Storage _storage = Storage();
static PutController putController = PutController();


 PusImage(String file,String token)async{
  putController.addSendProgressListener((percent) {
   print('任务进度变化：addSendProgressListener已发送：$percent');
  });
  // 添加任务状态监听
  putController.addSendProgressListener((percent) {
   print('任务进度变化：addSendProgressListener已发送：$percent');
  });
  putController.addStatusListener((StorageStatus status) {
   print('状态变化: addStatusListener当前任务状态：${status}');
  });
  // 指定上传对象key
  var key = '指定object名称';
   // 使用 storage 的 putFile 对象进行文件上传
  print("传入进来的数据：${file}--------${token}");
  var res= await _storage.putFile(File(file), token,options: PutOptions(
   controller: putController
  ));
  return res;
 }

}



