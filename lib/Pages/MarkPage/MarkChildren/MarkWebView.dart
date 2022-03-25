import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MarkWeb extends StatefulWidget {
  var url;
   MarkWeb(this.url,{Key? key}) : super(key: key);

  @override
  _MarkWebState createState() => _MarkWebState();
}

class _MarkWebState extends State<MarkWeb> {
  WebViewController ?_controller;
  @override
  void initState() {
    // TODO: implement initState
    // if (Platform.isAndroid) WebView.platform = AndroidWebView();
    if(Platform.isAndroid) WebView.platform =SurfaceAndroidWebView();
    print("当前的ulr:${widget.url}");
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("详情"),),
      body:WebView(
        initialUrl: widget.url,
        onPageFinished: (String url){
          print("页面渲染完成");
        },
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController controller){
          controller.loadUrl(widget.url);
        },
      )
    );
  }
}



