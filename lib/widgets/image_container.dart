import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/pages/nav_page/main_page.dart';

import '../misc/colors.dart';
import 'app_text.dart';
class ImageContainer extends StatelessWidget {
  String place_name;
  String image_path;
  ImageContainer({Key? key,required this.place_name,required this.image_path }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 80,
            width: 230,
            decoration: BoxDecoration(
              color: AppColors.mainColor.withOpacity(0.4),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: AppText(text:place_name, size: 20,)),
          ),
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(image_path),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
