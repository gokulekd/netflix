import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix/core/colors/Constants.dart';
import 'package:netflix/core/colors/Strings.dart';
import 'package:netflix/main.dart';

final imageurl =
    "https://www.themoviedb.org/t/p/w250_and_h141_face/3Rfvhy1Nl6sSGJwyjb0QiZzZYlB.jpg";

class screen_idle_searchBar extends StatelessWidget {
  const screen_idle_searchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: ((context, index) => TopsearchItemWidgetTile(index: index,)),
        separatorBuilder: ((context, index) => Khight),
        itemCount: Tensed_dramas.length);
  }
}

class TopsearchItemWidgetTile extends StatelessWidget {
  final index;
  const TopsearchItemWidgetTile({Key? key,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          height: size.width * 0.20,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child:
             Image.network(
              Base_URL+Tensed_dramas[index]["backdrop_path"].toString(),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
             Tensed_dramas[index]["title"],
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.circlePlay,
              color: Kwhite,
              size: 35,
            )),
      ],
    );
  }
}
