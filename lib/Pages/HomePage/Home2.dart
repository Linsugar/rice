import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rice/Pages/LaunchPage/Launch.dart';
import 'dart:math';

import 'package:rice/ProviderData/GlobData.dart';

class Home2 extends ConsumerStatefulWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends ConsumerState<Home2> {

  Color _color = Color.fromRGBO(252, 252, 252, 1);
  Color _cityColor= Color.fromRGBO(213, 71, 70, 1);
  String url = "https://t7.baidu.com/it/u=2405382010,1555992666&fm=193&f=GIF";

  int _result = 5;



  List<Map<String,dynamic>> item = [
    {
      "id":0,
      "content":"Beetwnss",
      "details":"我是测试1"
    },
    {
      "id":0,
      "content":"Beetwnss",
      "details":"我是测试1"
    },
    {
      "id":0,
      "content":"Beetwnss",
      "details":"我是测试1"
    },
    {
      "id":0,
      "content":"Beetwnss",
      "details":"我是测试1"
    },
    {
      "id":0,
      "content":"Beetwnss",
      "details":"我是测试1"
    },
    {
      "id":0,
      "content":"Beetwnss",
      "details":"我是测试1"
    },
  ];

@override
  void initState() {
    // TODO: implement initState
     _result = 5 + Random().nextInt(45 - 5);
    print("随机数结果:$_result");

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    var InfoValue = ref.read(GlobalData.LoginResult.state).state;
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white10,
      resizeToAvoidBottomInset: false,
      appBar:AppBar(
        foregroundColor: Colors.black,
        backgroundColor: _color,
        elevation: 0.0,
        leading:Row(
          children: [
            SizedBox(width: 10,),
            Builder(builder: (context){
              return  GestureDetector(onTap: (){
                Scaffold.of(context).openDrawer();
              },child: FaIcon(FontAwesomeIcons.alignJustify));
            })
          ],
        ),
        title: Row(
          children: [
            SizedBox(width: 30.w,),
            FaIcon(FontAwesomeIcons.mapMarkerAlt,color: _cityColor,size: 16.sp,),
            SizedBox(width: 10.w,),
            // Text("成都"),
            Text(InfoValue==null?"成都":InfoValue.create_city,style: TextStyle(fontSize: 14.sp),),
            SizedBox(width: 5.w,),
            Text(InfoValue==null?"小灰狼":InfoValue.username,style: TextStyle(fontSize: 16.sp),),
          ],
        ),
        actions: [
          CircleAvatar(
            radius: 18.r,
            backgroundImage: NetworkImage(InfoValue==null?url:InfoValue.profilePicture),
          ),
          SizedBox(width: 20.w,)
        ],
      ) ,
      drawer: DrawWidget(context),
      body: Padding(
        padding: EdgeInsets.all(5.w),
        child: Flex(
          crossAxisAlignment: CrossAxisAlignment.start,
          direction: Axis.vertical,children: [
            SizedBox(height: 10.h,),
            Expanded(flex: 6,child: Stack(
            clipBehavior: Clip.none,
            children:[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [BoxShadow(color: Colors.black12,offset: Offset(0.0,3.0),blurRadius: 2.0)]
              ),
              child: Row(
              children: [
                Expanded(flex: 4,child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/pet.png"),
                          fit: BoxFit.contain
                      )
                  ),
                )),
                Expanded(flex: 6,child:Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Milo is Waiting",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp),),
                      Text("for the next walk",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp),),
                      SizedBox(height: 10.h,),
                      LinearProgressIndicator(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("1 Walk",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp),),
                              Text("left",style: TextStyle(color: Colors.blue,fontSize: 16.sp),),
                            ],
                          ),
                          MaterialButton(
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                            ///按钮点击下的颜色
                            highlightColor:Colors.deepPurple,
                            ///按钮的阴影
                            elevation: 2,
                            onPressed: (){
                              ShowWidget(context,_result);
                            },child: Text("签到",style: TextStyle(color: Colors.white,fontSize: 20.sp),),)
                        ],
                      )

                    ],
                  ),
                )),
              ],
            ),),
            Positioned(top: -10,left: _size.width/6,child: FaIcon(FontAwesomeIcons.heartbeat,color: Colors.red,))
            ],
          )),
            SizedBox(height: 10,),
            Expanded(flex: 6,child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for(int i=0;i<2;i++)
                  Container(
                    width: _size.width/2.2,
                    constraints:BoxConstraints(
                        minHeight: 100,
                        maxHeight: 200
                    ),
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.black38,offset: Offset(0.0,2.0),blurRadius: 3.0)],
                        color: Colors.blue[500],
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FaIcon(FontAwesomeIcons.cat,color: Colors.white,size: 40,),
                          SizedBox(height: 10,),
                          Text("给小猫换新猫粮",style: TextStyle(color: Colors.black38),)
                        ],
                      ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                          Text("10:15",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:30)),
                            Positioned(right: -23,child: Text("pm",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:15)))
                        ],)

                      ],
                    ),
                  )
              ],
            )),
           SizedBox(height: 5,),
            Expanded(flex: 1,child: Text("推荐",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),),
            Expanded(flex: 4,child:ListView.builder(scrollDirection: Axis.vertical,itemCount: item.length,itemBuilder: (context,index){
              return  Dismissible(
                key: UniqueKey(),
                onDismissed: (DismissDirection direction){
                  String ?title;
                  if(direction == DismissDirection.endToStart){
                    title = "成功删除";
                  }else if(direction == DismissDirection.startToEnd){
                    title = "已收藏到列表";
                  }
                  setState(() {
                    item.remove(item[index]);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title!),duration: Duration(milliseconds: 300),backgroundColor: Colors.amberAccent,));
                },
                secondaryBackground: Container(child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [FaIcon(FontAwesomeIcons.trashAlt,color: Colors.blue,),SizedBox(width: 30,)],),),
                background:Container(child:  Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [SizedBox(width: 30,),FaIcon(FontAwesomeIcons.box,color: Colors.redAccent,)],),),
                child: Container(
                  key: ValueKey(item[index]['id']),
                  height: MediaQuery.of(context).size.height/4-10,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Expanded(flex: 4,child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: NetworkImage(url),fit: BoxFit.cover
                                )
                            ),)),
                          SizedBox(width: 5,),
                          Expanded(flex: 6,child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Beethoven",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 18),),
                              SizedBox(height: 5,),
                              Text("Nova Soctia Duck Toll.....",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.blueGrey),),
                              SizedBox(height: 5,),
                              Container(
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(251,237, 237, 1),
                                      borderRadius: BorderRadius.circular(10)
                                  ),child: Text("2YRS",style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.red),)),
                            ],)),
                        ],
                      ),
                      Positioned(
                          top: 10,
                          right: 10,
                          child: GestureDetector(
                            onTap: (){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                duration: Duration(milliseconds: 400),
                                backgroundColor: Colors.blue,
                                  content: Text("已关注")));

                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.deepPurple,
                              radius: 12,
                              child: FaIcon(FontAwesomeIcons.heartbeat,size: 12,color: Colors.white,),),
                          ))
                    ],
                  ),
                ),
              );
            })),
        ],),
      ),
    );
  }
}



//弹窗积分
ShowWidget(context,randResult){
  showDialog(context: context, builder: (context){
    return Dialog(
   backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10)
        ),
        child:Column(
          children: [
            Container(width: MediaQuery.of(context).size.width/3,height: MediaQuery.of(context).size.width/3,decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/box.png"),
                    fit: BoxFit.cover
                )
            ),),
            Text("获得$randResult积分",style:TextStyle(color: Colors.white,letterSpacing: 1.0)),
            MaterialButton(color: Colors.yellow,onPressed: (){
              Navigator.pop(context);
            },child: Text("立即领取",style:TextStyle(color: Colors.white),),)
          ],
        ),
        height: MediaQuery.of(context).size.height/3,
      ),
    );
  });
}


DrawWidget(context){
  String url = "https://t7.baidu.com/it/u=2405382010,1555992666&fm=193&f=GIF";
  return Container(
    color: Colors.white,
    width: MediaQuery.of(context).size.width/2,
    child:ListView(
      children: [
        Row(children: [Expanded(
          child: DrawerHeader(child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(top: -15,left:-10,child: Text("星期五",)),
              Positioned(top: -15,right:-10,child:FaIcon(FontAwesomeIcons.cloudSunRain,)),

            ],
          ),decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(url),
                  fit: BoxFit.cover
              )
          ),),
        ),],),
        ListTile(
          leading: FaIcon(FontAwesomeIcons.cloudSunRain),
          title: Text("是否可搜索"),
          onTap: (){},
        ),
        ListTile(
          leading: FaIcon(FontAwesomeIcons.cloudSunRain),
          title: Text("关闭定位"),
          onTap: (){},
        ),
        ListTile(
          leading: FaIcon(FontAwesomeIcons.cloudSunRain),
          title: Text("相册集"),
          onTap: (){},
        ),
        ListTile(
          leading: FaIcon(FontAwesomeIcons.cloudSunRain),
          title: Text("守护模式"),
          onTap: (){},
        ),
      ],
    ),
  );
}



