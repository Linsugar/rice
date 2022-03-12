//论坛页
import 'package:flutter/material.dart';

class Mark extends StatefulWidget {
  const Mark({Key? key}) : super(key: key);

  @override
  _MarkState createState() => _MarkState();
}

class _MarkState extends State<Mark> with SingleTickerProviderStateMixin{
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
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("论坛",style: TextStyle(color: Colors.black),),backgroundColor: _color,
        bottom: TabBar(
          padding: EdgeInsets.only(bottom:10),
          labelStyle: (TextStyle(height: 3,color: Colors.red)),
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
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.blue,
        boxShadow: [BoxShadow(color: Colors.black45,blurRadius: 3.0,offset: Offset(0.0,2.0))]
    ),
    height: _size.height/6,
    width: _size.width,
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
            Text("口碑生活",style: TextStyle(fontSize: 18),),
            SizedBox(height: 10,),
            Text("本地生活服务平台",style: TextStyle()),
          ],
        ),)),
        Expanded(flex:3,child: Container(child: RichText(
          text: TextSpan(
              children: [
                TextSpan(text: "参与:",style: TextStyle()),
                TextSpan(text: " 3000人",style: TextStyle()),
              ]
          ),
        ),)),
      ],
    ),
  );
}