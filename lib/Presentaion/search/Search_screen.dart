import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix/Presentaion/search/widgets/screen_idle_seaarchBar.dart';
import 'package:netflix/Presentaion/search/widgets/screen_serach_resultScreen.dart';
import 'package:netflix/core/colors/Constants.dart';

class screen_search extends StatelessWidget {
  const screen_search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                backgroundColor: Colors.grey.withOpacity(0.5),
                prefixIcon: Icon(
                  FontAwesomeIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon:
                    Icon(FontAwesomeIcons.circleXmark, color: Colors.grey),
                style: TextStyle(color: Colors.white),
              ),
              titile_for_search_screen(Name_of_list: "Top Searches"),
              Expanded(child: screen_idle_searchBar()),
              titile_for_search_screen(Name_of_list: "Movies & TV"),
              Expanded(child: screen_search_result()),
            ],
          ),
        ),
      ),
    );
  }
}

class titile_for_search_screen extends StatelessWidget {
  const titile_for_search_screen({Key? key, required this.Name_of_list})
      : super(key: key);

  final Name_of_list;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Text(
        Name_of_list,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
