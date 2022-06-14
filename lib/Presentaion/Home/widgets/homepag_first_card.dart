import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix/Presentaion/widgets/Main_title.dart';

import '../../../core/colors/Constants.dart';
import '../../../core/colors/Strings.dart';

class homepage_First_card extends StatelessWidget {
  final String TitleName;
  List list_name;

  homepage_First_card({Key? key, required this.TitleName, required this.list_name})
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
                      Positioned(
                        top: 70,
                        left: 4,
                        child: Container(
                            height: 130,
                            width: 122,
                    
                            child: Align(
                                alignment: Alignment.topCenter,
                                child: Icon(
                                  FontAwesomeIcons.circlePlay,
                                  color: Kwhite,
                                  size: 40,
                                ))),
                      ),

                      Positioned(
                           top: 147.9,
                        left: 4,

                        child: Container(
                                  height:2 ,
                                  width: index % 2 == true? 50:80,
                                  color: Colors.red,
                                ),
                      ),
                      Positioned(
                           top: 150,
                        left: 4,
                        child: Align(
                          alignment: Alignment.topCenter,
                        
                          child: Container(
                          
                        
                            height: 65,
                            width: 122,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(2),bottomRight: Radius.circular(2))
                              
                            ),
                          ),
                        ),
                      ),

                    Positioned(
                      top: 160,
                      left: 90,

                     
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.more_vert_rounded,color: Kwhite,),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.info,color: Kwhite,),
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