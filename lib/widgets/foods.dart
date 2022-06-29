import 'package:flutter/material.dart';
import '../misc/colors.dart';
import 'app_text.dart';
import 'image_container.dart';

class NationalFoods extends StatelessWidget {
  NationalFoods({Key? key}) : super(key: key);
  var informs = {
    'Plov': 'assets/foods/osh.jpg',
    'Manty': 'assets/foods/manti.jpg',
    'Samsa': 'assets/foods/samsa.jpg',
    'Shashlik': 'assets/foods/shashlyk.jpg',
    'Laghman': 'assets/foods/laghman.jpg',
    'Bread(Tandyr Nan)': 'assets/foods/bread.jpg',
    'Uzbek Tea': 'assets/foods/uzbekistan-tea.jpg',
    'Beshbarmak': 'assets/foods/beshbarmak.jpg',
    'Norin':'assets/foods/norin.jpg',
    'Tandyr':'assets/foods/tandyr.jpg',
  };
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor.withOpacity(0.6),
        title: Center(
          child: AppText(text: 'Uzbek National Foods', size: 20, color: Colors.white,),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 15),
        child: ListView.builder(
          itemCount: informs.length,
          itemBuilder: (BuildContext context, int index) {
            return ImageContainer(
              place_name: informs.keys.elementAt(index),
              image_path: informs.values.elementAt(index),
            );
          },
        ),
      ),
    );
  }
}
