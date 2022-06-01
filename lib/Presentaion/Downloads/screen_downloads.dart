import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/Presentaion/widgets/common_App_bar.dart';
import 'package:netflix/core/colors/Constants.dart';
import 'package:netflix/core/colors/Strings.dart';
import 'package:netflix/main.dart';

class screen_downloads extends StatelessWidget {
  screen_downloads({Key? key}) : super(key: key);

  final List imagelist = [
    "https://www.themoviedb.org/t/p/w220_and_h330_face/a0Vt3wx8ciKmPt4iXPx9sH4HBVU.jpg",
    "https://www.themoviedb.org/t/p/w220_and_h330_face/2MTGip0nfahQ1jPQCZSfCsPBZes.jpg",
    "https://www.themoviedb.org/t/p/w220_and_h330_face/zPIug5giU8oug6Xes5K1sTfQJxY.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(80),
              child: commen_app_bar(
                AppBarTitile: "Downloads",
              )),
          body: ListView(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Icon(
                    Icons.settings,
                    color: Kwhite,
                  ),
                  Kwidth,
                  Text(
                    "Smart Downloads",
                    style: GoogleFonts.montserrat(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              Khight,
              Text(
                "Introducing Downloads for You",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    fontSize: 24, fontWeight: FontWeight.w800),
              ),
              Khight,
              Text(
                "We Will Download a Personalized Selection of Movies and Shows for You,so there's\n always something to watch on your\n device",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    fontSize: 17,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500),
              ),
              Container(
                height: size.width * 0.90,
                width: size.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Center(
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 52, 49, 49),
                        radius: size.width * 0.37,
                      ),
                    ),
                    Downloads_image_widget(
                        imagelist:Base_URL+South_Indian_Cinimas[2]['poster_path'].toString(),
                        angle: 18,
                        margin: EdgeInsets.only(left: 200, bottom: 35),
                        height_of_card: 0.50,
                        width_of_card: 0.3),
                    Downloads_image_widget(
                        imagelist:  Base_URL+South_Indian_Cinimas[1]['poster_path'].toString(),
                        angle: -18,
                        margin: EdgeInsets.only(right: 200, bottom: 35),
                        height_of_card: 0.50,
                        width_of_card: 0.3),
                    Downloads_image_widget(
                        imagelist: Base_URL+South_Indian_Cinimas[4]['poster_path'].toString(),
                        angle: 0,
                        margin: EdgeInsets.only(left: 0, top: 5),
                        height_of_card: 0.56,
                        width_of_card: 0.4)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: MaterialButton(
                  shape: material_button_shape,
                  onPressed: () {},
                  child: Text(
                    "Set up",
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Kwhite),
                  ),
                  color: KButtonColorBlue,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 45, right: 45),
                child: MaterialButton(
                  shape: material_button_shape,
                  onPressed: () {},
                  child: Text(
                    "See What  You Can Download",
                    style: GoogleFonts.montserrat(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: KBlack),
                  ),
                  color: KButtonColorWhite,
                ),
              )
            ],
          )),
    );
  }
}

class Downloads_image_widget extends StatelessWidget {
  const Downloads_image_widget({
    Key? key,
    required this.imagelist,
    required this.angle,
    required this.margin,
    required this.height_of_card,
    required this.width_of_card,
  }) : super(key: key);

  final String imagelist;
  final double angle;
  final EdgeInsets margin;
  final double height_of_card;
  final double width_of_card;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        height: size.width * height_of_card,
        width: size.width * width_of_card,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            imagelist,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
