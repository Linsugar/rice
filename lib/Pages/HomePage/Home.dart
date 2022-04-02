//首页
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rice/Pages/ChatPage/Chat.dart';
import 'package:rice/Pages/PetPage/pet.dart';
import 'package:rice/Untils/Eventbus.dart';
import '../MinePage/Mine.dart';
import '../MarkPage/Mark.dart';
import '../../ProviderData/GlobData.dart' as Glob;
import 'Home2.dart';



class Home extends ConsumerStatefulWidget  {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  Color color1 = Color.fromRGBO(34, 45, 64, 1);
  List<Widget> TabList= [Home2(),Chat(),Pet(),Mark(),Mine()];

  PageController _pageController = PageController();

  @override
  void initState() {
    print("进入home");
    _pageController.addListener(() {
      ref.read(Glob.GlobalData.PageIndex.state).state = _pageController.page!.toInt();
    });
    // TODO: implement initState
    super.initState();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    print("切换");
    super.dispose();
  }
  _InitScreenUtil(){
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height
        ),
        designSize: Size(360, 690),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  _InitScreenUtil();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:PageView(
        controller: _pageController,
        children: TabList,
      ),
      bottomNavigationBar: BottomNavyBar(
      items:  [
        BottomNavyBarItem(
          icon: Icon(Icons.apps),
          title: Text('首页',style: TextStyle(fontSize: 14.sp),),
          activeColor: Colors.red,
        ),
        BottomNavyBarItem(
            icon: FaIcon(FontAwesomeIcons.rocketchat),
            title: Text('聊天',style: TextStyle(fontSize: 14.sp),),
            activeColor: Colors.purpleAccent
        ),
        BottomNavyBarItem(
            icon: FaIcon(FontAwesomeIcons.cat),
            title: Text('宠物',style: TextStyle(fontSize: 14.sp),),
            activeColor: Colors.pink
        ),
        BottomNavyBarItem(
            icon: FaIcon(FontAwesomeIcons.book),
            title: Text('论坛',style: TextStyle(fontSize: 14.sp),),
            activeColor: Colors.green
        ),
        BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('我的',style: TextStyle(fontSize: 14.sp),),
            activeColor: Colors.blue
        ),
      ],
      selectedIndex: ref.watch(Glob.GlobalData.PageIndex.state).state,
      showElevation: true, // use this to remove appBar's elevation
      onItemSelected: (index) => setState(() {
        ref.read(Glob.GlobalData.PageIndex.state).state  = index;
       _pageController.animateToPage(index,
    duration: Duration(milliseconds: 300), curve: Curves.ease);
    }),
    ));
  }
}


class ImageSliderDemo extends StatelessWidget {
  var imgList = ["https://t7.baidu.com/it/u=3527521835,3789150700&fm=193&f=GIF","https://t7.baidu.com/it/u=2656393769,4001912254&fm=193&f=GIF"];
  Size size;
  ImageSliderDemo(this.size);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
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
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(item),
                  fit: BoxFit.cover
              )
          ),
        ),
        ).toList(),
      ),
    );
  }
}