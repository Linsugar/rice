//市场页
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Mark extends StatefulWidget {
  const Mark({Key? key}) : super(key: key);

  @override
  _MarkState createState() => _MarkState();
}

class _MarkState extends State<Mark> with SingleTickerProviderStateMixin{
  Color _color = Color.fromRGBO(35, 45, 64, 1);
  Color _tabColor= Color.fromRGBO(50, 65 , 98, 1);
  TabController ?_tabController;
  List<Widget> _Tablist = [
    Text("线上市场"),
    Text("线下市场"),
    Text("BPO市场"),
    Text("RPO市场"),
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
      backgroundColor: _color,
      appBar: AppBar(title: Text("市场"),backgroundColor: _color,
        bottom:
        TabBar(
          labelStyle: (TextStyle(height: 3,)),
            controller: _tabController,tabs: _Tablist),),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView(
            padding: EdgeInsets.all(10),
            children: [
              TabWidget(_size, _tabColor)
            ],
          ),
          ListView(
            padding: EdgeInsets.all(10),
            children: [
              TabWidget(_size, _tabColor)
            ],
          ),
          ListView(
            padding: EdgeInsets.all(10),
            children: [
              TabWidget(_size, _tabColor)
            ],
          ),
          ListView(
            padding: EdgeInsets.all(10),
            children: [
              TabWidget(_size, _tabColor)
            ],
          ),
        ],
      ),
    );
  }
}


Widget TabWidget(Size _size,Color _tabColor){
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: _tabColor,
        boxShadow: [BoxShadow(color: Colors.black,spreadRadius: 0.2)]
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