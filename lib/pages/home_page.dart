import 'package:flutter/material.dart';
import 'package:untitled2/misc/colors.dart';
import 'package:untitled2/widgets/app_large_text.dart';
import 'package:untitled2/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.place}) : super(key: key);
  String? place;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  var images = {
    'assets/kayaking.jpg': 'Kayaking',
    "assets/ballooning.jpg":'Ballooning',
    'assets/hiking.jpg':'Hiking',
    'assets/snorkling.jpg':'Snorkeling',
  };

  List places = [
    'assets/mountain1.jpg',
    'assets/mountain2.jpg',
    'assets/mountain.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top:100,left: 20),
            child: AppLargeText(text:'Discover'),
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
              indicator: CircleTabIndicator(color: AppColors.mainColor, radius: 4),
              tabs: const [
                Tab(text: 'Places'),
                Tab(text: 'Inspiration'),
                Tab(text: 'Emotions'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: MediaQuery.of(context).size.height*0.4,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(top: 10, right: 15),
                      width: MediaQuery.of(context).size.width*0.5,
                      height: MediaQuery.of(context).size.height*0.5,
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
                Text('There'),
                Text('Bye'),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(text: 'Explore more', size: 22),
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
                return Container(
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
                        child: AppText(text: images.values.elementAt(index), size: 15),
                      ),
                    ],
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
