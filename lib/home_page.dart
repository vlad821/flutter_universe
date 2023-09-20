import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/detail_page.dart';
//import 'package:flutter_application_1/detail_page.dart';
import 'data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [gradientStartColor, gradientEndColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.7])),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16, bottom: 5),
                child: Column(
                  children: <Widget>[
                    const Text(
                      'Explore',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 44,
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    DropdownButton(
                      items: const [
                        DropdownMenuItem(
                          child: Text(
                            'Solar System',
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 24,
                              color: Color(0x7cdbf1ff),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                      onChanged: (value) {},
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Image.asset('assets/drop_down_icon.png'),
                      ),
                      underline: SizedBox(),
                    ),
                  ],
                ),
              ),
              Container(
                height: 450,
                padding: EdgeInsets.only(left: 32),
                child: Swiper(
                  itemCount: planets.length,
                  itemWidth: MediaQuery.of(context).size.width -
                      ((MediaQuery.of(context).size.width) / 4),
                  layout: SwiperLayout.STACK,
                  pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      activeSize: 10,
                      space: 5,
                      activeColor: secondaryTextColor,
                    ),
                  ),
                  itemBuilder: (context, index) {
                    final planet = planets[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, a, b) => DetailPage(
                                      planetInfo: planets[index],
                                    )));
                      },
                      child: Stack(
                        children: <Widget>[
                          // SizedBox(height: 75),
                          Column(
                            children: <Widget>[
                              SizedBox(height: 180),
                              Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(40),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // SizedBox(height: 100),
                                      Text(
                                        planet.name,
                                        style: const TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 44,
                                          color: Color(0xFF414C6B),
                                          fontWeight: FontWeight.w900,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      const Text(
                                        'Solor Systems',
                                        style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 15,
                                          color: Color(0xFF414C6B),
                                          fontWeight: FontWeight.w900,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          const Text(
                                            'Know more',
                                            style: TextStyle(
                                              fontFamily: 'Avenir',
                                              fontSize: 22,
                                              color: Color(0xFFE4979E),
                                              fontWeight: FontWeight.w900,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Icon(Icons.arrow_forward,
                                              color: secondaryTextColor),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Hero(
                            tag: planets[index].position,
                            child: Image.asset(planets[index].iconImage)),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(36),
          ),
          //  color: titleTextColor,
        ),
        //   padding: EdgeInsets.all(24),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                  onPressed: () {}, icon: Image.asset('assets/menu_icon.png')),
              IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/search_icon.png')),
              IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/profile_icon.png'))
            ]),
      ),
    );
  }
}
