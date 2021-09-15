//登录页
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rice/Pages/HomePage/Home.dart';
final StateProvider<int> index = StateProvider((ref) => 0);

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  // final UseIndex = ProviderContainer();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: DefaultTextStyle(
        style: TextStyle(color: Colors.white),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Color.fromRGBO(34, 45, 64, 1)
            ),
            width: size.width,
            height:size.height,
            child: Column(
              children: [
                Expanded(
                  child: loginForm()),
                SizedBox(height: 70,)
              ],
            ),),
        ),
      )
    );
  }
}

//表单输入框
Widget loginForm(){
  Color color1 = Color.fromRGBO(97, 117, 152, 1);
  Color inputColor = Color.fromRGBO(52, 67, 96, 1);
  Color textColor  = Color.fromRGBO(61, 166, 215, 1);
  return Consumer(builder: (context,ref,_){
    final UseIndex = ref.watch(index);
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: 30,),
          Row(children: [Text("欢迎使用宠爱",style: TextStyle(letterSpacing:1.5,fontSize:25,fontWeight: FontWeight.bold),),],),
          Row(children: [GestureDetector(onTap: (){
            UseIndex.state=0;
          },child: Text("密码登录",style: TextStyle(fontSize:18,fontWeight: FontWeight.w600,color: UseIndex.state==0?textColor:Colors.white))),
            SizedBox(width: 20,),
            GestureDetector(onTap: (){
              UseIndex.state=1;
            },child: Text("验证码登录",style: TextStyle(fontSize:18,fontWeight: FontWeight.w600,color: UseIndex.state==1?textColor:Colors.white)))],),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("邮箱或手机号"),
              SizedBox(height: 10,),
              Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: inputColor,
                      borderRadius: BorderRadius.circular(5)
                  ),child: TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    border:InputBorder.none,
                    hintText: "请输入邮箱或手机号",hintStyle: TextStyle(color:color1)),)),
            ],
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("密码"),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: inputColor,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Flex(direction: Axis.horizontal,children: [
                    Expanded(flex: 7,child: TextFormField(
                      style: TextStyle(color: Colors.white),decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: UseIndex.state==0?"请输入验证码":"请输入密码",hintStyle: TextStyle(color:color1)),
                    )),
                    UseIndex.state==0?Expanded(flex: 4,child: MaterialButton(onPressed: (){},child: Text("获取验证码",style: TextStyle(color: Colors.blue[300],fontWeight: FontWeight.bold),))):SizedBox(),
                  ],),
                ),
              ],
            ),
          ),
          Container(margin: EdgeInsets.all(5),
              decoration: BoxDecoration(color: Colors.blue,borderRadius:BorderRadius.circular(5)),
              width: double.infinity,height: 50,child: MaterialButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return Home();
                }));
              },child: Text("立即登录",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600),),)),
          Row(mainAxisAlignment: MainAxisAlignment.center,children: [GestureDetector(onTap: (){
            Navigator.pushNamed(context, "/register");
          },child: Text("新手注册",style: TextStyle(color:color1),)),SizedBox(width: 10,),Text("|",style: TextStyle(color:color1)),SizedBox(width: 10,),Text("忘记密码",style: TextStyle(color:color1),)],)
        ],
      ),
    );
  });
}