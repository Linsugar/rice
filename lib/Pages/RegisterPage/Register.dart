//注册页
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Network/requests.dart';
import '../../Untils/GetImage.dart';

final StateProvider<String> RegisterImage = StateProvider((ref)=>"https://t7.baidu.com/it/u=1579656049,3979780487&fm=193&f=GIF");
class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  Color color1 = Color.fromRGBO(34, 45, 64, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("注册",style: TextStyle(fontSize: 20.sp),),backgroundColor: color1,elevation: 0,),
      body: Container(
        color: color1,
        child: ListView(
          children: [
            Row(children: [ Text("欢迎使用宠爱",style: TextStyle(color: Colors.white,fontSize: 16.sp,fontWeight: FontWeight.w500),)],),
            SizedBox(height: 5.h,),
            RegisterForm()
          ],
        ),
      ),
    );
  }
}

Widget RegisterForm(){
  Color inputColor = Color.fromRGBO(52, 67, 96, 1);
  Color textColor  = Color.fromRGBO(61, 166, 215, 1);
  Color buttonColor = Color.fromRGBO(61,188, 243,1);
  GlobalKey<FormState> FormKey = GlobalKey();
  TextEditingController RegisterName =  TextEditingController();
  TextEditingController RegisterPhone =  TextEditingController();
  TextEditingController RegisterCode =  TextEditingController();
  TextEditingController RegisterPwd =  TextEditingController();
  TextEditingController RegisterInvite =  TextEditingController();
  return  Consumer(builder: (  BuildContext context, WidgetRef ref, Widget? child,){
    var Image = ref.watch(RegisterImage);
    print("Image:${Image.toString()}");
    return DefaultTextStyle(
      style: TextStyle(color: Colors.white),
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        key: FormKey,
        child:
        Column(
          children: [
            InkWell(onTap: ()async{
              var result= await Creamer.GetGrally();
              ref.read(RegisterImage.state).state = result;
              print("调用相机获取值：${result}");
            },child: CircleAvatar(radius: 40.r,backgroundImage: NetworkImage(Image),)),
            SizedBox(height: 5.h,),
            Container(
              height: 80.h,
              // color: Colors.red,
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("昵称",style: TextStyle(fontSize: 15.sp),),
                  Expanded(
                    child: TextFormField(
                      controller: RegisterName,
                      maxLength: 6,
                      style: TextStyle(color: Colors.white),

                      validator: (value){
                        if(value!.length>10 || value.length<5){
                          return "内容长度1-5";
                        }
                      },
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color:textColor,fontSize: 13.sp),
                          hintText: "给自己取个名字吧",
                          filled: true,
                          counterText: "",
                          fillColor: inputColor,
                          border: OutlineInputBorder(borderSide: BorderSide.none)
                      ),
                    ),
                  ),
                ],
              ) ,
            ),
            SizedBox(height: 5.h,),
            Container(height: 80.h,
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("邮箱或手机号",style: TextStyle(fontSize: 15.sp),),
                  Expanded(
                    child: TextFormField(
                      controller: RegisterPhone,
                      style: TextStyle(color: Colors.white),
                      maxLength: 15,
                      validator: (value){
                        if(value!.length>10 || value.length<5){
                          return "内容长度5-10";
                        }
                      },
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color:textColor,fontSize: 13.sp),
                          hintText: "请输入邮箱或手机号",
                          filled: true,
                          counterText: "",
                          fillColor: inputColor,
                          border: OutlineInputBorder(borderSide: BorderSide.none)
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.h,),
            Container(height: 80.h,child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("验证码",style: TextStyle(fontSize: 15.sp),),
                Expanded(
                  child: TextFormField(
                    validator: (value){
                      if(value!.length>6 || value.length<2){
                        return "验证码不能为空";
                      }
                    },
                    controller: RegisterCode,
                    style: TextStyle(color: Colors.white),
                    maxLength: 6,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color:textColor,fontSize: 13.sp),
                        hintText: "请输入验证码",
                        counterText: "",
                        filled: true,
                        fillColor: inputColor,
                        suffixIcon: GestureDetector(onTap: (){
                          print("1111");
                        },child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("获取验证码 "),
                          ],
                        )),
                        border: OutlineInputBorder(borderSide: BorderSide.none)
                    ),
                  ),
                ),
              ],
            ),),
            SizedBox(height: 5.h,),
            Container(height: 80.h,child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text("密码",style: TextStyle(fontSize: 15.sp),),
                Expanded(
                  child: TextFormField(
                    validator: (value){
                      if(value!.length>10 || value.length<5){
                        return "密码长度5-11";
                      }
                    },
                    controller: RegisterPwd,
                    maxLength: 12,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color:textColor,fontSize: 13.sp),
                        hintText: "请输入密码",
                        filled: true,
                        counterText: "",
                        fillColor: inputColor,
                        border: OutlineInputBorder(borderSide: BorderSide.none)
                    ),
                  ),
                ),
              ],
            ),),
            SizedBox(height: 5.h,),
            Container(height: 80.h,child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("推荐人ID(必填)",style: TextStyle(fontSize: 15.sp),),
                Expanded(
                  child: TextFormField(
                    controller: RegisterInvite,
                    keyboardType: TextInputType.number,
                    validator: (value){
                     if(value!.isEmpty){
                       return "必填";
                     }
                    },
                    maxLength:8 ,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        counterText: "",
                        hintStyle: TextStyle(color:textColor,fontSize: 13.sp),
                        hintText: "请输入推荐人ID",
                        filled: true,
                        fillColor: inputColor,
                        border: OutlineInputBorder(borderSide: BorderSide.none)
                    ),
                  ),
                ),
              ],
            ),),
            SizedBox(height: 20.h,),
            Container(
                width:170.w,
                height: 50.h,
                decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(5.r)
                ), child: MaterialButton(onPressed: ()async{
                  if((FormKey.currentState as FormState).validate()){
                   var res = await Request.setNetwork("UserConfig/QiNiu",data: {
                      "phone":RegisterPhone.text,
                      "password":RegisterPwd.text,
                      "username":RegisterName.text,
                      "invitePerson":RegisterInvite.text,
                      "profilePicture":ref.watch(RegisterImage.state).state,
                      "UserCode":RegisterCode.text,
                    });
                   print("返回的结果：$res");
                  }
            },
              child: Text("立即注册",style: TextStyle(color: Colors.white,fontSize: 18.sp),),))
          ],
        ),
      ),
    );
  });
}





