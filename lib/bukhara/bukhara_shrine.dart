import 'package:flutter/material.dart';
import '../misc/colors.dart';
import '../widgets/app_text.dart';
import '../widgets/image_container.dart';
class BukharaShrines extends StatelessWidget {
  BukharaShrines({Key? key}) : super(key: key);
  var informs = {
    'Bolo Khauz Mosque':'assets/bolo_hauz.jpg',
    'Once The Educational Center of Central Asia':'assets/edu_center.jpg',
    'Miri_Arab Madrasah(1530)':'assets/mir_arab.jpg',
    'Ulughbek Madrasah(1417)':'assets/ulugbek_bukhara.jpg',
    'Abdullazizkhan Madrasah':'assets/abdulaziz.jpg',
    'Bahouddin Naqshband':'assets/naqshbandiy.jpg',
    'Attori Mosque':'assets/mosque.jpg',
    'Gozien Madrasah':'assets/emir.jpg',
    'Seven Saints of Bukhara':'assets/seven.jpeg',
  };
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor.withOpacity(0.6),
        title: Center(
          child: AppText(text: 'Shrines places in Bukhara', size: 20, color: Colors.white,),
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
