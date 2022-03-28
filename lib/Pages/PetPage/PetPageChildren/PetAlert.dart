import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rice/Network/requests.dart';
import 'package:rice/ProviderData/GlobData.dart';
import '../../../Untils/GetImage.dart';
final StateProvider T2 = StateProvider((ref) => "hello");

final FutureProvider<String> T1PetProvider = FutureProvider((ref) async {
  var value = ref.watch(T2.state).state;
  return value;
});


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
  }else{
    print("进入");
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return Ptest();
    }));
  }
  return result;
  }
  // return result;



//宠物买卖
class PetBuy extends ConsumerStatefulWidget {
  const PetBuy({Key? key}) : super(key: key);

  @override
  _PetBuyState createState() => _PetBuyState();
}

class _PetBuyState extends ConsumerState<PetBuy> {

  GlobalKey FormKey = GlobalKey<FormState>();
  TextEditingController pet_name = TextEditingController();
  TextEditingController petContent = TextEditingController();
  TextEditingController petAge = TextEditingController();
  TextEditingController petWeight = TextEditingController();
  TextEditingController pet_avatotr = TextEditingController();
  TextEditingController petMoney = TextEditingController();
  bool Petsex = true;
  int lines = 1;
  String Im = "http://cdn.tlapp.club/16266904145176969.jpg";
  // GetToken()async{
  //   var token =  await Request.setNetwork("/UserConfig/QiNiu");
  //   print("获取token:$token");
  //   return token;
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var Image = ref.watch(GlobalData.ImagePet.state).state;
    return Scaffold(
      appBar: AppBar(title: Text("宠物寻爱"),),
      body: Form(
        key: FormKey,
        autovalidateMode: AutovalidateMode.always,
        child: ListView(
          padding: EdgeInsets.all(3.w),
          scrollDirection:Axis.vertical ,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: ()async{
                      print("调用相机获取值");
                      var result= await Creamer.GetGrally();
                      print("调用相机获取值：${result}");
                      ref.read(GlobalData.ImagePet.state).state = result;
                    },
                    child:Consumer(builder: (  BuildContext context, WidgetRef ref, Widget? child,){
                      return Container(height: 80.r, width: 80.r,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            image: DecorationImage(
                                image: NetworkImage(Image==null?Im:Image),
                                fit: BoxFit.cover
                            )
                        ),
                      );
                    },)
                )
              ],
            ),
            SizedBox(height: 20.h,),
            Row(
              children: [
                Text("宠物昵称:"),
                Container(
                    width: 200.w,
                    height: 40.h,
                    child: TextFormField(
                      controller: pet_name,
                      validator: (value){
                        if (value!.length<1||value.length>6){
                          return "请输入1到6位的昵称";
                        }
                      },
                      maxLines: 1,
                      decoration: InputDecoration(
                          hintText: "请写入它的昵称"
                      ),
                    )),
              ],
            ),
            Row(
              children: [
                Text("宠物年龄:"),
                Container(
                    width: 200.w,
                    height: 40.h,
                    child: TextFormField(
                      controller: petAge,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        //只允许数字
                        FilteringTextInputFormatter.digitsOnly,

                      ],
                    )),
                Container(width: 70.w,height: 40.h,color: Colors.blue,child: Center(child: Text("月")),)
              ],
            ),
            Row(
              children: [
                Text("宠物重量:"),
                Container(
                    width: 200.w,
                    height: 40.h,
                    child: TextFormField(
                      controller: petWeight,
                    )),
                Container(width: 70.w,height: 40.h,color: Colors.blue,child: Center(child: Text("斤")),)
              ],
            ),
            Row(
              children: [
                Text("宠物价位:"),
                Container(
                    width: 200.w,
                    height: 40.h,
                    child: TextFormField(
                      controller: petMoney,
                    )),
                Container(width: 70.w,height: 40.h,color: Colors.blue,child: Center(child: Text("元")),)
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("宠物描述:"),
                Container(
                    constraints: BoxConstraints(
                        maxHeight: 90.h,
                        minHeight: 40.h,
                        maxWidth:270.w,
                        minWidth: 20.w
                    ),
                    color: Colors.redAccent,
                    child: TextFormField(
                      decoration: InputDecoration(
                          counterText: ""
                      ),
                      maxLines: 3,
                      maxLength: 45,
                      controller: petContent,
                    )
                  // color: Colors.blue,
                )
              ],
            ),
            Row(
              children: [
                Text("宠物性别:"),
                Checkbox(value: Petsex, onChanged: (value){
                  setState(() {
                    Petsex = true;
                  });

                }),
                Checkbox(value: !Petsex, onChanged: (value){
                  setState(() {
                    Petsex = false;
                  });
                }),
              ],
            ),
            SizedBox(height: 30.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 70.w,
                  height: 50.h,
                  child: MaterialButton(onPressed: ()async{
                    if ((FormKey.currentState as FormState).validate()) {
                      //验证通过提交数据
                      var result = await Request.setNetwork("UserCenter/pet", data: {
                        "petMaster":ref.read(GlobalData.LoginResult.state).state.UserId,
                        "pet_name":pet_name.text,
                        "petContent":petContent.text,
                        "petAge":double.parse(petAge.text),
                        "petWeight":double.parse(petWeight.text),
                        "pet_avatotr":Image,
                        "petMoney":double.parse(petMoney.text),
                        "pet_sex":Petsex?0:1,
                      });
                      print("当前返回的结果：$result");
                      if(result["Message"]=="请求成功"){
                        Navigator.pop(context);
                      }else{

                      }
                    }
                  },child: Text("提交"),),
                ),
                Container(
                  width: 70.w,
                  height: 50.h,
                  child: MaterialButton(onPressed: (){
                    pet_name.clear();
                    petContent.clear();
                    petAge.clear();
                    petWeight.clear();
                    pet_avatotr.clear();
                    petMoney.clear();
                  },child: Text("重置"),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}



class Ptest extends ConsumerStatefulWidget {
  const Ptest({Key? key}) : super(key: key);

  @override
  _PtestState createState() => _PtestState();
}

class _PtestState extends ConsumerState<Ptest> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("petTest"),),
      floatingActionButton: FloatingActionButton(
        child: Text("点击"),
        onPressed: (){
          ref.read(T2.state).state = "牛逼克拉斯";
          // ref.refresh(T1PetProvider);
        },
      ),
      body: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child,) {
            AsyncValue config = ref.watch(T1PetProvider);
            return config.when(
              loading: () => const CircularProgressIndicator(),
              error: (err, stack) => Text('Error: $err'),
              data: (config) {
                return Text(config);
              },
            );
          }),
    );
  }
}

