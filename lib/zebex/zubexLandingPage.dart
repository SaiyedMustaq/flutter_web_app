import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//https://blog.codemagic.io/flutter-web-getting-started-with-responsive-design/

class ZubexLandingPage extends StatefulWidget {
  const ZubexLandingPage({Key? key}) : super(key: key);

  @override
  _ZubexLandingPageState createState() => _ZubexLandingPageState();
}

class _ZubexLandingPageState extends State<ZubexLandingPage> {
  List _isHovering = [false, false, false, false];
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 1000),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                const Text(
                  'EXPLORE',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onHover: (value) {
                              setState(() {
                                _isHovering[0] = value;
                              });
                            },
                            onTap: () {},
                            child: Text(
                              'Discover',
                              style: TextStyle(
                                color: _isHovering[0]
                                    ? Colors.blue.shade200
                                    : Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          // For showing an underline on hover
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[0],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: screenSize.width / 20),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onHover: (value) {
                              setState(() {
                                _isHovering[1] = value;
                              });
                            },
                            onTap: () {},
                            child: Text(
                              'Contact Us',
                              style: TextStyle(
                                color: _isHovering[1]
                                    ? Colors.blue.shade200
                                    : Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          // For showing an underline on hover
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[1],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(
                  width: screenSize.width / 50,
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                // image below the top bar
                child: SizedBox(
                  height: screenSize.height * 0.45,
                  width: screenSize.width,
                  child: Image.network(
                    'https://images.unsplash.com/photo-1611329532992-0b7ba27d85fb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bW91bnR8ZW58MHx8MHx8&w=1000&q=80',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                heightFactor: 1,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: screenSize.height * 0.40,
                    left: screenSize.width / 5,
                    right: screenSize.width / 5,
                  ),
                  child: Card(
                    child: Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(30.0),
                            child: Text('Destination'),
                          ),
                          Container(
                            color: Colors.grey,
                            height: 50,
                            width: 1,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(30.0),
                            child: Text('Dates'),
                          ),
                          Container(
                            color: Colors.grey,
                            height: 50,
                            width: 1,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(30.0),
                            child: Text('People'),
                          ),
                          Container(
                            color: Colors.grey,
                            height: 50,
                            width: 1,
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.all(30.0),
                              child: Text('Experiances'),
                            ),
                          ),
                        ],
                      ),
                    ),
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
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: screenSize.width / 6,
                      width: screenSize.width / 3.8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.network(
                          'https://c8.alamy.com/zooms/9/7fc3ae06dc0f453fac80a70782d00711/afxhab.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenSize.height / 70,
                      ),
                      child: Text(
                        'Trekking',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: screenSize.width / 6,
                      width: screenSize.width / 3.8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.network(
                          'https://cdn.downtoearth.org.in/library/large/2021-02-25/0.91829600_1614263117_tiger.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
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
                ),
                Column(
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
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
