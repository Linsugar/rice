import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
final _selectIndex = StateProvider((ref) => 0);

class Pet extends StatefulWidget {
  const Pet({Key? key}) : super(key: key);

  @override
  _PetState createState() => _PetState();
}

class _PetState extends State<Pet> {
  String url = "https://t7.baidu.com/it/u=2405382010,1555992666&fm=193&f=GIF";
   var animale = [
     FontAwesomeIcons.dog,
     FontAwesomeIcons.horse,
     FontAwesomeIcons.frog,
     FontAwesomeIcons.cat,
     FontAwesomeIcons.crow,
     FontAwesomeIcons.fish,
     FontAwesomeIcons.piggyBank,
   ];

   Color  _selectColor = Color.fromRGBO(197,233,234, 1);
   Color  _unselectColor = Color.fromRGBO(241, 217, 205, 1);

   @override
  void initState() {
    // TODO: implement initState
     print("进入pet1111");
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    print("离开pet1111");
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text("宠物寻真",style: TextStyle(color: Colors.black),),
      actions: [
        Row(
          children: [
            FaIcon(FontAwesomeIcons.search,color: Colors.black,),
            SizedBox(width: 15,),
            FaIcon(FontAwesomeIcons.alignRight,color: Colors.black38,),
            SizedBox(width: 10,),
          ],
        )
      ],
      ),
      body: Flex(direction: Axis.vertical,
      children: [
        SizedBox(height: 5,),
        Expanded(flex: 1,child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child,){
                ref.watch(_selectIndex);
                return GestureDetector(
                  onTap: (){
                    ref.read(_selectIndex.state).state=index;
                  },
                  child: Container(
                    width: _size.width/4,
                    decoration: BoxDecoration(
                        color: ref.read(_selectIndex.state).state==index?_selectColor:_unselectColor,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FaIcon(animale[index],color: Colors.black,),
                        Text("Dogs")
                      ],
                    ),
                  ),
                );
              });
            }, separatorBuilder: (context,index){
          return SizedBox(width: 10,);
        }, itemCount: animale.length)),
        SizedBox(height: 5,),
        Expanded(flex: 12,child: RefreshIndicator(
          onRefresh: ()async{
            await Future.delayed(Duration(milliseconds: 1500));
            //结束刷新
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("更新成功")));
            return Future.value(true);
          },
          child: ListView.separated(
              itemBuilder: (context,index){
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for(int i=0;i<2;i++)
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, "/PetDetails");
                    },
                    child: Container(
                      width: _size.width/2.2,
                      constraints:BoxConstraints(
                        minHeight: 100,
                        maxHeight: 200
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.black38,offset: Offset(0.0,2.0),blurRadius: 3.0)],
                          color: Colors.white,
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
                                    Text("DutchPug",style: TextStyle(fontWeight: FontWeight.w400 ,color: Colors.blueGrey),overflow: TextOverflow.clip,maxLines: 1,),
                                    Container(
                                        padding: EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(251,237, 237, 1),
                                            borderRadius: BorderRadius.circular(5)
                                        ),child: Text("2YRS",style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.red,fontSize: 10.0),)),
                                  ],)

                              ],),
                          ))

                        ],
                      ),
                    ),
                  )
              ],
            );
          }, separatorBuilder: (context,index){
            return SizedBox(height: 10,);
          }, itemCount: 10),
        )),

      ],
      ),
    );
  }
}
