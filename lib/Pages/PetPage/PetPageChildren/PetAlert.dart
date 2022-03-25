
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../Untils/GetImage.dart';


AddPetAlert(BuildContext context)async{
  final result = await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(50.0,80.0, 0.0, 10.0),
      items: <PopupMenuItem<String>>[
        new PopupMenuItem<String>( value: '01', child: new Text('添加宠物')),
        new PopupMenuItem<String>( value: '02', child: new Text('添加好友')),
      ] );
  print("返回的结构：$result");
  if(result=="01"){
    print("进入");
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return PetBuy();
    }));
  }
  return result;
  }
  // return result;



//宠物买卖
class PetBuy extends StatefulWidget {
  const PetBuy({Key? key}) : super(key: key);

  @override
  _PetBuyState createState() => _PetBuyState();
}

class _PetBuyState extends State<PetBuy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("宠物寻爱"),),
      body: Container(
        child: Form(
          child: ListView(
            padding: EdgeInsets.all(3.w),
            scrollDirection:Axis.vertical ,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: ()async{
                   var result= await Creamer.GetGrally();
                   print("调用相机获取值：$result");
                    },
                    child: Container(
                      height: 80.h,
                      width: 70.w,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text("标题简介:"),
                  Container(
                    width: 270.w,
                      height: 30.h,
                      child: TextFormField())
                ],
              ),
              Row(
                children: [
                  Text("宠物描述:"),
                  Container(
                      width: 270.w,
                      height: 80.h,
                      child: TextFormField())
                ],
              ),
              Row(
                children: [
                  Text("宠物年龄:"),
                  Container(
                      width: 270.w,
                      height: 20.h,
                      child: TextFormField())
                ],
              ),
              Row(
                children: [
                  Text("宠物性别:"),
                  Checkbox(value: true, onChanged: (value){}),
                  Checkbox(value: false, onChanged: (value){}),
                ],
              ),
              Row(
                children: [
                  Text("宠物重量:"),
                  Container(
                      width: 270.w,
                      height: 30.h,
                      child: TextFormField())
                ],
              ),
              SizedBox(height: 30.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 70.w,
                    height: 50.h,
                    child: MaterialButton(onPressed: (){},child: Text("提交"),),
                  ),
                  Container(
                    width: 70.w,
                    height: 50.h,
                    child: MaterialButton(onPressed: (){},child: Text("重置"),),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
