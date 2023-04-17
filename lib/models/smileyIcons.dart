import 'package:flutter/material.dart';

import '../screens/visiting_screen.dart';

Color iconColor = Colors.green;
String? iconName;

class smileyIcon extends StatefulWidget {
  smileyIcon({Key? key, required color, required icon}) : super(key: key);

  @override
  State<smileyIcon> createState() => _smileyIconState();
}

class _smileyIconState extends State<smileyIcon> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
        color: iconColor,
        onPressed: () {
          setState(() {
            if (iconColor == Colors.green) {
              iconColor = Colors.grey;
            } else {
              iconColor = Colors.green;
            }
          });
        },
        icon: const Icon(Icons.add, size: 50),
      ),
    );
  }
}
