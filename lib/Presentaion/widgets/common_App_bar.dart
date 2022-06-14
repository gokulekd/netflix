import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors/Constants.dart';

class commen_app_bar extends StatelessWidget {
  final String AppBarTitile;
  // ignore: non_constant_identifier_names
  const commen_app_bar({Key? key, required this.AppBarTitile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.only(top: 35, left: 5),
      child: Row(
        children: [
          Text(AppBarTitile,
              style: GoogleFonts.montserrat(
                  fontSize: 30, fontWeight: FontWeight.w800)),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.cast),
            color: Colors.white,
            iconSize: 35,
          ),
          Kwidth,
          SizedBox(
            height: 38,
            width: 38,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: Image.network(
                    "https://i.pinimg.com/originals/2b/90/0d/2b900d5612554cd0b5edf7d8e848c3ea.png")),
          ),
          Kwidth
        ],
      ),
    );
  }
}
