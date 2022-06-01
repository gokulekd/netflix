import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix/Presentaion/Fast%20Laugh/widgets/video_list_item.dart';

class screen_Fast_laugh extends StatefulWidget {
  const screen_Fast_laugh({Key? key}) : super(key: key);

  @override
  State<screen_Fast_laugh> createState() => _screen_Fast_laughState();
}

class _screen_Fast_laughState extends State<screen_Fast_laugh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: List.generate(
              10,
              (index) => video_list_item(
                    index: index,
                  )),
        ),
      ),
    );
  }
}
