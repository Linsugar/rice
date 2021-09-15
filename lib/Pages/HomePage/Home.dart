//首页
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  List<Widget> TabList= [HomeWidget(),Text("11"),Text("222"),Text("333")];
  @override
  Widget build(BuildContext context) {
    final  _index = ref.watch(bottomIndex).state;
    print("监听到了数据：${_index}");
    // TODO: implement build
    return Scaffold(
      body:TabList[_index],
      bottomNavigationBar: BottomAppBar(
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

class _HomeWidgetState extends State<HomeWidget> {
  Color _color = Color.fromRGBO(35, 45, 64, 1);
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
              height: size.height/4,
              margin: EdgeInsets.all(10),
              child: ImageSliderDemo(size),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.black,spreadRadius:0,blurRadius: 2.0,offset:Offset(0.0, 3) )],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: MaterialButton(onPressed: (){},
                    child: Column(
                      children: [
                        FaIcon(FontAwesomeIcons.userTie),
                        Text("宠爱生态")
                      ],
                    ),
                  ),
                ),
                MaterialButton(onPressed: (){},
                  child: Column(
                    children: [
                      FaIcon(FontAwesomeIcons.userTie),
                      Text("商学院")
                    ],
                  ),
                ),
                MaterialButton(onPressed: (){},
                  child: Column(
                    children: [
                      FaIcon(FontAwesomeIcons.userTie),
                      Text("排行榜")
                    ],
                  ),
                ),
                MaterialButton(onPressed: (){},
                  child: Column(
                    children: [
                      FaIcon(FontAwesomeIcons.userTie),
                      Text("邀请好友")
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
                    color: Color.fromRGBO(61, 79, 113, 1)
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
                            Text("线上市场"),
                            Text("人数：3000人"),
                            Text("产出：1000,000"),
                          ],
                        ),
                      ),
                      Positioned(top: 10,right: 10,child: Anima())
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
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.deepOrange,Colors.red]
                ),
                ),
                child: Text("new",style: TextStyle(color: Colors.black,fontSize: 10)),)
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
                      Text("未开始")
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
                            Text("活动名称：***"),
                            Text("雇佣期数：第***期"),
                            Text("雇佣数量：1~1000 米币"),
                            Text("开始时间：09-12 11:11:30"),
                            SizedBox(height: 20,)
                          ],
                        ),)),

                    ],
                  ),)),
                  Expanded(flex: 2,child: Container(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(" 距开始还有:"),
                          Text("14:55:40",style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.w900),),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10,bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
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
  const Anima({Key? key}) : super(key: key);
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
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(img)),
             borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white38),
            boxShadow: [BoxShadow(color:Colors.white38,spreadRadius:animation!.value)]
          ),
        );
      },);
  }
}
