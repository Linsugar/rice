
//个人中心
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<int> PageState = StateProvider((ref)=>0);

class Mine extends StatefulWidget {
  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {
  Color _color = Colors.white;

  String _img  = "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202004%2F15%2F20200415161544_rpact.jpg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1634390893&t=117af89dd866442ff2d0806a03667f21";
  static TextStyle _listStyle = TextStyle(color:Colors.black);
  List<Map<dynamic, dynamic>> _list = [
    {
      'text1':Text("喜欢",style: _listStyle,),
      'text2':Text("10000",style: _listStyle,)
    },
    {
      'text1':Text("拜访",style: _listStyle,),
      'text2':Text("20000",style: _listStyle,)
    },
    {
      'text1':Text("文章",style: _listStyle,),
      'text2':Text("20",style: _listStyle,)
    }
  ];
  List<Map<dynamic,dynamic>> _listItem = [
    {
      'icon':FaIcon(FontAwesomeIcons.bell),
      'text':Text("公告",style: _listStyle,)
    },

    {
      'icon':FaIcon(FontAwesomeIcons.wallet),
      'text':Text("账户管理",style: _listStyle,)
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
        body: Container(
          padding: EdgeInsets.only(top: 20,right: 10,left: 10,bottom: 10),
          width: _size.width,
          height: _size.height,
          child: Consumer(builder: (  BuildContext context, WidgetRef ref, Widget? child,){
            var _PageIndex = ref.watch(PageState.state).state;
            return _PageIndex==0?Mine1(_img,_list,_listItem,_size,_color):Mine2(_list);
          },),
            // Mine1(_img,_list,_listItem,_size,_color)
          // child: Mine2(_list),
        )
    );
  }
}



Widget Mine1(String _img,List _list,List _listItem,var _size,Color _color){
  return Flex(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("小星星",style: TextStyle(fontSize: 17),),
                  SizedBox(width: 5,),
                  SwitchPage(1)
                ],),
              Text("UID:uy734757",style: TextStyle(color: Color.fromRGBO(140, 165, 206, 1)),),
              SizedBox(height: 5,),
              Text("推荐人:18381893230",style: TextStyle(color: Color.fromRGBO(140, 165, 206, 1)),),
            ],
          ),)),
        ],
      ),)),
      Expanded(flex: 1,child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),

        ), child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for(var i=0;i<_list.length;i++)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _list[i]['text1'],
                SizedBox(height: 5,),
                _list[i]['text2']
              ],
            )
        ],
      ),)),
      Expanded(flex: 2,child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("拜访",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                FaIcon(FontAwesomeIcons.arrowRight,size: 15,)
              ],),
            Expanded(flex: 2,child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        maxRadius: 20,
                        minRadius: 10,
                        backgroundImage: NetworkImage(_img),
                      ),
                      Text("啸天")
                    ],
                  );
                }, separatorBuilder: (context,index){
              return SizedBox(width: 10,);
            }, itemCount: 10)
            )
          ],
        ),
      )),
      Expanded(
          flex: 5,
          child:
          Container(
            margin: EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(10),
            ),child:Column(
            children: [
              for(var i=0;i<_listItem.length;i++)
                Expanded(
                    child: ListTile(
                      onTap: (){
                        print("选择icon");

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
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: Colors.black26,blurRadius: 2.0,offset: Offset(0.0,3.0))]
        ),
        width: _size.width,
        child: MaterialButton(onPressed: (){},child: Text("安全退出",style: TextStyle(color: _color),),),)),
    ],
  );
}



Widget Mine2(List _list){
  String _img  = "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202004%2F15%2F20200415161544_rpact.jpg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1634390893&t=117af89dd866442ff2d0806a03667f21";
  return Flex(
    direction: Axis.vertical,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(flex: 1,child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("小星星",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          SwitchPage(0)
        ],
      )),
      Expanded(flex: 5,child:Row(
        children: [
          Expanded(flex: 8,child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(_img),
              fit: BoxFit.contain
            )
          ),
          )),
          Expanded(flex: 4,child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for(var i=0;i<_list.length;i++)
              Column(
                children: [
                  _list[i]['text1'],
                  _list[i]['text2']
                ],
              )
            ],
          )),
        ],
      )),
      Expanded(flex: 1,child: Text("Falling in love with yourself first doesn't make youvain or selfish, it makes you indestructible.")),
      Text("All Shots",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      Expanded(flex: 4,child: StaggeredGridView.countBuilder(
        padding: EdgeInsets.all(10),
        shrinkWrap: true,
        crossAxisCount: 4,
        itemCount:8,
        itemBuilder: (BuildContext context, int index) => InkWell(
          onTap: (){
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.deepOrange,offset: Offset(0.0,2.0),blurRadius: 3.0)],
                image: DecorationImage(
                    image: NetworkImage(_img),
                  fit: BoxFit.cover
                )
            ),),
        ),
        staggeredTileBuilder: (int index) =>
        new StaggeredTile.count(2, index==1 ? 3 : 2),
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 20.0,
      )),
    ],
  );
}


Widget SwitchPage(int index){
  return Consumer(builder: (
      BuildContext context,
      WidgetRef ref,
      Widget? child,){
    return   MaterialButton(
      color: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ///按钮点击下的颜色
      highlightColor:Colors.deepPurple,
      ///按钮的阴影
      elevation: 2,
      onPressed: (){
        print("当前内容：${index}");
        ref.read(PageState.state).state=index;
      },child: Text("${index==1?"简洁版":"完整版"}",style: TextStyle(color: Colors.white),),);
  });
}
