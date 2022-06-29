import 'package:flutter/material.dart';
import 'package:untitled2/bukhara/bukhar_restaurants.dart';
import 'package:untitled2/bukhara/bukhara_historic.dart';
import 'package:untitled2/bukhara/bukhara_shrine.dart';
import 'package:untitled2/widgets/foods.dart';
import '../misc/colors.dart';
import '../widgets/app_large_text.dart';
import '../widgets/app_text.dart';

class BukharaHome extends StatefulWidget {
  const BukharaHome({Key? key}) : super(key: key);

  @override
  _BukharaHomeState createState() => _BukharaHomeState();
}

class _BukharaHomeState extends State<BukharaHome>
    with TickerProviderStateMixin {
  var images = {
    'assets/ark.jpg': 'Historic places',
    "assets/naqshbandiy.jpg": 'Shrines',
    'assets/foods/osh.jpg': 'National foods',
    'assets/res.jpg': 'Restaurants',
  };

  List places = [
    'assets/bukhara1.jpg',
    'assets/bukhara2.jpg',
    'assets/afandi.jpg',
    'assets/bukhara3.jpg',
    'assets/ark.jpg',
  ];
  List hotels = [
    'assets/bukhara_h1.jpg',
    'assets/bukhara_h2.jpg',
    'assets/bukhara_h3.jpg',
  ];
  List pages = [
    BukharaHistoric(),
    BukharaShrines(),
    NationalFoods(),
    BukharaRes(),
  ];
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30, left: 20),
            child: AppLargeText(text: 'Bukhara'),
          ),
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              labelPadding: const EdgeInsets.only(left: 20, right: 20),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              controller: _tabController,
              isScrollable: true,
              indicator:
                  CircleTabIndicator(color: AppColors.mainColor, radius: 4),
              tabs: const [
                Tab(text: 'Photos'),
                Tab(text: 'Hotels'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: places.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(top: 10, right: 15),
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage(places[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                ListView.builder(
                  itemCount: hotels.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(top: 10, right: 15),
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage(hotels[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(text: 'Information', size: 22),
                //AppText(text: 'See all', size: 18, color: AppColors.textColor1),
              ],
            ),
          ),
          Container(
            height: 120,
            width: double.maxFinite,
            margin: const EdgeInsets.only(top: 10, left: 20),
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => pages[index],
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 50),
                    child: Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage(images.keys.elementAt(index)),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 7),
                          child: AppText(
                              text: images.values.elementAt(index), size: 15),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
