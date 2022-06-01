import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix/core/colors/Strings.dart';

import '../../core/colors/Constants.dart';

class VideoWidget extends StatelessWidget {
  final int index;
  final listName;
   VideoWidget({
    Key? key,
    required this.index,
    required this.listName
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: ClipRRect(
            child: Image.network(
              Base_URL+listName[index]['backdrop_path'].toString()
               ),
          ),
        ),
        Positioned(
            bottom: 10,
            right: 20,
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.volumeXmark,
                  color: Kwhite,
                )))
      ],
    );
  }
}
