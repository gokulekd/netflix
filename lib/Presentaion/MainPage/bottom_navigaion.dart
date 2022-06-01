import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

ValueNotifier<int> valueNotifier = ValueNotifier(0);

class Bottom_Navigation_Bar extends StatelessWidget {
  Bottom_Navigation_Bar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: valueNotifier,
        builder: (context, int newIndex, _) {
          return BottomNavigationBar(
            currentIndex: newIndex,
            onTap: (value) {
              valueNotifier.value = value;
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: const IconThemeData(color: Colors.white),
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.house,
                    size: 20,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.masksTheater,
                    size: 20,
                  ),
                  label: "New & Hot"),
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.faceSmile,
                    size: 20,
                  ),
                  label: "Fast Laughs"),
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    size: 20,
                  ),
                  label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.download,
                    size: 20,
                  ),
                  label: "Downloads"),
            ],
          );
        }
        );
  }
}
