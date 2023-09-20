import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/data.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.planetInfo}) : super(key: key);

  final PlanetInfo planetInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: gradientEndColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                         SizedBox(height:300 ),
                        Text(
                          planetInfo.name,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 56,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                         Text(
                          'Solar System',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Divider(color: Colors.black38),
                        SizedBox(height: 32),
                        Text(
                          planetInfo.description,
                         maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                          style:  TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 15,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        const Divider(color: Colors.black38),
                        const Text(
                          "Gallery",
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 12,
                            color: Color.fromARGB(255, 24, 2, 2),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Container(
                            height: 250,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: planetInfo.images.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: AspectRatio(
                                      aspectRatio: 1,
                                      child: Image.network(
                                          planetInfo.images[index],
                                          fit: BoxFit.cover),
                                    ),
                                  );
                                }))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: -70,
              
              child: Hero(
                tag: planetInfo.position,
                child:Image.asset(planetInfo.iconImage)),
            ),
 Positioned(
  top: 30,
  left: 32,
  child: Text(
    planetInfo.position.toString(), // Corrected line
    style: TextStyle(
           // color: Colors.black.withOpacity(0.08),

      fontFamily: 'Avenir',
      fontSize: 240,
     color: primaryTextColor.withOpacity(0.4),
      fontWeight: FontWeight.w900,
    ),
    textAlign: TextAlign.left,
  ),
),

            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios)),
          ],
        ),
      )
    );
  }
}
