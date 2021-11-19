//雇佣页面
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rice/Untils/Eventbus.dart';
class Hire extends StatefulWidget {
  const Hire({Key? key}) : super(key: key);

  @override
  _HireState createState() => _HireState();
}

class _HireState extends State<Hire> {
  Color _color = Color.fromRGBO(35, 45, 64, 1);
  UntilEventBus _untilEventBus = UntilEventBus.instance;
@override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: _color,
      appBar: AppBar(title: Text("雇佣"),backgroundColor: _color,),
      body: Container(
        width: _size.width,
        height: _size.height,
        child: ListView(
          children: [
           for(int i=0;i<10;i++)
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
                         radius: _size.width/6,
                         backgroundColor: Colors.lightBlue,
                         child:CircleAvatar(
                           radius: _size.width/8,
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
                           child: MaterialButton(onPressed: (){
                             _untilEventBus.demoEventBus!.fire("2222");
                           },child: Text("参与雇佣"),),
                         )
                       ],
                     ),)),
                 ],
               ),

             )
          ],
        ),
      ),
    );
  }
}
