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

  List<dynamic> _list = [
    [
      FaIcon(FontAwesomeIcons.wallet,size: 30,),
      Text("我的资产",style: TextStyle(color: Color.fromRGBO(159,186,231, 1)),)
    ],
    [
      FaIcon(FontAwesomeIcons.users,size: 30,),
      Text("我的团队",style: TextStyle(color: Color.fromRGBO(159,186,231, 1)))],
    [
      FaIcon(FontAwesomeIcons.userAlt,size: 30,),
      Text("我的雇佣",style: TextStyle(color: Color.fromRGBO(159,186,231, 1)))],
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
                  for(var i=0;i<3;i++)
                 Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     CircleAvatar(
                       radius: _size.width/10,backgroundColor: Color.fromRGBO(37, 164, 222, 1),child: Center(child: _list[i][0],),),
                     SizedBox(height: 5,),
                     _list[i][1]
                   ],
                 ),

                ],
              ),)),
              Expanded(flex: 5,child: Container(
                margin: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(55, 71, 100, 1),
                borderRadius: BorderRadius.circular(10),
              ),child:Column(
                children: [
                  Expanded(child: ListTile(
                    leading: FaIcon(FontAwesomeIcons.bell),
                    title: Text("公告"),
                    trailing: FaIcon(FontAwesomeIcons.angleRight),
                  )),
                  Expanded(child: ListTile(
                    leading: FaIcon(FontAwesomeIcons.shieldAlt),
                    title: Text("安全设置"),
                    trailing: FaIcon(FontAwesomeIcons.angleRight),
                  )),
                  Expanded(child: ListTile(
                    leading: FaIcon(FontAwesomeIcons.wallet),
                    title: Text("账户管理"),
                    trailing: FaIcon(FontAwesomeIcons.angleRight),
                  )),
                  Expanded(child: ListTile(
                    leading: FaIcon(FontAwesomeIcons.user),
                    title: Text("自动雇佣"),
                    trailing: FaIcon(FontAwesomeIcons.angleRight),
                  )),
                  Expanded(child: ListTile(
                    leading: FaIcon(FontAwesomeIcons.addressCard),
                    title: Text("关于我们"),
                    trailing: FaIcon(FontAwesomeIcons.angleRight),
                  )),
                  Expanded(child: ListTile(
                    leading: FaIcon(FontAwesomeIcons.userEdit),
                    title: Text("反馈建议"),
                    trailing: FaIcon(FontAwesomeIcons.angleRight),
                  )),
                ],
              ),)),
              Expanded(flex: 1,child: Container(
                margin: EdgeInsets.only(left: 5,right: 5),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(55, 71, 100, 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                width: _size.width,
                child: MaterialButton(onPressed: (){},child: Text("安全退出"),),)),
            ],
          ),
        )
    );
  }
}
