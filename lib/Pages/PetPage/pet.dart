import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rice/Pages/PetPage/PetPageChildren/PetAlert.dart';
import 'package:rice/ProviderData/GlobData.dart';
import '../../Network/requests.dart';
import './PetModels/Pet.dart';
import '../../ProviderData/GlobData.dart';
final _selectIndex = StateProvider((ref) => 0);


final FutureProvider<List> futurePetProvider = FutureProvider((ref) async {
  List <PetModel>PetList = [];
  List FilterList = [];
  /// 延时3s
  var PetData =await Request.getNetwork("UserCenter/pet",token:ref.read(GlobalData.LoginResult.state).state.Token);
  print("得到的数据：PetData：${PetData["Result"]}");
  List res = PetData["Result"];
  for (var i=0;i<res.length;i++){
    PetList.add(PetModel(res[i]));
  }
  var va1=ref.watch(_selectIndex.state).state;
  if (va1 == 0){
    return PetList;
  }else{
    FilterList = PetList.where((element) => int.parse(element.petClass)==va1).toList();
    return FilterList;
  }

});

class Pet extends ConsumerStatefulWidget {
  const Pet({Key? key}) : super(key: key);

  @override
  _PetState createState() => _PetState();
}

class _PetState extends ConsumerState<Pet> {
  String url = "https://t7.baidu.com/it/u=2405382010,1555992666&fm=193&f=GIF";
   var animale = [
     FontAwesomeIcons.dog,
     FontAwesomeIcons.horse,
     FontAwesomeIcons.frog,
     FontAwesomeIcons.cat,
     FontAwesomeIcons.crow,
     FontAwesomeIcons.fish,
     FontAwesomeIcons.piggyBank,
   ];

   Color  _selectColor = Color.fromRGBO(197,233,234, 1);
   Color  _unselectColor = Color.fromRGBO(241, 217, 205, 1);

   @override
  void initState() {
    // TODO: implement initState
     print("进入pet1111");
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    print("离开pet1111");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text("宠物寻真",style: TextStyle(color: Colors.black),),
      actions: [
        Row(
          children: [
            FaIcon(FontAwesomeIcons.search,color: Colors.black,),
            SizedBox(width: 15.sp,),
            InkWell(onTap: (){
              AddPetAlert(context);
            },child: FaIcon(FontAwesomeIcons.addressBook,color: Colors.black38,)),
            SizedBox(width: 10.sp,),
          ],
        )
      ],
      ),
      body: Column(
      children: [
        SizedBox(height: 5.h,),
        Container(height: 30.h,child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child,){
                ref.watch(_selectIndex);
                return GestureDetector(
                  onTap: (){
                    ref.read(_selectIndex.state).state=index;
                  },
                  child: Container(
                    width: 70.w,
                    decoration: BoxDecoration(
                        color: ref.read(_selectIndex.state).state==index?_selectColor:_unselectColor,
                        borderRadius: BorderRadius.circular(10.r)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FaIcon(animale[index],color: Colors.black,),
                        Text("Dogs")
                      ],
                    ),
                  ),
                );
              });
            }, separatorBuilder: (context,index){
          return SizedBox(width: 10,);
        }, itemCount: animale.length)),
        SizedBox(height: 5.h,),
        Container(height:500.h,child: Consumer(
        builder: (  BuildContext context, WidgetRef ref, Widget? _,){
          AsyncValue<List> PetList = ref.watch(futurePetProvider);
          print("PetList:$PetList");
          return PetList.when(data: (value)=>RefreshIndicator(
            onRefresh: ()async{
              ref.refresh(futurePetProvider);        //结束刷新
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("更新成功:${value.length}")));
            },
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h
            ), itemBuilder: (BuildContext context, int index){
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, "/PetDetails",arguments:value.isEmpty?"pet":value[index]);
                    },
                    child: Container(
                      width: 160.w,
                      height: 200.h,
                      decoration: BoxDecoration(
                          boxShadow: [BoxShadow(color: Colors.black38,offset: Offset(0.0,2.0),blurRadius: 3.0)],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.r)
                      ),
                      child: Column(
                        children: [
                          Expanded(flex: 9,child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.all(5.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    image: DecorationImage(image: NetworkImage(value.isEmpty?url:value[index].pet_avatotr),fit: BoxFit.cover)),),
                              Positioned(
                                  top: 10,
                                  right: 10,
                                  child: GestureDetector(
                                    onTap: (){
                                      print("点播关注");
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.deepPurple,
                                      radius: 12,
                                      child: FaIcon(FontAwesomeIcons.heartbeat,size: 12,color: Colors.white,),),
                                  ))
                            ],
                          )),
                          Expanded(flex: 3,child: Container(
                            padding: EdgeInsets.only(left: 5.w,right: 5.w),
                            width: double.maxFinite,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(value.isEmpty?"Franklin":value[index].pet_name,style: TextStyle(fontWeight: FontWeight.bold ),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(value.isEmpty?"DutchPug":value[index].petdetail,style: TextStyle(fontWeight: FontWeight.w400 ,color: Colors.blueGrey),overflow: TextOverflow.clip,maxLines: 1,),
                                    Container(
                                        padding: EdgeInsets.all(2.w),
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(251,237, 237, 1),
                                            borderRadius: BorderRadius.circular(5.r)
                                        ),child: Text("2YRS",style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.red,fontSize: 10.0.sp),)),
                                  ],)

                              ],),
                          ))

                        ],
                      ),
                    ),
                  )
                ],
              );
            },itemCount: value.length,),
          ), error: (error, stackTrace)=>Center(child: Text("请登录-该功能不对外开放"),), loading: ()=>Center(child: CircularProgressIndicator()));
        },
      )),
      ],
      ),
    );
  }
}



//
