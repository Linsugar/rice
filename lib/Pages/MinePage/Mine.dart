//@dart=2.10
//个人中心
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Mine extends StatefulWidget {
  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {
  Color _color = Color.fromRGBO(35, 45, 64, 1);

  String _img  = "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202004%2F15%2F20200415161544_rpact.jpg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1634390893&t=117af89dd866442ff2d0806a03667f21";
  static TextStyle _listStyle = TextStyle(color: Color.fromRGBO(159,186,231, 1));
  List<Map<dynamic, dynamic>> _list = [
    {
      'icon':FaIcon(FontAwesomeIcons.wallet,size: 30,),
      'text':Text("我的资产",style: _listStyle,)
    },
    {
      'icon':FaIcon(FontAwesomeIcons.wallet,size: 30,),
      'text':Text("我的资产",style: _listStyle,)
    },
    {
      'icon':FaIcon(FontAwesomeIcons.wallet,size: 30,),
      'text':Text("我的资产",style: _listStyle,)
    }
  ];
  List<Map<dynamic,dynamic>> _listItem = [
    {
      'icon':FaIcon(FontAwesomeIcons.bell),
      'text':Text("公告",style: _listStyle,)
    },
    {
      'icon':FaIcon(FontAwesomeIcons.shieldAlt),
      'text':Text("安全设置",style: _listStyle,)
    },
    {
      'icon':FaIcon(FontAwesomeIcons.wallet),
      'text':Text("账户管理",style: _listStyle,)
    },
    {
      'icon':FaIcon(FontAwesomeIcons.user),
      'text':Text("自动雇佣",style: _listStyle,)
    },
    {
      'icon':FaIcon(FontAwesomeIcons.addressCard),
      'text':Text("关于我们",style: _listStyle,)
    },
    {
      'icon':FaIcon(FontAwesomeIcons.userEdit),
      'text':Text("反馈建议",style: _listStyle,)
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    Size _size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: _color,
        appBar: AppBar(title: Text("个人中心"),backgroundColor: _color,),
        body: Container(
          padding: EdgeInsets.all(10),
          width: _size.width,
          height: _size.height,
          child: Flex(
            direction: Axis.vertical,
            children: [
              Expanded(flex: 2,child: Container(child: Row(
                children: [
                  Expanded(flex: 4,child: Container(child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,child: CircleAvatar(
                    radius: 45,
                    backgroundImage: NetworkImage(_img),
                  ),),)),
                  Expanded(flex: 6,child: Container(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("17608242415",style: TextStyle(color: Colors.white,fontSize: 17),),
                      SizedBox(width: 5,),
                      OutlinedButton(onPressed: (){}, child: Text("未激活"),style:ButtonStyle(
                          side: MaterialStateProperty.all(BorderSide(color: Colors.white)),

                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))) ,)
                        ],),
                      Text("UID:uy734757",style: TextStyle(color: Color.fromRGBO(140, 165, 206, 1)),),
                      SizedBox(height: 5,),
                      Text("推荐人:18381893230",style: TextStyle(color: Color.fromRGBO(140, 165, 206, 1)),),
                    ],
                  ),)),
                ],
              ),)),
              Expanded(flex: 2,child: Container(
                margin: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromRGBO(55, 71, 100, 1)
                ), child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for(var i=0;i<_list.length;i++)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: _size.width/15,backgroundColor: Color.fromRGBO(
                            37, 164, 222, 1.0),child: Center(child: _list[i]['icon'],),),
                         SizedBox(height: 5,),
                        _list[i]['text']
                      ],
                    )
                  ],
              ),)),
              Expanded(
                  flex: 5,
                  child:
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(55, 71, 100, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),child:Column(
                    children: [
                      for(var i=0;i<_listItem.length;i++)
                      Expanded(
                        child: ListTile(
                          onTap: (){
                            print("选择icon");
                            if(i==3){
                              Navigator.pushNamed(context, "/map");
                            }
                          },
                        leading: _listItem[i]['icon'],
                        title: _listItem[i]['text'],
                        trailing: FaIcon(FontAwesomeIcons.angleRight),
                      ))
                    ],
                  ),)
             ),
              Expanded(flex: 1,child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(55, 71, 100, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: _size.width,
                child: MaterialButton(onPressed: (){},child: Text("安全退出",style: _listStyle,),),)),
            ],
          ),
        )
    );
  }
}

