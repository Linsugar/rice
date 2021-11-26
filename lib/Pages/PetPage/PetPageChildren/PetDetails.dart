import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PetDetails extends StatefulWidget {

  @override
  _PetDetailsState createState() => _PetDetailsState();
}

class _PetDetailsState extends State<PetDetails> {
  String url = "https://t7.baidu.com/it/u=2405382010,1555992666&fm=193&f=GIF";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("宠物详情",style: TextStyle(color: Colors.black),),
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        backgroundColor: Colors.white,),
      body: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(flex: 5,child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(url),
                fit: BoxFit.cover
              )
            ),
          )),
          Expanded(flex: 5,child: Container(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(top: -50,child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/2,
                  padding: EdgeInsets.only(left: 10,right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 4,child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(color: Colors.black12,blurRadius: 3.0)
                        ]
                      ),
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      child:
                        Row(children: [
                          Expanded(flex: 7,child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            RichText(text: TextSpan(text: "Jenny",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),children: [
                              TextSpan(text: "(Golden Retriveer)",style: TextStyle(fontSize: 10,color: Colors.black38))
                            ])),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Chip(backgroundColor: Colors.lightGreen[300],label: Text("Female",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.green ),),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                                Chip(backgroundColor: Colors.deepPurpleAccent[100],label: Text("6 yrs",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurpleAccent)),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                                Chip(backgroundColor: Colors.orange[100],label: Text("30 kg",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange)),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                              ],
                            ),
                            Row(
                              children: [
                              FaIcon(FontAwesomeIcons.mapMarkerAlt,color: Colors.redAccent,),
                                SizedBox(width: 10,),
                                Text("Arcaid.LA."),
                              ],
                            ),

                          ],)),
                          Expanded(flex: 3,child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(url),
                                fit: BoxFit.cover
                              )
                            ),
                          )),

                        ],),
                      )),
                      Expanded(flex: 1,child: Row(
                        children: [
                          SizedBox(width: 10,),
                          Text("Jenny Momma",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),)
                        ],
                      )),
                      Expanded(flex: 5,child: Column(
                        children: [
                          Expanded(flex: 1,child:Row(
                            children: [
                              Expanded(flex: 2,child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  image: DecorationImage(
                                    image: NetworkImage(url),
                                    fit: BoxFit.contain
                                  )
                                ),
                              )),
                              Expanded(flex: 5,child: Text("Sherley Jonas")),
                              Expanded(flex: 6,child: Row(
                                children: [
                                  Spacer(),
                                 Expanded(child:  MaterialButton(color: Colors.green,onPressed: (){},child: FaIcon(FontAwesomeIcons.phoneAlt),)),
                                 SizedBox(width: 10,),
                                 Expanded(child:  MaterialButton(color: Colors.indigoAccent,onPressed: (){},child: FaIcon(FontAwesomeIcons.comments,color: Colors.blueAccent,),)),
                                ],
                              )),
                            ],
                          )),
                          Expanded(flex: 3,child: Text("岁月的长河静静流淌着，云淡风轻。假如生活欺骗了你，爱情的果实遭遇了害虫，你又执意不肯回头，就让我用三生烟火，换你一世迷离吧，等你终于清醒，我依旧在你身旁，从不曾离去。",maxLines: 4,overflow: TextOverflow.clip)),
                          Expanded(flex: 2,child: Container(
                            margin: EdgeInsets.only(left: 10,right: 10,bottom: 5),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [BoxShadow(color: Colors.black26,blurRadius: 2.0,offset: Offset(0.0,3.0))]
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: MaterialButton(onPressed: (){},child: Text("ADopt Jenny",style: TextStyle(color: Colors.white),),),)),
                        ],
                      )),
                    ],
                  ),
                ))
              ],
            ),
          decoration: BoxDecoration(
         
          ),
          )),
        ],
      ),
    );
  }
}
