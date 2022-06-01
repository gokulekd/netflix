import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix/Presentaion/Home/widgets/Large_tile_homepage.dart';
import 'package:netflix/Presentaion/NewAndHot/widgets/ComingSoon/actionButton_comingSoon.dart';
import 'package:netflix/Presentaion/widgets/VideoWidget.dart';
import 'package:netflix/main.dart';

import '../../../../core/colors/Constants.dart';

class ComingSoonWidget extends StatefulWidget {
  final int index;

  
   ComingSoonWidget({
    Key? key,
  
  
    required this.index
  
  }) : super(key: key);

  @override
  State<ComingSoonWidget> createState() => _ComingSoonWidgetState();
}

class _ComingSoonWidgetState extends State<ComingSoonWidget> {
  @override
 
  @override
  Widget build(BuildContext context) {
   // print(widget.movie_data[widget.index]['original_title'].toString());
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 500,
          child: Column(
            children: const [
              Text(
                "FEB",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              Text(
                "11",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        SizedBox(
          height: 500,
          width: size.width - 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(index: widget.index,listName: South_Indian_Cinimas),
              Row(
                children: [
                   Container(
                     height: 40,
                     width: 200,
            
                     child: Text(
               
                 South_Indian_Cinimas[widget.index]["title"].toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,),
                  ),
                   ),
                  const Spacer(),
                  Row(
                    children: const [
                      newAndHot_comingSoon_actionButton(
                          iconName: FontAwesomeIcons.bell,
                          iconTitle: "RemaindMe"),
                      newAndHot_comingSoon_actionButton(
                          iconName: FontAwesomeIcons.circleInfo,
                          iconTitle: "Info"),
                    ],
                  )
                ],
              ),
              const Text(
                "Coming On Fridary",
              ),
              Khight,
               Text(
                South_Indian_Cinimas[widget.index]["title"].toString(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Khight,
               Text(
                South_Indian_Cinimas[widget.index]["overview"].toString(),
                     overflow: TextOverflow.ellipsis,
                        maxLines: 8,
                  style: TextStyle(color: Colors.grey)),
              Khight,
            ],
          ),
        ),
      ],
    );
  }
}
