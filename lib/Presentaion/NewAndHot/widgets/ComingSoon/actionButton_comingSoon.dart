import 'package:flutter/material.dart';

import '../../../../core/colors/Constants.dart';

class newAndHot_comingSoon_actionButton extends StatelessWidget {
  final IconData iconName;
  final String iconTitle;
  const newAndHot_comingSoon_actionButton(
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
              size: 16,
              color: Kwhite,
            ),
            Text(
              iconTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
