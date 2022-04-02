import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:ui';


class ChatLeft extends ConsumerStatefulWidget {
  final  content;
  const ChatLeft(this.content,{Key? key}) : super(key: key);

  @override
  _ChatLeftState createState() => _ChatLeftState();
}

class _ChatLeftState extends ConsumerState<ChatLeft> {
  @override
  Widget build(BuildContext context) {
   double statusBar= ScreenUtil().statusBarHeight;
   double bottomBar= ScreenUtil().bottomBarHeight;
   print("statusBar=$statusBar,bottomBar==$bottomBar");
   double height = AppBar().preferredSize.height;
  print("高度：${height}");
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text(widget.content['title']),),
      body:Container(
        color: Colors.yellow,
        height: 600.h,
        child: Column(
          children: [
            Container(
              width: 1.sw,
              height: 200.h,
              color: Colors.black,
            ),
            Container(
              width: 1.sw,
              height:200.h,
              color: Colors.blue,
            ),
            Container(
              width: 1.sw,
              height: 200.h,
              color: Colors.black,
            ),
          ],
        ),
      )
    );
  }
}
