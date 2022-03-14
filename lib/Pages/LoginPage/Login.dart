//登录页
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rice/Network/requests.dart';
import 'package:rice/Pages/HomePage/Home.dart';
import 'package:rice/ProviderData/GlobData.dart' as Glob;
import 'package:rice/Untils/CommonUntil.dart';
import 'LoginModel/modeData.dart';
final StateProvider index = StateProvider((ref) => 0);

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  // final UseIndex = ProviderContainer();
  GlobalKey FormKey = GlobalKey<FormState>();
  TextEditingController PhoneController = TextEditingController();
  TextEditingController PwdController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.0,
        title: Text("用户登录",style: TextStyle(color: Colors.black),),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        height:size.height,
        child: Column(
          children: [
            Expanded(flex: 6,child: loginForm(FormKey,PhoneController,PwdController)),
            Expanded(flex: 2,child: otherLogin()),
            Expanded(flex:2,child:  ProtocolDetail(context)),
          ],
        ),)
    );
  }
}



//表单输入框
Widget loginForm(GlobalKey FromKey,TextEditingController U,TextEditingController P){
  Color color1 = Color.fromRGBO(97, 117, 152, 1);
  Color inputColor = Color.fromRGBO(52, 67, 96, 1);
  Color textColor  = Color.fromRGBO(61, 166, 215, 1);
  return Consumer(builder: (context,ref,_){
    final UseIndex = ref.watch(index.state);
    return Form(
      key: FromKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(children: [GestureDetector(onTap: (){
            UseIndex.state=1;
          },child: Text("密码登录",style: TextStyle(fontSize:18,fontWeight: FontWeight.w600,color: UseIndex.state==1?textColor:Colors.black))),
            SizedBox(width: 40,),
            GestureDetector(onTap: (){
              UseIndex.state=0;
            },child: Text("验证码登录",style: TextStyle(fontSize:18,fontWeight: FontWeight.w600,color: UseIndex.state==0?textColor:Colors.black)))],),
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
                controller: U,
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
                      controller: P,
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
              width: double.infinity,height: 50,child: MaterialButton(onPressed: ()async{

                if ((FromKey.currentState as FormState).validate()){
                var res = await Request.setNetwork("/user", {"phone":U.text,"password":P.text});
                print("到的数据：${res["result"]}");
                if(res["result"]["Token"]!=null){
                  // LoginModel(res["result"]);
                  ref.read(Glob.GlobalData.LoginResult.state).state =LoginModel(res["result"]);
                  ref.read(Glob.GlobalData.loginStatue.state).state = true;
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                    return Home();}));
                }else{
                  print("错误到的数据：$res");
                }
                }

              },child: Text("立即登录",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600),),)),
          Row(mainAxisAlignment: MainAxisAlignment.center,children: [GestureDetector(onTap: (){
            Navigator.pushNamed(context, "/register");
          },child: Text("新手注册",style: TextStyle(color:color1),)),SizedBox(width: 10,),Text("|",style: TextStyle(color:color1)),SizedBox(width: 10,),Text("忘记密码",style: TextStyle(color:color1),)],)
        ],
      ),
    );
  });
}





//获取手机号码界面
class loginPhone extends StatefulWidget {
  const loginPhone({Key? key}) : super(key: key);
  @override
  _loginPhoneState createState() => _loginPhoneState();
}

class _loginPhoneState extends State<loginPhone> {
  String url = "https://t7.baidu.com/it/u=2405382010,1555992666&fm=193&f=GIF";
  bool state = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text("用户登录",style: TextStyle(color: Colors.black),),
      ),
      body: Column(
        children: [
          Spacer(flex: 1,),
          Expanded(flex: 3,child: Container(
          child: Column(
            children: [
              Expanded(flex: 7,child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage("assets/images/petIcon.png"),
                    fit: BoxFit.contain
                  )
                ),
              )),
              Expanded(flex: 3,child: Container(child: Center(child: Text("176****2415"),),)),
            ],
          ),
          )),
          Expanded(flex: 2,child:Container(
           
            child:
            Column(
              children: [
                Expanded(flex: 5,child: Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child,){
                    return GestureDetector(
                      onTap: (){
                        print("进入");
                        ref.read(Glob.GlobalData.loginStatue.state).state=true;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(5)
                        ),
                        width: MediaQuery.of(context).size.width/1.2,child: Center(child: Text("本机号码一键登录")),),
                    );
                  },),
               ),
                Spacer(flex: 1,),
                Expanded(flex: 5,child: GestureDetector(
                  onTap: (){
                   Navigator.pushNamed(context, "/login");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                    color: Colors.orange[100],
                    borderRadius: BorderRadius.circular(5)
                    ),
                    width: MediaQuery.of(context).size.width/1.2,child: Center(child: Text("其它手机号码登录")),),
                )),
              ],
            ),
          )),
          Spacer(flex: 1,),
          Expanded(flex: 3,child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("其他方式登录",style: TextStyle(color: Colors.black38),),
              otherLogin(),
              ProtocolDetail(context)
            ],
          )),
        ],
      ),
    );
  }
}
