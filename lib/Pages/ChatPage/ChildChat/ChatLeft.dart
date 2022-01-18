import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ChatLeft extends ConsumerStatefulWidget {
  final  content;
  const ChatLeft(this.content,{Key? key}) : super(key: key);

  @override
  _ChatLeftState createState() => _ChatLeftState();
}

class _ChatLeftState extends ConsumerState<ChatLeft> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text(widget.content['title']),),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.7 ,
                color: Colors.blue,
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.4 ,
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
