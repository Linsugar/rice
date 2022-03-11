//首页
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

final  StateProvider<int> _PageIndex = StateProvider((ref)=>0);


class Home extends ConsumerStatefulWidget  {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  Color color1 = Color.fromRGBO(34, 45, 64, 1);
  List<Widget> TabList= [Home2(),Chat(),Pet(),Mark(),Mine()];

  PageController _pageController = PageController();


  final List<BottomNavigationBarItem> barItem = [
    BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.paw),
      label: "首页",
    ),
    BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.commentDots),
      label: "聊天",
    ),
    BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.video),
      label: "寻宠",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.book),
      label: "科普",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "个人中心",
    ),
  ];

  @override
  void initState() {
    print("进入home");
    _pageController.addListener(() {
      ref.read(_PageIndex.state).state = _pageController.page!.toInt();
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
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex:ref.watch(_PageIndex.state).state,
        onTap: (value){
          _pageController.jumpToPage(value);
          ref.read(_PageIndex.state).state = value;
        },
        items:barItem,
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
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