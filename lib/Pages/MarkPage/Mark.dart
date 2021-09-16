//市场页
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Mark extends StatefulWidget {
  const Mark({Key? key}) : super(key: key);

  @override
  _MarkState createState() => _MarkState();
}

class _MarkState extends State<Mark> {
  Color _color = Color.fromRGBO(35, 45, 64, 1);
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: _color,
      appBar: AppBar(title: Text("市场"),backgroundColor: _color,bottom: TabBar(tabs: [
        Text("1"),
        Text("1"),
        Text("1"),
        Text("1"),
      ]),),
      body: Container(
        width: _size.width,
        height: _size.height,
        child:Container(color: Colors.orangeAccent,),
      ),
    );
  }
}
