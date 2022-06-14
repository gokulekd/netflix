import 'package:flutter/material.dart';
import 'package:netflix/Presentaion/Downloads/screen_downloads.dart';
import 'package:netflix/Presentaion/Fast%20Laugh/fastLaugh.dart';
import 'package:netflix/Presentaion/Home/screen_Home_Page.dart';
import 'package:netflix/Presentaion/NewAndHot/new&hot.dart';
import 'package:netflix/Presentaion/mainPage/bottom_navigaion.dart';
import 'package:netflix/Presentaion/search/Search_screen.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);
  final pages = [
    Screen_home_screen(),
    const screen_new_and_hot(),
    const screen_Fast_laugh(),
   screen_search(),
    screen_downloads()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: valueNotifier,
          builder: (context, int index, _) {
            return pages[index];
          }),
      bottomNavigationBar: Bottom_Navigation_Bar(),
    );
  }
}
