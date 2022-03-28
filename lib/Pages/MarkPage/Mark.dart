//论坛页
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rice/Network/requests.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rice/Pages/LaunchPage/Launch.dart';
import 'package:rice/ProviderData/GlobData.dart';
import 'MarkModel/MarkModel.dart';


final FutureProvider<List> futureMarKProvider = FutureProvider((ref) async {
  List <MarkModel>MarkList = [];
  /// 延时3s
      var InfoValue = ref.read(GlobalData.LoginResult.state).state;
      if(InfoValue==null){
      }else{
        if (MarkList.isEmpty){
          var res = await Request.getNetwork("UserCenter/weixin",token:InfoValue.Token);
          var item = res["Result"]["item"];
          print("得到的数据：$item");
          for (var i=0;i<res["Result"]["item_count"];i++){
            MarkList.add(MarkModel(item[i]));
          }
        }
      }
  return MarkList;
});

class Mark extends ConsumerStatefulWidget {
  const Mark({Key? key}) : super(key: key);

  @override
  _MarkState createState() => _MarkState();
}

class _MarkState extends ConsumerState<Mark> with SingleTickerProviderStateMixin{
  Color _color = Colors.white;
  TabController ?_tabController;
  List<Widget> _Tablist = [
    Text("宠物论坛"),
    Text("猫咪科普"),
    Text("狗狗科普"),
    Text("训宠篇"),
  ];
  @override
  void initState() {
    // TODO: implement initState
    print("异步获取微信文章");
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("论坛",style: TextStyle(color: Colors.black,fontSize: 25.sp),),
        backgroundColor: _color,
        bottom: TabBar(
          padding: EdgeInsets.only(bottom:7),
          labelStyle: (TextStyle(height: 3,color: Colors.red,fontSize: 14.sp)),
            unselectedLabelColor: Colors.black,
            labelColor: Colors.blue,
            controller: _tabController,tabs: _Tablist),),
      body: TabBarView(
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          ListView(
            padding: EdgeInsets.all(10),
            children: [
              TabWidget(_size)
            ],
          ),
          ListView(
            padding: EdgeInsets.all(10),
            children: [
              TabWidget(_size)
            ],
          ),
          ListView(
            padding: EdgeInsets.all(10),
            children: [
              TabWidget(_size)
            ],
          ),
          ListView(

            padding: EdgeInsets.all(10),
            children: [
              TabWidget(_size)
            ],
          ),
        ],
      ),
    );
  }
}


Widget TabWidget(Size _size){
  String image = "https://th.bing.com/th/id/OIP.FWsOdi7XQjvqMTdioSxgvgHaHa?pid=ImgDet&rs=1";
  return Consumer(
    builder: (BuildContext context, WidgetRef ref, Widget? child) {
      AsyncValue<List> value = ref.watch(futureMarKProvider);
      print("value:$value");
      return value.when(data: (valueList)=>Container(
        height: 465.h,
        child: ListView.separated(itemBuilder: (BuildContext context, int index){
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.blue,
                boxShadow: [BoxShadow(color: Colors.black45,blurRadius: 3.0,offset: Offset(0.0,2.0))]
            ),
            height: 130.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(flex: 3,child: Container(decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(valueList.isEmpty?image:valueList[index].thumb_url),
                        fit: BoxFit.cover
                    )
                ),)),
                Expanded(flex: 5,child: Container(
                  padding: EdgeInsets.only(left: 10), child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(valueList.isEmpty?"口碑生活":valueList[index].title,style: TextStyle(fontSize: 18),maxLines: 2,),
                    SizedBox(height: 10,),
                    Text(valueList.isEmpty?"本地生活服务平台":valueList[index].digest,maxLines: 2,style: TextStyle(overflow: TextOverflow.ellipsis),),
                  ],
                ),)),
                SizedBox(width: 15.w,),
                Expanded(flex:2,child: Container(child: RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(text: "查阅",recognizer: TapGestureRecognizer()..onTap=(){
                          print("点击查询");
                          Navigator.pushNamed(context, "/MarkWeb",arguments: valueList[index].url);
                        }),
                      ]
                  ),
                ),)),
              ],
            ),
          );
        }, separatorBuilder: (BuildContext context, int index){
          return Divider();
        }, itemCount:valueList.isEmpty?1:valueList.length),
      ), error: (err,stc)=>Center(child: Text("加载...")), loading: ()=>Center(child: CircularProgressIndicator(),));
    },
  );
}




