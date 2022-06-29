import 'package:flutter/material.dart';
import 'package:untitled2/misc/colors.dart';
import 'package:untitled2/widgets/app_text.dart';
import 'package:untitled2/widgets/image_container.dart';

class BukharaHistoric extends StatelessWidget {
  BukharaHistoric({Key? key}) : super(key: key);
  var informs = {
    'Ark of Bukhara': 'assets/ark.jpg',
    'Samanid Mausoleum': 'assets/samoniylar.jpg',
    'Minorai Kalon': 'assets/bukhara1.jpg',
    'Lyabi Hauz': 'assets/lyabi_hauz.jpg',
    'Chor Minor': 'assets/chor_minor.jpg',
    'Hodja Nasredin': 'assets/afandi.jpg',
    'Old Bukhara': 'assets/old_bukhara.jpg',
    'Place of Last Emir of Bukhara': 'assets/emir.jpg',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor.withOpacity(0.6),
        title: Center(
          child: AppText(text: 'Historical places in Bukhara', size: 20, color: Colors.white,),
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
