import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/Domain/Core/apis.dart';
import 'package:netflix/Domain/database_response/database_response.dart';
import 'package:netflix/Presentaion/Home/widgets/Large_tile_homepage.dart';
import 'package:netflix/Presentaion/Home/widgets/categories.dart';
import 'package:netflix/Presentaion/Home/widgets/homepag_first_card.dart';
import 'package:netflix/Presentaion/widgets/main_title_card.dart';
import 'package:netflix/core/colors/Constants.dart';

import 'package:netflix/main.dart';

final String imageurl2 =
    "https://c4.wallpaperflare.com/wallpaper/153/860/948/movie-poster-star-wars-star-wars-the-rise-of-skywalker-2019-year-movies-hd-wallpaper-preview.jpg";
final String neflix_logo =
    "https://pngimg.com/uploads/netflix/netflix_PNG22.png";

class Screen_home_screen extends StatefulWidget {
  Screen_home_screen({Key? key}) : super(key: key);

  @override
  State<Screen_home_screen> createState() => _Screen_home_screenState();
}

class _Screen_home_screenState extends State<Screen_home_screen> {
  ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

  @override
  void initState() {
    // TODO: implement initState
    movieload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: (BuildContext context, index, _) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (Notification) {
                final ScrollDirection direction = Notification.direction;
                // print(direction);
                if (direction == ScrollDirection.reverse) {
                  scrollNotifier.value = false;
                } else if (direction == ScrollDirection.forward) {
                  scrollNotifier.value = true;
                }
                return true;
              },
              child: SafeArea(
                child: Stack(
                  children: [
                    ListView(
                      children: [
                        large_tile_homepage(index: index),
                      homepage_First_card(TitleName: "Realsesd In The Past Year", list_name: South_Indian_Cinimas),
                        Main_title_card(
                            TitleName: "Trending Now", list_name: Trending_Now),
                        Number_tile_widget(Listrecived: Top_10_TV_shows),
                        Main_title_card(
                            TitleName: "Tensed Dramas",
                            list_name: Tensed_dramas),
                        Main_title_card(
                            TitleName: "South Indian Cinimas",
                            list_name: South_Indian_Cinimas),
                      ],
                    ),
                    scrollNotifier.value == true
                        ? Container(
                            color: KBlack.withOpacity(0.5),
                            height: 104,
                            width: double.infinity,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 1000),
                                      height: 50,
                                      width: 50,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image.network(
                                          neflix_logo,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        // print(MovieDB().getAllMovies());
                                      },
                                      icon: const Icon(Icons.cast),
                                      color: Colors.white,
                                      iconSize: 35,
                                    ),
                                    Kwidth,
                                    SizedBox(
                                      height: 38,
                                      width: 38,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          child: Image.network(
                                              "https://i.pinimg.com/originals/2b/90/0d/2b900d5612554cd0b5edf7d8e848c3ea.png")),
                                    ),
                                    Kwidth
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "TV Shows",
                                      style: ScrollViewTextStyle_HomePage,
                                    ),
                                    Text(
                                      "Movies",
                                      style: ScrollViewTextStyle_HomePage,
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (ctx) => Categories());
                                        },
                                        child: Text(
                                          "Categories",
                                          style: TextStyle(
                                              color: Kwhite,
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ],
                                )
                              ],
                            ),
                          )
                        : Khight
                  ],
                ),
              ),
            );
          }),
    );
  }
}
