import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix/Presentaion/widgets/Main_title.dart';
import 'package:netflix/Presentaion/search/widgets/screen_serach_resultScreen.dart';
import 'package:netflix/core/colors/Strings.dart';
import 'package:netflix/main.dart';

import '../../core/colors/Constants.dart';

class Main_title_card extends StatelessWidget {
  final String TitleName;
  List list_name;

  Main_title_card({Key? key, required this.TitleName, required this.list_name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: MainTitle(Name_of_list: TitleName),
          ),
          LimitedBox(
            maxHeight: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                list_name.length,
                (index) {
                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SizedBox(
                          height: 190,
                          width: 120,
                          child: ClipRRect(
                            borderRadius: cardBorder,
                            child: Image.network(
                              Base_URL + list_name[index]['poster_path'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                     
                      
                    ],
                  );
                },
              ),
            ),
          )
        ],
      );
    });
  }
}
