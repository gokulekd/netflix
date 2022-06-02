import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix/Presentaion/Fast%20Laugh/widgets/video_list_item.dart';
import 'package:netflix/Presentaion/Home/widgets/Number_tile_card.dart';
import 'package:netflix/core/colors/Constants.dart';
import 'package:netflix/core/colors/Strings.dart';
import 'package:netflix/main.dart';
import '../../widgets/Main_title.dart';



class large_tile_homepage extends StatelessWidget {
  final index;
  large_tile_homepage({
    Key? key,required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder(
          future: movieload_pro(),
          builder: (context, AsyncSnapshot<dynamic>movie_data){
            print(movie_data.data);
            if(movie_data.data== null){
             return Container(
               height: 600,
               width: double.infinity,
               child: Center(
                 child: SizedBox(
                   height: 50,
                   width: 50,
                   child: CircularProgressIndicator()),
               ));
            }
            else{
                return Container(
            
              height: 600,
              width: double.infinity,
              child:
               ClipRRect(
                  child: Image.network(
                    Base_URL+movie_data.data[1]['poster_path'],
                fit: BoxFit.cover,
              )),
            );
            }
          
          }
        ),
        Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                actionButtons_fastlaugh(
                    iconName: Icons.add, iconTitle: "My List"),
                TextButton.icon(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Kwhite)),
                    onPressed: () async {
                
                    },
                    icon: Icon(
                      FontAwesomeIcons.play,
                      color: KBlack,
                    ),
                    label: Text(
                      "Play",
                      style: TextStyle(color: KBlack),
                    )),
                GestureDetector(
                  onTap: () {},
                  child: actionButtons_fastlaugh(
                      iconName: Icons.info_outline_rounded, iconTitle: "info "),
                ),
              ],
            ))
      ],
    );
  }
}

class Number_tile_widget extends StatelessWidget {
  final Listrecived;
  Number_tile_widget({Key? key, required this.Listrecived}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: MainTitle(Name_of_list: " Top 10 TV Shows In India Today"),
        ),
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              Listrecived.length,
              (index) {
                return Number_tile_card(
                  tiledata: Listrecived[index]['poster_path'],
                  index: index,
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
