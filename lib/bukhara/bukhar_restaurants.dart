import 'package:flutter/material.dart';

import '../misc/colors.dart';
import '../widgets/app_text.dart';
import '../widgets/image_container.dart';
class BukharaRes extends StatelessWidget {
  const BukharaRes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var informs = {
      'Restaurant Minzifa':'assets/bukhara/minzifa.jpg',
      '\'Old Bukhara\' Restaurant':'assets/bukhara/old_res.jpg',
      'Restaurant Amulet':'assets/bukhara/amulet.jpg',
      'Bella Italia':'assets/bukhara/bella_italia.jpg',
      'Lyabi Hauz Bukhara':'assets/bukhara/lyabi_hauz_res.jpg',
      'Silk Road Tea House':'assets/bukhara/silk_road.jpg',
      'Cafe Wishbone':'assets/bukhara/cafe_wishbone.jpg',
      '\'The Old House\' Restaurant':'assets/bukhara/old_res.jpg',
      'Chor Bakr':'assets/bukhara/minzifa.jpg',
    };
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor.withOpacity(0.6),
        title: Center(
          child: AppText(text: 'Restaurants in Bukhara', size: 20, color: Colors.white,),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 15),
        child: ListView.builder(
          itemCount: informs.length,
          itemBuilder: (BuildContext context, int index) {
            return ImageContainer(place_name: informs.keys.elementAt(index), image_path: informs.values.elementAt(index));
          },
        ),
      ),
    );
  }
}
