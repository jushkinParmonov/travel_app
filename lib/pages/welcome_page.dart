import 'package:flutter/material.dart';
import 'package:untitled2/bukhara/bukhara.dart';
import 'package:untitled2/misc/colors.dart';
import 'package:untitled2/pages/nav_page/main_page.dart';
import 'package:untitled2/widgets/app_large_text.dart';
import 'package:untitled2/widgets/app_text.dart';
import 'package:untitled2/widgets/responsive_button.dart';

import '../widgets/informs.dart';
class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List image = [
    'assets/bukhara.jpg',
    'assets/samarkand.jpg',
    'assets/khorezm.jpg',
  ];
  Map<String, String> words = {
    'Bukhara': Information.bukhara,
    'Samarkand': Information.samarkand,
    'Khorezm': Information.khorezm,
  };
  List color = [
    Colors.white,
    Colors.black.withOpacity(0.9),
    Colors.white,
  ];
  List pages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: image.length,
        itemBuilder: (_, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  image[index],
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 130, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(
                        text: 'Travel to',
                        color: color[index],
                      ),
                      AppText(
                        text: words.keys.elementAt(index),
                        color: color[index],
                      ),
                      const SizedBox(height: 40),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => Bukhara(),
                            ),
                          );
                        },
                        child: ResponsiveButton(width: 120),
                      ),
                    ],
                  ),
                  Column(
                    children: List.generate(3, (indexDots) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        width: 8,
                        height: index == indexDots ? 25 : 12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: index == indexDots
                              ? AppColors.mainColor
                              : Colors.white,
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}