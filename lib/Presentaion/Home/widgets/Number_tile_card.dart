import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/Presentaion/search/widgets/screen_serach_resultScreen.dart';
import 'package:netflix/Presentaion/widgets/Main_title.dart';
import 'package:netflix/core/colors/Constants.dart';

class Number_tile_card extends StatelessWidget {
  final int index;
   final tiledata;

   Number_tile_card({Key? key, required this.index,required this.tiledata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 210,
          width: 160,
        ),
        Positioned(left: 20, child: MainCard(ListName: tiledata)),
        Positioned(
          left: 0,
          top: 65,
          bottom: 0,
          child: BorderedText(
            strokeWidth: 3,
            strokeColor: Kwhite,
            child: Text(
              "${index + 1}",
              style: GoogleFonts.balooBhai2(
                  fontSize: 130, color: KBlack, fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ],
    );
  }
}
