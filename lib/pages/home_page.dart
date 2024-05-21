import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "assets/balloning.png": "balloning",
    "assets/hiking.png": "hiking",
    "assets/kayaking.png": "kayaking",
    "assets/snorkling.jpg": "snorkling"
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(body: BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        if (state is LoadedState) {
          var info = state.places;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //menu text
              Container(
                padding: const EdgeInsets.only(top: 70, left: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.black54,
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.5)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              //discover text
              Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: AppLargeText(text: "Discover")),
              SizedBox(
                height: 20,
              ),
              //tabbar
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                      unselectedLabelColor: Colors.grey,
                      labelColor: Colors.black,
                      controller: _tabController,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator:
                          CircleTabIndicator(color: Colors.black38, radius: 4),
                      tabs: [
                        Tab(text: "Places"),
                        Tab(text: "Inspiration"),
                        Tab(text: "Imotions"),
                      ]),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                height: 300,
                width: double.maxFinite,
                child: TabBarView(controller: _tabController, children: [
                  ListView.builder(
                    itemCount: info.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 15, top: 10),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "http://mark.bslmeiyu.com/uploads/" +
                                        info[index].img),
                                fit: BoxFit.cover)),
                      );
                    },
                  ),
                  Text("There"),
                  Text("Bye")
                ]),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLargeText(
                      text: "Explore more",
                      size: 22,
                    ),
                    AppText(
                      text: "See all",
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 90,
                width: double.maxFinite,
                margin: const EdgeInsets.only(left: 30),
                child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: Column(
                          children: [
                            Container(
                              //margin: const EdgeInsets.only(right: 50),
                              width: 65,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          images.keys.elementAt(index)),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              child: AppText(
                                text: images.values.elementAt(index),
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          );
        } else {
          return Container();
        }
      },
    ));
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
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
        configuration.size!.width / 2, configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
