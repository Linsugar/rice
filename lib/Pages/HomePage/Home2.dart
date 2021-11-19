import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final _selectIndex = StateProvider((ref) => 0);
class Home2 extends StatefulWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {

  Color _color = Color.fromRGBO(249, 249, 249, 1);
  Color _cityColor= Color.fromRGBO(216, 72, 72, 1);
  String url = "https://t7.baidu.com/it/u=2405382010,1555992666&fm=193&f=GIF";
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
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
                print("object");
                Scaffold.of(context).openDrawer();
              },child: FaIcon(FontAwesomeIcons.alignJustify));
            })
          ],
        ),
        title: Row(
          children: [
            SizedBox(width: 30,),
            FaIcon(FontAwesomeIcons.mapMarkerAlt,color: _cityColor,size: 16,),
            SizedBox(width: 10,),
            Text("成都"),
            SizedBox(width: 5,),
            Text("TomBob"),
          ],
        ),
        actions: [
          SizedBox(width: 10,),
          CircleAvatar(
            backgroundImage: NetworkImage(url),
          ),
          SizedBox(width: 10,)
        ],
      ) ,
      drawer: Container(
        height: double.maxFinite,
        width: 100,
        color: Colors.brown,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10,right: 10),
        child: Flex(
          direction: Axis.vertical,children: [
          Expanded(flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("选择您心仪的伙伴"),
                Row(
                  children: [
                    Expanded(child: Container(decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black12,width: 1.0),
                    ),child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(FontAwesomeIcons.search,color: Colors.black12,size: 12,)
                            ],
                          ),
                          hintText: "请尽情的搜索吧",
                          border: InputBorder.none
                      ),
                    ))),
                    SizedBox(width: 30,),
                    SizedBox(child: Text("搜索"),),
                    SizedBox(width: 30,),
                  ],
                )
              ],
            ),
          ),
          Expanded(flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("宠物种类"),
                Container(
                    height: 50,
                    child:ListView.separated(

                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                          return Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child,){
                            ref.watch(_selectIndex);
                            return GestureDetector(
                              onTap: (){
                                ref.read(_selectIndex.state).state=index;
                              },
                              child: Container(
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: ref.read(_selectIndex.state).state==index?Colors.red:Colors.white,
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    CircleAvatar(backgroundImage: NetworkImage(url),),
                                    Text("Dogs")
                                  ],
                                ),
                              ),
                            );
                          });
                        }, separatorBuilder: (context,index){
                      return SizedBox(width: 10,);
                    }, itemCount: 20)
                )
              ],
            ),
          ),
          Expanded(flex:5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  // padding: EdgeInsets.only(top: 10),
                  width: _size.width/2.3,
                  height: _size.width/2,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Column(
                    children: [
                      Expanded(flex: 9,child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(image: NetworkImage(url),fit: BoxFit.cover)),),
                          Positioned(
                              top: 10,
                              right: 10,
                              child: GestureDetector(
                                onTap: (){
                                  print("点播关注");
                                },
                                child: CircleAvatar(
                                  backgroundColor: Colors.deepPurple,
                                  radius: 12,
                                  child: FaIcon(FontAwesomeIcons.heartbeat,size: 12,color: Colors.white,),),
                              ))
                        ],
                      )),
                      Expanded(flex: 3,child: Container(
                        padding: EdgeInsets.only(left: 5,right: 5),
                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Franklin",style: TextStyle(fontWeight: FontWeight.bold ),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("DutchPug",style: TextStyle(fontWeight: FontWeight.w400 ,color: Colors.blueGrey),),
                                Container(
                                    padding: EdgeInsets.all(2),

                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(251,237, 237, 1),

                                        borderRadius: BorderRadius.circular(10)
                                    ),child: Text("2YRS",style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.red),)),
                              ],)

                          ],),
                      ))

                    ],
                  ),
                ),
                Container(
                  // padding: EdgeInsets.only(top: 10),
                  width: _size.width/2.3,
                  height: _size.width/2,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Column(
                    children: [
                      Expanded(flex: 9,child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(image: NetworkImage(url),fit: BoxFit.cover)),),
                          Positioned(
                              top: 10,
                              right: 10,
                              child: CircleAvatar(
                                radius: 12,
                                child: FaIcon(FontAwesomeIcons.heart,size: 12,),))
                        ],
                      )),
                      Expanded(flex: 3,child: Container(
                        padding: EdgeInsets.only(left: 5,right: 5),
                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Franklin",style: TextStyle(fontWeight: FontWeight.bold ),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("DutchPug",style: TextStyle(fontWeight: FontWeight.w400 ,color: Colors.blueGrey),),
                                Container(
                                    padding: EdgeInsets.all(2),

                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(251,237, 237, 1),

                                        borderRadius: BorderRadius.circular(10)
                                    ),child: Text("2YRS",style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.red),)),
                              ],)

                          ],),
                      ))

                    ],
                  ),
                ),

              ],
            ),
          ),
          Expanded(flex: 6,
            child: GestureDetector(
              onPanUpdate: (value){
                print("滑动:${value.delta.dx}");

              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Text("Newest pets",style: TextStyle(fontWeight: FontWeight.bold ),),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey,
                    ),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Expanded(child: Container(
                              height: _size.height/4,
                              width: _size.width/4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: NetworkImage(url)
                                  )
                              ),)),
                            SizedBox(width: 10,),
                            Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Beethoven",style: TextStyle(fontWeight: FontWeight.bold ),),
                                SizedBox(height: 5,),
                                Text("Nova Soctia Duck Toll.....",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold ),),
                                SizedBox(height: 5,),
                                Container(
                                    padding: EdgeInsets.all(2),

                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(251,237, 237, 1),

                                        borderRadius: BorderRadius.circular(10)
                                    ),child: Text("2YRS",style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.red),)),
                              ],))
                          ],
                        ),
                        Positioned(
                            top: 10,
                            right: 10,
                            child: GestureDetector(
                              onTap: (){
                                print("点播关注");
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.deepPurple,
                                radius: 12,
                                child: FaIcon(FontAwesomeIcons.heartbeat,size: 12,color: Colors.white,),),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],),
      ),
    );
  }
}
