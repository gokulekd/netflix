import 'package:flutter/material.dart';
import 'package:netflix/Presentaion/Fast%20Laugh/widgets/video_list_item.dart';
import 'package:netflix/core/colors/Constants.dart';

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
              videos_fastLaugh.length,
              (index) => video_list_item(
                    index: index,
                  )),
        ),
      ),
    );
  }
}
