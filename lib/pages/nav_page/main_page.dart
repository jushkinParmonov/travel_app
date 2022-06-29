import 'package:flutter/material.dart';
import 'package:untitled2/pages/home_page.dart';
import 'package:untitled2/pages/nav_page/hotel_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List p = [
    'Buxoro',
    'Samarqand',
    'Xorazm',
  ];

  int currentIndex = 0;
  List pages = [
    HomePage(),
    HotelPage(),
  ];
  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          BottomNavigationBarItem(label:'My',icon: Icon(Icons.hotel_rounded)),
        ],
      ),
    );
  }
}