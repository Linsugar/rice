import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rice/Untils/CommonUntil.dart';

class Request{
  static Dio network = new Dio(BaseOptions(
    connectTimeout: 5000,
//    baseUrl:'http://tlapp.club:8002/Jia/'
//   baseUrl: "http://192.168.3.199:8000/v1"
  baseUrl: "http://192.168.3.199:8000/"
//    baseUrl: 'http://3ie5702133.wicp.vip/Jia/'
////    测试
//    baseUrl: 'http://192.168.1.5:8000/Jia/',
//       baseUrl:'https://tlapp.club/Jia/',
//    baseUrl: 'http://192.168.5.208:8000/Jia/',
  ))..interceptors.add(InterceptorsWrapper(
    onRequest:(options, handler) {
      print("进入拦截onRequest${options.data}");
      // LoadingShow.showLoading();
      EasyLoading.show(status: '加载中...');
      return handler.next(options);
    },
    onResponse:(response,handler) {
      print("进入拦截onResponse${response.data}");
      // LoadingShow.disLoading();
      EasyLoading.dismiss();
      return handler.next(response); // continue
    },
    onError: ( DioError e, ErrorInterceptorHandler handler,){
      // LoadingShow.disLoading();
      EasyLoading.dismiss();
      print("进入拦截onError${e.error}");
    }
  ));

  static getNetwork(url,{Map<String, dynamic> ?params,token})async{
    var options = Options(
      headers: {
        // "Authorization":token==null?'':'ak7 '+token+" auth"
        "token":token==null?'':token
      }
    );
    try{
      var getResult = await network.get(url,queryParameters: params,options: options);
      return getResult.data;
    }catch(e){
      print("get：$e");
    }
  }
  static setNetwork(String url,{String ?token,data})async{
    var options = Options(
        headers: {
          // "Authorization":token==null?'':'ak7 '+token+" auth"
          "Authorization":token==null?'':token
        }
    );
    try{
      print('roogpost：===========================================');
      var postResult = await network.post(url,data: data,options: options);
      print('roogpost：${postResult.realUri}');
      return postResult.data;
    }catch(e){
      print("post：$e");
    }
  }

}

