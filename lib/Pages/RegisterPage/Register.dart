//注册页
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rice/ProviderData/GlobData.dart';
import '../../Network/requests.dart';
import '../../Untils/GetImage.dart';

final StateProvider<int> TimerDuration = StateProvider((ref) =>60);


final StateProvider<String> RegisterImage = StateProvider((ref)=>"https://t7.baidu.com/it/u=1579656049,3979780487&fm=193&f=GIF");

class register extends ConsumerStatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  _registerState createState() => _registerState();
}

class _registerState extends ConsumerState<register> {
  Color color1 = Color.fromRGBO(34, 45, 64, 1);
  Color inputColor = Color.fromRGBO(52, 67, 96, 1);
  Color textColor  = Color.fromRGBO(61, 166, 215, 1);
  Color buttonColor = Color.fromRGBO(61,188, 243,1);
  GlobalKey<FormState> FormKey = GlobalKey();
  TextEditingController RegisterName =  TextEditingController();
  TextEditingController RegisterPhone =  TextEditingController();
  TextEditingController RegisterCode =  TextEditingController();
  TextEditingController RegisterPwd =  TextEditingController();
  TextEditingController RegisterInvite =  TextEditingController();
  Timer ?timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  TimeOver(){
    const d = Duration(seconds: 1);
    timer = Timer.periodic(d,(Timer){
      print("当前Timer===${Timer}");
      ref.read(TimerDuration.state).state--;
      print("当前Timer===${ref.watch(TimerDuration.state).state}");
      if (ref.watch(TimerDuration.state).state == 0){
          ref.read(TimerDuration.state).state = 60;
          timer!.cancel();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if(timer == null){
    }else{
      if(timer!.isActive){
        timer!.cancel();
        timer = null;
      }else{
        timer = null;
      }
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        print("返回拦截");
        if(timer ==null){
          return true;
        }else{
          timer!.cancel();
          ref.read(TimerDuration.state).state = 60;
          return true;
        }

      },
      child: Scaffold(
        appBar: AppBar(title: Text("注册",style: TextStyle(fontSize: 20.sp),),backgroundColor: color1,elevation: 0,),
        body: Container(
          color: color1,
          child: ListView(
            children: [
              Row(children: [ Text("欢迎使用宠爱",style: TextStyle(color: Colors.white,fontSize: 16.sp,fontWeight: FontWeight.w500),)],),
              SizedBox(height: 5.h,),
              Consumer(builder: (  BuildContext context, WidgetRef ref, Widget? child,){
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
                                    if(value!.length>10 || value.isEmpty){
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
                                  maxLength: 20,
                                  validator: (value){
                                    if(value!.length>20 || value.isEmpty){
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
                                  if(value!.length>6 || value.isEmpty){
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
                                    suffixIcon: AbsorbPointer(
                                      absorbing: ref.watch(TimerDuration.state).state==60?false:true,
                                      child: GestureDetector(onTap: ()async{
                                        if (RegisterPhone.text.isNotEmpty){
                                          var res = await Request.getNetwork("UserConfig/CodeWith",params: {
                                            "phone":RegisterPhone.text,
                                            "devices":ref.read(GlobalData.AndroidDeviceInfo.state).state.androidId,
                                          });
                                          EasyLoading.showSuccess(res["Result"],dismissOnTap: true);
                                          TimeOver();

                                        }else{
                                          EasyLoading.showError("请填写好数据",dismissOnTap: true);
                                        }

                                      },child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [

                                          ref.watch(TimerDuration.state).state==60?Text("获取验证码"):Text("${ref.watch(TimerDuration.state).state}"),
                                        ],
                                      )),
                                    ),
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
                                  if(value!.length>10 || value.isEmpty){
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
                            var res = await Request.setNetwork("UserCenter/register",data: {
                              "phone":RegisterPhone.text,
                              "password":RegisterPwd.text,
                              "username":RegisterName.text,
                              "invitePerson":RegisterInvite.text,
                              "profilePicture":ref.watch(RegisterImage.state).state,
                              "UserCode":RegisterCode.text,
                              "userDevice":ref.read(GlobalData.AndroidDeviceInfo.state).state.androidId
                            });
                            print("返回的结果：$res");
                          }
                        },
                          child: Text("立即注册",style: TextStyle(color: Colors.white,fontSize: 18.sp),),))
                      ],
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}




// Widget RegisterForm(){
//
//   Color inputColor = Color.fromRGBO(52, 67, 96, 1);
//   Color textColor  = Color.fromRGBO(61, 166, 215, 1);
//   Color buttonColor = Color.fromRGBO(61,188, 243,1);
//   GlobalKey<FormState> FormKey = GlobalKey();
//   TextEditingController RegisterName =  TextEditingController();
//   TextEditingController RegisterPhone =  TextEditingController();
//   TextEditingController RegisterCode =  TextEditingController();
//   TextEditingController RegisterPwd =  TextEditingController();
//   TextEditingController RegisterInvite =  TextEditingController();
//   return  Consumer(builder: (  BuildContext context, WidgetRef ref, Widget? child,){
//     var Image = ref.watch(RegisterImage);
//     print("Image:${Image.toString()}");
//     return DefaultTextStyle(
//       style: TextStyle(color: Colors.white),
//       child: Form(
//         autovalidateMode: AutovalidateMode.always,
//         key: FormKey,
//         child:
//         Column(
//           children: [
//             InkWell(onTap: ()async{
//               var result= await Creamer.GetGrally();
//               ref.read(RegisterImage.state).state = result;
//               print("调用相机获取值：${result}");
//             },child: CircleAvatar(radius: 40.r,backgroundImage: NetworkImage(Image),)),
//             SizedBox(height: 5.h,),
//             Container(
//               height: 80.h,
//               // color: Colors.red,
//               child:Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("昵称",style: TextStyle(fontSize: 15.sp),),
//                   Expanded(
//                     child: TextFormField(
//                       controller: RegisterName,
//                       maxLength: 6,
//                       style: TextStyle(color: Colors.white),
//                       validator: (value){
//                         if(value!.length>10 || value.isEmpty){
//                           return "内容长度1-5";
//                         }
//                       },
//                       decoration: InputDecoration(
//                           hintStyle: TextStyle(color:textColor,fontSize: 13.sp),
//                           hintText: "给自己取个名字吧",
//                           filled: true,
//                           counterText: "",
//                           fillColor: inputColor,
//                           border: OutlineInputBorder(borderSide: BorderSide.none)
//                       ),
//                     ),
//                   ),
//                 ],
//               ) ,
//             ),
//             SizedBox(height: 5.h,),
//             Container(height: 80.h,
//               child:Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//
//                   Text("邮箱或手机号",style: TextStyle(fontSize: 15.sp),),
//                   Expanded(
//                     child: TextFormField(
//                       controller: RegisterPhone,
//                       style: TextStyle(color: Colors.white),
//                       maxLength: 20,
//                       validator: (value){
//                         if(value!.length>20 || value.isEmpty){
//                           return "内容长度5-10";
//                         }
//                       },
//                       decoration: InputDecoration(
//                           hintStyle: TextStyle(color:textColor,fontSize: 13.sp),
//                           hintText: "请输入邮箱或手机号",
//                           filled: true,
//                           counterText: "",
//                           fillColor: inputColor,
//                           border: OutlineInputBorder(borderSide: BorderSide.none)
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 5.h,),
//             Container(height: 80.h,child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("验证码",style: TextStyle(fontSize: 15.sp),),
//                 Expanded(
//                   child: TextFormField(
//                     validator: (value){
//                       if(value!.length>6 || value.isEmpty){
//                         return "验证码不能为空";
//                       }
//                     },
//                     controller: RegisterCode,
//                     style: TextStyle(color: Colors.white),
//                     maxLength: 6,
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(
//                         hintStyle: TextStyle(color:textColor,fontSize: 13.sp),
//                         hintText: "请输入验证码",
//                         counterText: "",
//                         filled: true,
//                         fillColor: inputColor,
//                         suffixIcon: GestureDetector(onTap: ()async{
//                           if (RegisterPhone.text.isNotEmpty){
//                             var res = await Request.getNetwork("UserConfig/CodeWith",params: {
//                               "phone":RegisterPhone.text,
//                               "devices":ref.read(GlobalData.AndroidDeviceInfo.state).state.androidId,
//                             });
//                             EasyLoading.showSuccess(res["Result"],dismissOnTap: true);
//
//
//                           }else{
//                             EasyLoading.showError("请填写好数据",dismissOnTap: true);
//                           }
//
//                         },child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//
//                             ref.watch(TimerDuration.state).state==60?Text("获取验证码"):Text("${ref.watch(TimerDuration.state).state}"),
//                           ],
//                         )),
//                         border: OutlineInputBorder(borderSide: BorderSide.none)
//                     ),
//                   ),
//                 ),
//               ],
//             ),),
//             SizedBox(height: 5.h,),
//             Container(height: 80.h,child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//
//                 Text("密码",style: TextStyle(fontSize: 15.sp),),
//                 Expanded(
//                   child: TextFormField(
//                     validator: (value){
//                       if(value!.length>10 || value.isEmpty){
//                         return "密码长度5-11";
//                       }
//                     },
//                     controller: RegisterPwd,
//                     maxLength: 12,
//                     style: TextStyle(color: Colors.white),
//                     decoration: InputDecoration(
//                         hintStyle: TextStyle(color:textColor,fontSize: 13.sp),
//                         hintText: "请输入密码",
//                         filled: true,
//                         counterText: "",
//                         fillColor: inputColor,
//                         border: OutlineInputBorder(borderSide: BorderSide.none)
//                     ),
//                   ),
//                 ),
//               ],
//             ),),
//             SizedBox(height: 5.h,),
//             Container(height: 80.h,child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("推荐人ID(必填)",style: TextStyle(fontSize: 15.sp),),
//                 Expanded(
//                   child: TextFormField(
//                     controller: RegisterInvite,
//                     keyboardType: TextInputType.number,
//                     validator: (value){
//                      if(value!.isEmpty){
//                        return "必填";
//                      }
//                     },
//                     maxLength:8 ,
//                     style: TextStyle(color: Colors.white),
//                     decoration: InputDecoration(
//                         counterText: "",
//                         hintStyle: TextStyle(color:textColor,fontSize: 13.sp),
//                         hintText: "请输入推荐人ID",
//                         filled: true,
//                         fillColor: inputColor,
//                         border: OutlineInputBorder(borderSide: BorderSide.none)
//                     ),
//                   ),
//                 ),
//               ],
//             ),),
//             SizedBox(height: 20.h,),
//             Container(
//                 width:170.w,
//                 height: 50.h,
//                 decoration: BoxDecoration(
//                     color: buttonColor,
//                     borderRadius: BorderRadius.circular(5.r)
//                 ), child: MaterialButton(onPressed: ()async{
//                   if((FormKey.currentState as FormState).validate()){
//                    var res = await Request.setNetwork("UserCenter/register",data: {
//                       "phone":RegisterPhone.text,
//                       "password":RegisterPwd.text,
//                       "username":RegisterName.text,
//                       "invitePerson":RegisterInvite.text,
//                       "profilePicture":ref.watch(RegisterImage.state).state,
//                       "UserCode":RegisterCode.text,
//                       "userDevice":ref.read(GlobalData.AndroidDeviceInfo.state).state.androidId
//                     });
//                    print("返回的结果：$res");
//                   }
//             },
//               child: Text("立即注册",style: TextStyle(color: Colors.white,fontSize: 18.sp),),))
//           ],
//         ),
//       ),
//     );
//   });
// }





