import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_app/ResponsiveWidget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/DestinationCarousel.dart';
import '../widgets/featured_tiles.dart';
import '../widgets/top_bar_contents.dart';

//https://blog.codemagic.io/flutter-web-getting-started-with-responsive-design/

final List<String> images = [
  //
  'assert/images/asia.jpeg',
  'assert/images/africa.jpeg',
  'assert/images/europe.jpeg',
  'assert/images/south_america.jpeg',
  'assert/images/australia.jpeg',
  'assert/images/antarctica.jpeg',
];

final List<String> places = [
  'ASIA',
  'AFRICA',
  'EUROPE',
  'SOUTH AMERICA',
  'AUSTRALIA',
  'ANTARCTICA',
];

class ZubexLandingPage extends StatefulWidget {
  const ZubexLandingPage({Key? key}) : super(key: key);

  @override
  _ZubexLandingPageState createState() => _ZubexLandingPageState();
}

class _ZubexLandingPageState extends State<ZubexLandingPage> {
  List _isHovering = [false, false, false, false, false, false, false];
  List _isSelected = [true, false, false, false, false, false, false];
  late Size screenSize;
  CarouselController _controller = CarouselController();
  int _current = 4;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles(screenSize);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 1000),
        child: TopBarContents(0.5),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: screenSize.height * 0.45,
                  width: screenSize.width,
                  child: Image.network(
                    'https://images.unsplash.com/photo-1611329532992-0b7ba27d85fb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bW91bnR8ZW58MHx8MHx8&w=1000&q=80',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: screenSize.height * 0.40,
                    left: ResponsiveWidget.isLargeScreen(context)
                        ? screenSize.width / 1
                        : screenSize.width / 8,
                    right: ResponsiveWidget.isLargeScreen(context)
                        ? screenSize.width / 1
                        : screenSize.width / 8,
                  ),
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Padding(
                            padding: EdgeInsets.all(30.0),
                            child: Text('Destination')),
                        Container(color: Colors.grey, height: 50, width: 1),
                        const Padding(
                            padding: EdgeInsets.all(30.0),
                            child: Text('Dates')),
                        Container(color: Colors.grey, height: 50, width: 1),
                        const Padding(
                            padding: EdgeInsets.all(30.0),
                            child: Text('People')),
                        Container(color: Colors.grey, height: 50, width: 1),
                        InkWell(
                          onTap: () {},
                          child: const Padding(
                              padding: EdgeInsets.all(30.0),
                              child: Text('Experiances')),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Featured',
                    style: GoogleFonts.montserrat(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'Unique wildlife tours & destinations',
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FeaturedTiles(
                    screenSize: MediaQuery.of(context).size,
                  )
                ],
              ),
            ),
            DestinationCarousel()

            // Stack(
            //   children: [
            //     CarouselSlider(
            //       items: imageSliders,
            //       options: CarouselOptions(
            //           enlargeCenterPage: true,
            //           aspectRatio: 18 / 8,
            //           autoPlay: true,
            //           onPageChanged: (index, reason) {
            //             setState(() {
            //               _current = index;
            //               for (int i = 0; i < imageSliders.length; i++) {
            //                 if (i == index) {
            //                   _isSelected[i] = true;
            //                 } else {
            //                   _isSelected[i] = false;
            //                 }
            //               }
            //             });
            //           }),
            //       carouselController: _controller,
            //     ),
            //     AspectRatio(
            //       aspectRatio: 18 / 8,
            //       child: Center(
            //         child: Text(
            //           places[_current],
            //           style: GoogleFonts.electrolize(
            //             letterSpacing: 8,
            //             fontSize: screenSize.width / 25,
            //             color: Colors.white,
            //           ),
            //         ),
            //       ),
            //     ),
            //     AspectRatio(
            //       aspectRatio: 15 / 8,
            //       child: Center(
            //         heightFactor: 1,
            //         child: Align(
            //           alignment: Alignment.bottomCenter,
            //           child: Padding(
            //               padding: EdgeInsets.only(
            //                 left: screenSize.width / 8,
            //                 right: screenSize.width / 8,
            //               ),
            //               child: Card(
            //                 elevation: 5,
            //                 child: Padding(
            //                   padding: EdgeInsets.only(
            //                     top: screenSize.height / 150,
            //                     bottom: screenSize.height / 150,
            //                   ),
            //                   child: Row(children: [
            //                     Column(
            //                       children: [Text("data")],
            //                     )
            //                   ]),
            //                 ),
            //               )),
            //         ),
            //       ),
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  static generateImageTiles(Size screenSize) {
    return images
        .map(
          (element) => ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              element,
              fit: BoxFit.cover,
            ),
          ),
        )
        .toList();
  }
}

class TrekkingCard extends StatelessWidget {
  const TrekkingCard({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: screenSize.width / 6,
          width: screenSize.width / 3.8,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.network(
              'https://img.traveltriangle.com/blog/wp-content/uploads/2018/09/cover-for-Trekking-In-Kathmandu-e1582960550667.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: screenSize.height / 80,
          ),
          child: Text(
            'Trekking',
            style: GoogleFonts.montserrat(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ),
      ],
    );
  }
}

class PhotographyCard extends StatelessWidget {
  const PhotographyCard({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: screenSize.width / 6,
          width: screenSize.width / 3.8,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.network(
              'https://cdn.pixabay.com/photo/2019/01/28/02/10/girl-taking-photo-3959468_960_720.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: screenSize.height / 70,
          ),
          child: Text(
            'Photography',
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class AnimalCard extends StatelessWidget {
  const AnimalCard({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: screenSize.width / 6,
          width: screenSize.width / 3.8,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.network(
              'https://static.independent.co.uk/s3fs-public/thumbnails/image/2020/07/07/15/knobbed-hornbill.jpg?quality=75&width=990&auto=webp&crop=982:726,smart',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 20),
        Padding(
          padding: EdgeInsets.only(
            top: screenSize.height / 70,
          ),
          child: Text(
            'Animal',
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
