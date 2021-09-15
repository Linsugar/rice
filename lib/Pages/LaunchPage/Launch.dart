import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rice/Pages/LoginPage/Login.dart';
final count_down = StateProvider.autoDispose((ref) =>10);


class Launch extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    // TODO: implement createState
    return _LaunchState();
  }

}

class _LaunchState extends ConsumerState<Launch> {
  int index = 0;
  Timer ?_countdownTimer;
  //倒计时
  @override
  void initState() {
    // TODO: implement initState
    this.StartTime();
    super.initState();
  }

   //开始跑倒计时
   StartTime(){
     _countdownTimer = Timer.periodic(Duration(seconds: 1),(timer){
      ref.read(count_down).state-=1;
      if(ref.watch(count_down).state==0){
        print("哈喽");
        _countdownTimer!.cancel();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
         return login();
        }));
      }else{
        print("111");
      }
     });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size =  MediaQuery.of(context).size;
    final _counter = ref.watch(count_down);
    return Scaffold(
      body:Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            ImageSliderDemo(size),
            Positioned(top: 20,right: 10,child: GestureDetector(onTap: (){},child: Text("首页${_counter.state}")))
          ],
        ),
      ),
    );
  }
}

class ImageSliderDemo extends StatelessWidget {
  var imgList = ["https://t7.baidu.com/it/u=3527521835,3789150700&fm=193&f=GIF","https://t7.baidu.com/it/u=2656393769,4001912254&fm=193&f=GIF"];
  Size size;
  ImageSliderDemo(this.size);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: CarouselSlider(
            options: CarouselOptions(
              height: size.height,
              autoPlay: true,
                  aspectRatio: 1,
              viewportFraction: 1.0
            ),
            items: imgList
                .map((item) => Container(
                  width: size.width,
                  height: size.height,
                  child:
                  Image.network(item, fit: BoxFit.cover)),
            )
                .toList(),
          )),
    );
  }
}