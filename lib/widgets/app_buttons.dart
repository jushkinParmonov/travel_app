import 'package:flutter/material.dart';

import '../misc/colors.dart';

class AppButtons extends StatelessWidget {
  double size;
  int? text;
  IconData? icon;
  final Color color;
  final Color backgrounColor;
  final Color borderColor;
  bool? isIcon;

  AppButtons({
    Key? key,
    this.isIcon = false,
    this.text,
    this.icon,
    required this.color,
    required this.backgrounColor,
    required this.borderColor,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15),
        color: backgrounColor,
      ),
      child: isIcon == false
          ? Center(child: Text('$text',style: TextStyle(color: color),),)
          : Center(
              child: Icon(
                icon,
                color: color,
              ),
            ),
    );
  }
}
