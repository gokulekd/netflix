import 'package:flutter/cupertino.dart';
import 'package:netflix/Presentaion/search/Search_screen.dart';
import 'package:netflix/core/colors/Constants.dart';

import '../../../core/colors/Strings.dart';

final image_url =
    "https://www.themoviedb.org/t/p/w220_and_h330_face/sKCr78MXSLixwmZ8DyJLrpMsd15.jpg";
final image_url1 =
    "https://www.themoviedb.org/t/p/w220_and_h330_face/wJJt1HG62h3WoGnLcRIbO2nNNkg.jpg";

class screen_search_result extends StatelessWidget {
  const screen_search_result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      mainAxisSpacing: 5,
      crossAxisSpacing: 8,
      childAspectRatio: 1 / 1.4,
      children: List.generate(20, (index) {
        return MainCard(
          ListName: image_url,
        );
      }),
    );
  }
}

class MainCard extends StatelessWidget {
  final String ListName;
  const   MainCard({Key? key, required this.ListName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: SizedBox(
        height: 190,
        width: 120,
        child: ClipRRect(
          borderRadius: cardBorder,
          child: Image.network(
            Base_URL+ ListName,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
