//首页
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../MinePage/Mine.dart';
import '../HirePage/Hire.dart';
import '../MarkPage/Mark.dart';
final StateProvider<int> bottomIndex = StateProvider((ref) => 0);

class Home extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }

}

class HomeState extends ConsumerState<Home>{
  Color color1 = Color.fromRGBO(34, 45, 64, 1);
  List<Widget> TabList= [HomeWidget(),Hire(),Mark(),Mine()];
  @override
  Widget build(BuildContext context) {
    final  _index = ref.watch(bottomIndex).state;
    print("监听到了数据：${_index}");
    // TODO: implement build
    return Scaffold(
      body:IndexedStack(
        index: _index,
        children: TabList,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromRGBO(41, 55, 78, 1),
        child:SizedBox(
          height: 50,
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(onPressed: (){
                ref.read(bottomIndex).state=0;
              },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(FontAwesomeIcons.home,color: _index==0?Colors.blue:Colors.black,),
                    Text("首页")
                  ],
                ),
              ),
              MaterialButton(onPressed: (){
                print("是否点击");
                ref.read(bottomIndex).state=1;
              },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(FontAwesomeIcons.userShield,color: _index==1?Colors.blue:Colors.black,),
                    Text("雇佣")
                  ],
                ),
              ),
              MaterialButton(onPressed: (){
                ref.read(bottomIndex).state=2;
              },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(FontAwesomeIcons.mapMarked,color: _index==2?Colors.blue:Colors.black),
                    Text("市场")
                  ],
                ),
              ),
              MaterialButton(onPressed: (){
                ref.read(bottomIndex).state=3;
              },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(FontAwesomeIcons.userTie,color: _index==3?Colors.blue:Colors.black),
                    Text("我的")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}



//首页UI
class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with AutomaticKeepAliveClientMixin{
  Color _color = Color.fromRGBO(35, 45, 64, 1);
  List<dynamic> _listStore = [
    ["线上市场",3000,1000.00,FaIcon(FontAwesomeIcons.home,color: Colors.white,)],
    ["线下市场",3000,1000.00,FaIcon(FontAwesomeIcons.home,color: Colors.white,)],
    ["BPO市场",3000,1000.00,Text("BPO",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)],
    ["RPO市场",3000,1000.00,Text("RPO",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))],
  ];
  List<dynamic> _listTab = [
    [Text("宠爱生态", style: TextStyle(color: Colors.white),),"assets/images/tab1.png","/homeChild"],
    [Text("宠学院", style: TextStyle(color: Colors.white),),"assets/images/tab1.png","/homeChild"],
    [Text("排行榜", style: TextStyle(color: Colors.white),),"assets/images/tab1.png","/homeChild"],
    [Text("邀请好友", style: TextStyle(color: Colors.white),),"assets/images/tab1.png","/homeChild"],
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(title: Text("宠爱"), backgroundColor:_color, actions: [MaterialButton(onPressed: (){}, child: FaIcon(FontAwesomeIcons.bell,color: Colors.white,)),],),
        body: Container(
          width:size.width,
          height:size.height,
          color: _color,
          child: ListView(children: [
            Container(
              width: size.width,
              height: size.height/5,
              margin: EdgeInsets.all(10),
              child: ImageSliderDemo(size),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.black,blurRadius: 1.0,offset:Offset(0.0, 0.5) )],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for(var i=0;i<4;i++)
                MaterialButton(onPressed: (){
                  Navigator.pushNamed(context, _listTab[i][2],arguments: {"title": _listTab[i][0],"index":i});
                },
                  child: Column(
                    children: [
                      Container(
                        width: size.width/7,
                        height: size.width/7,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:AssetImage(_listTab[i][1])
                            )
                        ),
                      ),
                      _listTab[i][0]
                    ],
                  ),
                ),

              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: size.width,
              height: 260,
              child: GridView.builder(
                physics:NeverScrollableScrollPhysics() ,
                  itemCount: 4,
                  gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 130,
                    childAspectRatio: 2,
                      crossAxisCount: 2) , itemBuilder: (context,index){
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(60, 70, 109, 1)
                  ),
                  margin: EdgeInsets.all(5),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${_listStore[index][0]}",style: TextStyle(color: Color.fromRGBO(215, 232, 245, 1)),),
                            SizedBox(height: 10,),
                            RichText(text: TextSpan(text: "人数：",style: TextStyle(color: Color.fromRGBO(79, 100, 133, 1)),children: [
                              TextSpan(text: "${_listStore[index][1]}",style: TextStyle(
                                letterSpacing: 1.5,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15,
                                  color: Color.fromRGBO(145, 170, 213, 1))),
                              TextSpan(text: "人",style: TextStyle(color: Color.fromRGBO(145, 170, 213, 1)))
                            ]),),
                            RichText(text: TextSpan(text: "产出：",style: TextStyle(color: Color.fromRGBO(79, 100, 133, 1)),children: [
                              TextSpan(text: "${_listStore[index][2]}",style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15,
                                  color: Color.fromRGBO(145, 170, 213, 1))),
                              TextSpan(text: "米币",style: TextStyle(color: Color.fromRGBO(145, 170, 213, 1)))
                            ]),),
                            SizedBox(height: 10,),
                          ],
                        ),
                      ),
                      Positioned(top: 10,right: 10,child: Anima(_listStore[index][3]))
                    ],
                  ),
                );
              }),
            ),
            Container(margin: EdgeInsets.only(left: 10),child:Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Text("最新雇佣",style: TextStyle(color: Colors.white),),
              Container(
                margin: EdgeInsets.only(left: 5),
                padding:EdgeInsets.all(1) ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  gradient: LinearGradient(
                    stops: [0.1,0.8],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.orangeAccent,Colors.red]
                ),
                ),
                child: Text("new",style: TextStyle(
                    color: Colors.black,fontSize: 10)),)
            ],)),
            Container(
              height: 230,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromRGBO(60, 70, 109, 1),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: [
                  Expanded(flex: 2,child: Container(
                    padding: EdgeInsets.only(left: 10,right: 10), child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          FaIcon(FontAwesomeIcons.clock,color: Colors.lightBlue,),
                          SizedBox(width: 10,),
                          Text("11点场",style: TextStyle(color: Colors.white),)
                        ],
                      ),
                      Text("未开始",style: TextStyle(color: Color.fromRGBO(199, 148, 70, 1)),)
                    ],
                  ),)),
                  Expanded(flex: 6,child: Container(child: Row(
                    children: [
                      Expanded(flex: 4,child: CircleAvatar(
                        radius: size.width/6,
                        backgroundColor: Colors.lightBlue,
                        child:CircleAvatar(
                          radius: size.width/8,
                          backgroundColor:_color,
                          child: Text("0%"),
                        ),
                      )),
                      Expanded(flex:6,child: Container(
                        child:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(text: TextSpan(text: "活动名称：",style: TextStyle(color: Color.fromRGBO(79, 100, 133, 1)),children: [
                              TextSpan(text: "****",style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15,
                                  color: Color.fromRGBO(145, 170, 213, 1))),
                            ]),),
                            RichText(text: TextSpan(text: "雇佣期数：",style: TextStyle(color: Color.fromRGBO(79, 100, 133, 1)),children: [
                              TextSpan(text: "第****期",style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15,
                                  color: Color.fromRGBO(145, 170, 213, 1))),
                            ]),),
                            RichText(text: TextSpan(text: "雇佣数量：",style: TextStyle(color: Color.fromRGBO(79, 100, 133, 1)),children: [
                              TextSpan(text: "1~1000 米币",style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15,
                                  color: Color.fromRGBO(145, 170, 213, 1))),
                            ]),),
                            RichText(text: TextSpan(text: "开始时间：",style: TextStyle(color: Color.fromRGBO(79, 100, 133, 1)),children: [
                              TextSpan(text: "09-16 11:00:00",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.lightBlueAccent,)),
                            ]),),
                            SizedBox(height: 20,)
                          ],
                        ),)),

                    ],
                  ),)),
                  Expanded(flex: 2,child: Container(
                    margin: EdgeInsets.only(left: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(" 距开始还有:",style: TextStyle(color: Color.fromRGBO(79, 100, 133, 1)),),
                          SizedBox(height: 5,),
                          Text("14:55:40",style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.w900),),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10,bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            stops: [0.4,0.8],
                            colors: [Colors.lightBlueAccent,Colors.blue]
                          )
                        ),
                        child: MaterialButton(onPressed: (){},child: Text("参与雇佣"),),
                      )
                    ],
                  ),)),
                ],
              ),

            )
          ],),));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
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

class Anima extends StatefulWidget {
  Widget newWidget = FaIcon(FontAwesomeIcons.home,color: Colors.white,);
  Anima(this.newWidget,{Key? key}) : super(key: key);

  @override
  _AnimaState createState() => _AnimaState();
}

class _AnimaState extends State<Anima> with SingleTickerProviderStateMixin{
  AnimationController ?_animationController;
  Animation<double> ?animation;
  String img = "https://t7.baidu.com/it/u=3527521835,3789150700&fm=193&f=GIF";

  @override
  void initState() {
    // TODO: implement initState
    _animationController =AnimationController(duration: Duration(milliseconds: 3000),vsync: this);
    animation = Tween(begin: 0.0,end: 5.0).animate(_animationController!);
    _animationController!.repeat(reverse: true);
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _animationController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation!,
      builder: (BuildContext context, Widget? child){
        return  Container(
          width: 40,
          height:40,
          child: Center(child: this.widget.newWidget,),
          decoration: BoxDecoration(
            color: Color.fromRGBO(28, 171, 234, 1),
             borderRadius: BorderRadius.circular(40),
            border: Border.all(color: Colors.white38),
            boxShadow: [BoxShadow(color:Colors.white38,spreadRadius:animation!.value)]
          ),
        );
      },);
  }
}
