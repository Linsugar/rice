import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


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
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text(widget.content['title']),),
      body:Column(
        children: [
          Container(
            height:700.h,
            width: 375.w,
            color: Colors.blue,
          ),
          Container(
            height:63.h,
            width: 375.w,
            color: Colors.black12,
          ),
        ],
      )
    );
  }
}
