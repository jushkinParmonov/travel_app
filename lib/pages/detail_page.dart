import 'package:flutter/material.dart';
import 'package:untitled2/misc/colors.dart';
import 'package:untitled2/widgets/app_buttons.dart';
import 'package:untitled2/widgets/app_large_text.dart';
import 'package:untitled2/widgets/responsive_button.dart';

import '../widgets/app_text.dart';
class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int gottenStars = 4;
  int selectedButton = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/mountain1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    iconSize: 35,
                  ),
                  // Icon(
                  //   Icons.star,
                  //   color: Colors.grey,
                  // ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.37,
              child: Container(
                padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                            text: 'Zomin',
                            size: 25,
                            color: Colors.black.withOpacity(0.8)),
                        AppLargeText(
                            text: '\$50', size: 25, color: AppColors.mainColor),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on,
                            color: AppColors.mainColor, size: 15),
                        const SizedBox(width: 3),
                        AppText(
                          text: 'Uzbekistan, Jizzakh',
                          size: 15,
                          color: AppColors.textColor1,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                                (index) {
                              return Icon(
                                Icons.star,
                                color: index < gottenStars
                                    ? AppColors.starColor
                                    : AppColors.textColor2,
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        AppText(
                            text: '(4.0)',
                            color: AppColors.textColor2,
                            size: 20),
                      ],
                    ),
                    const SizedBox(height: 25),
                    AppLargeText(
                      text: 'Foydalanuvchilar',
                      size: 20,
                      color: Colors.black.withOpacity(0.8),
                    ),
                    const SizedBox(height: 5),
                    AppText(
                      text: 'Odam soni',
                      color: AppColors.mainColor,
                      size: 15,
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      children: List.generate(
                        5,
                            (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedButton = index;
                              });
                            },
                            child: AppButtons(
                              text: index + 1,
                              size: 50,
                              color: selectedButton == index
                                  ? Colors.white
                                  : Colors.black,
                              backgrounColor: selectedButton == index
                                  ? Colors.black
                                  : AppColors.textColor2,
                              borderColor: selectedButton == index
                                  ? Colors.black
                                  : AppColors.buttonBackground,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    AppLargeText(
                      text: 'Shart-Sharoitlari',
                      color: Colors.black.withOpacity(0.8),
                      size: 20,
                    ),
                    const SizedBox(height: 5),
                    AppLargeText(
                      text: 'Ichkilik va zinoga ruxsat yo\'q!',
                      size: 15,
                    ),
                    const SizedBox(height: 5),
                    AppText(
                      text:
                      '5 ta xona va 15 kishi uchun dam olishga joy, 1 ta karavat, Smart televizor, yozgi va qishki oshxonalar,1 ta Intex basseyn,Wi-Fi.',
                      size: 15,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  AppButtons(
                    color: AppColors.textColor1,
                    backgrounColor: Colors.white,
                    borderColor: AppColors.textColor1,
                    size: 60,
                    isIcon: true,
                    icon:Icons.favorite_border,
                  ),
                  ResponsiveButton(isResponsive: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}