import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeChild extends StatefulWidget {
  var title;
  HomeChild(this.title,{Key? key}) : super(key: key);

  @override
  _HomeChildState createState() => _HomeChildState();
}

class _HomeChildState extends State<HomeChild>with SingleTickerProviderStateMixin{
  TabController ?_tabController;
  Color _color = Color.fromRGBO(35, 45, 64, 1);
  List<dynamic> _list = [
    [Text("新人必学"),Text("发圈素材")],
    [Text("团队排行"),Text("雇主排行")],
  ];

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: widget.title['title'],
        backgroundColor:_color,
        bottom: widget.title['index']==0?null:widget.title['index']==3?null:TabBar(
          labelStyle: TextStyle(fontSize: 17,height: 3),
          controller: _tabController,
          tabs:_list[widget.title['index']-1],
        ),
      ),
      body: widget.title['index']==0?Container(
        color: _color,
        padding: EdgeInsets.all(10),
        child: child1(size),
      ):widget.title['index']==3?inviteFriend():TabBarView(
        controller: _tabController,
          children: [
            Container(
              color: _color,
              child: child2(size),
            ),
            Container(
              color: _color,
              child: child2(size),
            ),
      ]),
    );
  }
}

Widget child2(Size size){
  return ListView.separated(itemBuilder: (context,index){
    return Container(
      height:size.height/5,
      child: TabWidget2(size)
    );
  }, separatorBuilder: (context,index){
    return Container(padding: EdgeInsets.only(left: 10,right: 10),child: Divider(color: Colors.white,));
  }, itemCount: 10);
}


//宠爱生态
Widget child1(Size size){
  return Flex(
    direction: Axis.vertical,
    children: [
      Expanded(flex: 3,child: ImageSliderDemo(size)),
      Expanded(flex: 7,child: ListView(
        children: [
          for(int i=0;i<10;i++)
          TabWidget(size,)
        ],
      )),
    ],
  );
}

class ImageSliderDemo extends StatelessWidget {
  var imgList = ["https://t7.baidu.com/it/u=3527521835,3789150700&fm=193&f=GIF","https://t7.baidu.com/it/u=2656393769,4001912254&fm=193&f=GIF"];
  Size size;
  ImageSliderDemo(this.size);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CarouselSlider(
        options: CarouselOptions(
            height: size.height,
            autoPlay: true,
            aspectRatio: 1,
            viewportFraction: 1.0
        ),
        items: imgList
            .map((item) => Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(item),
                  fit: BoxFit.cover
              )
          ),
        ),
        ).toList(),
      ),
    );
  }
}

Widget TabWidget(Size size){
  Color _tabColor= Color.fromRGBO(50, 65 , 98, 1);
  return Container(
    margin: EdgeInsets.only(bottom: 10,top: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: _tabColor,
        boxShadow: [BoxShadow(color: Colors.black,spreadRadius: 0.2)]
    ),
    height: size.height/6,
    width: size.width,
    child: Row(
      children: [
        Expanded(flex: 3,child: Container(decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/tab1.png")
            )
        ),)),
        Expanded(flex: 5,child: Container(
          padding: EdgeInsets.only(left: 10), child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("口碑生活",style: TextStyle(color: Colors.white70,fontSize: 18),),
            SizedBox(height: 10,),
            Text("本地生活服务平台",style: TextStyle(color: Color.fromRGBO(111, 137, 179, 1))),
          ],
        ),)),
        Expanded(flex:3,child: Container(child: RichText(
          text: TextSpan(
              children: [
                TextSpan(text: "参与:",style: TextStyle(color: Color.fromRGBO(111, 137, 179, 1))),
                TextSpan(text: " 3000人",style: TextStyle(color: Color.fromRGBO(146, 171, 214, 1))),
              ]
          ),
        ),)),
      ],
    ),
  );
}

Widget TabWidget2(Size size){
  Color _tabColor= Color.fromRGBO(50, 65 , 98, 1);
  return Container(
    margin: EdgeInsets.only(bottom: 10,top: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: _tabColor,
        boxShadow: [BoxShadow(color: Colors.black,spreadRadius: 0.2)]
    ),
    height: size.height/6,
    width: size.width,
    child: Row(
      children: [
        Expanded(flex: 3,child: Container(decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/tab1.png")
            )
        ),)),
        Expanded(flex:7,child: Container(
          padding: EdgeInsets.only(left: 10), child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("关于宠物发情如何解决",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white70,fontSize: 18,),),
            SizedBox(height: 10,),
            Text("2019-12-30 11:30:00",style: TextStyle(color: Color.fromRGBO(111, 137, 179, 1))),
          ],
        ),)),
      ],
    ),
  );
}


Widget inviteFriend(){
  return Container(
    child: Text("邀请好友"),
  );
}