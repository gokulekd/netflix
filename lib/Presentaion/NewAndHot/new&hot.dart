import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/Presentaion/Fast%20Laugh/widgets/video_list_item.dart';
import 'package:netflix/Presentaion/widgets/VideoWidget.dart';
import 'package:netflix/core/colors/Constants.dart';
import 'package:netflix/main.dart';
import 'widgets/ComingSoon/comingSoonMain.dart';

class screen_new_and_hot extends StatefulWidget {
  const screen_new_and_hot({Key? key}) : super(key: key);

  @override
  State<screen_new_and_hot> createState() => _screen_new_and_hotState();
}

class _screen_new_and_hotState extends State<screen_new_and_hot> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text("New & Hot",
                style: GoogleFonts.montserrat(
                    fontSize: 30, fontWeight: FontWeight.w800)),
            actions: [
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
                        "https://i.pinimg.com/originals/2b/90/0d/2b900d5612554cd0b5edf7d8e848c3ea.png"),),
              ),
              Kwidth
            ],
            bottom: TabBar(
                indicator: BoxDecoration(
                    color: Kwhite, borderRadius: BorderRadius.circular(30)),
                labelColor: KBlack,
                labelStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                unselectedLabelColor: Kwhite,
                tabs: const [
                  Tab(
                    text: "🍿 Coming Soon",
                  ),
                  Tab(
                    text: "👀 Everyone's Watching",
                  )
                ]),
          ),
          body: TabBarView(children: [
            _build_ComingSoon_tabar_View(context),
            _build_Everyones_watching_tabar_View(),
          ])),
    );
  }

  Widget _build_ComingSoon_tabar_View(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: ((context, index) {
         

          return ComingSoonWidget(index: index ,);
        }),
      ),
    );
  }

  _build_Everyones_watching_tabar_View() {
    return ListView.builder(itemBuilder: ((context, index) {
      return EveryOne_Watching_Widget(index: index,);
    }));
  }
}

class EveryOne_Watching_Widget extends StatelessWidget {
  final index;
  const EveryOne_Watching_Widget({
    Key? key,required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Khight,
         Text(
          Tensed_dramas[index]['title'],
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Khight,
        Text(
           Tensed_dramas[index]['overview'],
            style: TextStyle(color: Colors.grey)),
        Khight,
        Khight,
         VideoWidget(index: index,listName:Tensed_dramas ),
        Khight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            actionButtons_fastlaugh(
                iconName: FontAwesomeIcons.telegram, iconTitle: "Share"),
            actionButtons_fastlaugh(
                iconName: FontAwesomeIcons.plus, iconTitle: "My List"),
            actionButtons_fastlaugh(
                iconName: FontAwesomeIcons.play, iconTitle: "Play"),
            Kwidth,
          ],
        )
      ],
    );
  }
}
