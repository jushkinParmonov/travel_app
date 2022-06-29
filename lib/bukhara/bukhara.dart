import 'package:flutter/material.dart';
import 'package:untitled2/bukhara/bukhara_home.dart';
import 'package:untitled2/bukhara/bukhara_hotel.dart';

import '../misc/colors.dart';
import '../widgets/app_text.dart';
class Bukhara extends StatefulWidget {
  const Bukhara({Key? key}) : super(key: key);

  @override
  _BukharaState createState() => _BukharaState();
}

class _BukharaState extends State<Bukhara> {

  int currentIndex = 0;
  List pages = [
    BukharaHome(),
    BukharaHotel(),
  ];
  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(0.4   ),
        title: Center(
          child: AppText(text: 'Travel to Uzbekistan', size: 20, color: Colors.white,),
        ),
      ),
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue.withOpacity(0.5),
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: const[
          BottomNavigationBarItem(label:'Home',icon: Icon(Icons.apps)),
          BottomNavigationBarItem(label:'My',icon: Icon(Icons.hotel)),
        ],
      ),
    );
  }
}
