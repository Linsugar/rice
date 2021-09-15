//注册页
import 'package:flutter/material.dart';
class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  Color color1 = Color.fromRGBO(34, 45, 64, 1);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      appBar: AppBar(title: Text("注册"),backgroundColor: color1,elevation: 0,),
      body: SingleChildScrollView(
        child: Container(
          color: color1,
          width:size.width,
          height: size.height,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(children: [ Text("欢迎使用宠爱",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),)],),
              SizedBox(height: 20,),
              RegisterForm()
            ],
          ),
        ),
      ),
    );
  }
}

Widget RegisterForm(){
  Color inputColor = Color.fromRGBO(52, 67, 96, 1);
  Color textColor  = Color.fromRGBO(61, 166, 215, 1);
  Color buttonColor = Color.fromRGBO(61,188, 243,1);
  return DefaultTextStyle(
    style: TextStyle(color: Colors.white),
    child: Form(
      child:
      Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("邮箱或手机号"),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintStyle: TextStyle(color:textColor),
                  hintText: "请输入邮箱或手机号",
                  filled: true,
                  fillColor: inputColor,
                  border: OutlineInputBorder(borderSide: BorderSide.none)
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Text("验证码"),
              TextFormField(
                style: TextStyle(color: Colors.white),
                maxLength: 6,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color:textColor),
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
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Text("密码"),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintStyle: TextStyle(color:textColor),
                    hintText: "请输入密码",
                    filled: true,
                    fillColor: inputColor,
                    border: OutlineInputBorder(borderSide: BorderSide.none)
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Text("确认密码"),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintStyle: TextStyle(color:textColor),
                    hintText: "请再次输入密码",
                    filled: true,
                    fillColor: inputColor,
                    border: OutlineInputBorder(borderSide: BorderSide.none)
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Text("推荐人ID(必填)"),
              TextFormField(
                keyboardType: TextInputType.number,
                maxLength:11 ,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  counterText: "",
                    hintStyle: TextStyle(color:textColor),
                    hintText: "请输入推荐人ID",
                    filled: true,
                    fillColor: inputColor,
                    border: OutlineInputBorder(borderSide: BorderSide.none)
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Container(
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(5)
              ),
              width: double.infinity,child: MaterialButton(onPressed: (){},child: Text("立即注册",style: TextStyle(color: Colors.white,fontSize: 18),),))
        ],
      ),
    ),
  );
}