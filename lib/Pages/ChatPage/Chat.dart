import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rice/Pages/LoginPage/Login.dart';
import 'package:rice/ProviderData/GlobData.dart' as Glob;
import 'package:rice/Untils/CommonUntil.dart';
import 'package:rice/Untils/Eventbus.dart';




class Chat extends ConsumerStatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends ConsumerState<Chat> with AutomaticKeepAliveClientMixin,WidgetsBindingObserver{
  String url = "https://t7.baidu.com/it/u=2405382010,1555992666&fm=193&f=GIF";
  FocusNode _focus = FocusNode();
  TextEditingController _textEditingController = TextEditingController();
  bool isActivited = false;
  UntilEventBus ?_untilEventBus;

  @override
  void initState() {
    // TODO: implement initState
    print("进入chat");
    _focus.unfocus();
    WidgetsBinding.instance!.addObserver(this);


    _untilEventBus = UntilEventBus.instance;
    _untilEventBus!.demoEventBus!.on().listen((event) {
      showDialog(
          barrierDismissible:false,
          context: context, builder: (context){
        return test1();
      });
      print("事件监听：$event");
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _untilEventBus!.demoEventBus!.destroy();
    print("销毁监听");
    super.dispose();
  }



  @override
  void didChangeMetrics() {
    // TODO: implement didChangeMetrics
    WidgetsBinding.instance!.addPostFrameCallback((_) {
     if(isActivited){
       isActivited = false;
       _focus.unfocus();
     }else{
       isActivited = true;
     }
    });
    print("高度是否变化");
    super.didChangeMetrics();
  }



  @override
  Widget build(BuildContext context) {
    return ref.watch(Glob.GlobalData.loginStatue.state).state==true?Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor:Colors.white,
        elevation: 0.0,
        title: Text("聊天",style: TextStyle(color: Colors.black),),actions: [Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [FaIcon(FontAwesomeIcons.heart,color: Colors.black,),SizedBox(width: 10,)],)],),
      body: GestureDetector(
        onTap: (){
          print("点击了");
          _focus.unfocus();
        },
        child: Flex(
        direction: Axis.vertical,
        children: [
          Container(
            height: 50.h,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black38,offset: Offset(0.0,2),blurRadius: 2.0)],
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
            ),
            child:Row(
              children: [
                Expanded(child:  Container(
                  padding: EdgeInsets.all(3.h),
                  margin: EdgeInsets.all(3.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r)
                  ),
                  child: TextField(
                    focusNode: _focus,
                    controller: _textEditingController,
                    maxLines: 1,
                    decoration: InputDecoration(
                        hintText: "快速查找",
                        border: InputBorder.none,
                        suffixIcon:Column(mainAxisAlignment: MainAxisAlignment.center,children: [ CircleAvatar(
                          minRadius: 10,
                          maxRadius: 14,
                          child: Center(child: FaIcon(FontAwesomeIcons.search,size: 10,)),)],)
                    ),
                  ),
                )),

              ],
            ),),
          SizedBox(height: 5,),
          Container(
            height: 100.h,
            child:ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  if(index==0){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          maxRadius: 30,
                          minRadius: 10,
                          backgroundColor: Colors.white,
                          child: FaIcon(FontAwesomeIcons.plus),
                        ),
                        Text("添加")
                      ],
                    );
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        maxRadius: 30,
                        minRadius: 10,
                        backgroundImage: NetworkImage(url),
                      ),
                      Text("啸天")
                    ],
                  );
                }, separatorBuilder: (context,index){
              return SizedBox(width: 10,);
            }, itemCount: 10) ,
          ),
          Container(
            padding: EdgeInsets.only(top: 5.h,bottom: 7.h),
            height: 385.h,
            child:  GestureDetector(
              onTap: (){
                print("进入");
                _focus.unfocus();

              },
              child: ListView.separated(
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, "/ChatLeft",arguments: {
                          "title":"tang"
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10.w,right: 10.w),
                        constraints:BoxConstraints(
                            minHeight: 50.h,
                            maxHeight: 90.h
                        ) ,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [BoxShadow(color: Colors.black38,offset: Offset(0.0,4.0),blurRadius: 2.0)],
                            borderRadius: BorderRadius.circular(20.r)
                        ),
                        child: Row(
                          children: [
                            Expanded(flex: 7,child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 10.w,),
                                  CircleAvatar(
                                    minRadius: 15.r,
                                    maxRadius: 30.r,
                                    backgroundImage: NetworkImage(url),
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Positioned(right: 3.w,bottom: -3.h,child: CircleAvatar(
                                          radius: 10.r,
                                          child: Container(decoration: BoxDecoration(
                                              color:index ==1?Colors.greenAccent:Colors.redAccent,
                                              borderRadius: BorderRadius.circular(10.r)
                                          ),),
                                        ))
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 10.w,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Alia",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
                                      Text("你住在哪里的呢？",style: TextStyle(color: Colors.black38)),
                                    ],)
                                ],),
                            )),
                            Expanded(flex: 3,child:  Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(20.r),topRight: Radius.circular(20))
                              ), child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("12:30",style: TextStyle(color: Colors.black38,fontSize: 10.sp)),
                                SizedBox(height: 5.h,),
                                Container(
                                  padding: EdgeInsets.only(left: 5.w,right: 5.w),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: Text("12",style: TextStyle(color: Colors.white,fontSize: 12.sp),),
                                ),
                              ],
                            ),)),
                          ],
                        ),
                      ),
                    );
                  }, separatorBuilder: (context,index){
                return SizedBox(height: 10.h,);
              }, itemCount: 10),),
          ),
        ],
      ),),
    ):loginPhone();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}


Widget test1() {
  return Center(
      child: Container(
        width: 100,
        height: 100,
        color: Colors.yellow,
        child: Text("测试"),
      )
  );
}


