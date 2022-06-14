import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/Presentaion/search/widgets/screen_serach_resultScreen.dart';
import 'package:netflix/core/colors/Constants.dart';
import 'package:video_player/video_player.dart';

class video_list_item extends StatefulWidget {
  final int index;

   video_list_item({Key? key, required this.index}) : super(key: key);

  @override
  State<video_list_item> createState() => _video_list_itemState();
}

class _video_list_itemState extends State<video_list_item> {
  late VideoPlayerController _controller;
 @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(videos_fastLaugh[widget.index].toString());

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

@override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {

    
    return Stack(
      children: [
        SizedBox(
        child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(_controller),
                  ClosedCaption(text: _controller.value.caption.text),
                 
                  VideoProgressIndicator(_controller, allowScrubbing: true),
                ],
              ),
        
        ),

  
        Mutebutton_fastLaugh(),
        actionButtonPageView(),
      ],
    );
  }
}

class Mutebutton_fastLaugh extends StatelessWidget {
  const Mutebutton_fastLaugh({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: KBlack, borderRadius: BorderRadius.circular(100)),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.volumeXmark,
                  size: 20,
                  color: Kwhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class actionButtonPageView extends StatelessWidget {
  const actionButtonPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          circleAvatar_fastlaugh(avatarTitle: " LUDO", avatar_image: image_url),
          actionButtons_fastlaugh(
              iconName: Icons.emoji_emotions, iconTitle: " LOL"),
          actionButtons_fastlaugh(iconName: Icons.add, iconTitle: "My List"),
          actionButtons_fastlaugh(iconName: Icons.telegram, iconTitle: "share"),
          actionButtons_fastlaugh(
              iconName: Icons.play_arrow, iconTitle: "play"),
        ],
      ),
    );
  }
}

class actionButtons_fastlaugh extends StatelessWidget {
  final IconData iconName;
  final String iconTitle;

  const actionButtons_fastlaugh(
      {Key? key, required this.iconName, required this.iconTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Column(
          children: [
            Icon(
              iconName,
              size: 30,
              color: Kwhite,
            ),
            Text(
              iconTitle,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

class circleAvatar_fastlaugh extends StatelessWidget {
  final avatar_image;
  final avatarTitle;
  const circleAvatar_fastlaugh(
      {Key? key, required this.avatar_image, required this.avatarTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 50,
        width: 40,
        child: Stack(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: KBlack, borderRadius: BorderRadius.circular(100)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  avatar_image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 35,
              child: Text(
                avatarTitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                    color: Kwhite,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset.zero,
                        blurRadius: 5.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
