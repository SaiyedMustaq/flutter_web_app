import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_web_app/const/assert.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

void main() {
  runApp(const MyApp());
}

const TextStyle titleBarStyle = TextStyle(
  color: Colors.black,
  fontSize: 16.0,
  fontWeight: FontWeight.w600,
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        widget,
        maxWidth: 1500,
        minWidth: 480,
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.resize(480, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
        background: Container(
          color: const Color(0xFFF5F5F5),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Web',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isHover = false;
  List<ValueNotifier<bool>> middleListHover = [
    ValueNotifier(false),
    ValueNotifier(false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              PageOne(
                middleListHover: middleListHover,
              ),
              const PageTwo(),
            ],
          )),
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1.5,
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Digital products? Our passion!',
                  style: GoogleFonts.lato(fontSize: 35.0),
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Text(
                  'We are Impero, a mobile app development company that pursuits to Stay Ahead Of The Curve. A knack for innovation and building contemporary cutting edge solutions in the 21st century is what we strive to provide your users.',
                  style: GoogleFonts.lato(
                    fontSize: 25.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: 600,
                color: Colors.red,
              )
            ],
          )
        ],
        // child: Column(
        //   children: [Text('Digital products? Our passion!')],
        // ),
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({
    Key? key,
    required this.middleListHover,
  }) : super(key: key);

  final List<ValueNotifier<bool>> middleListHover;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .9,
      child: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: Image.asset(
              Assert.titleImage,
              fit: BoxFit.contain,
              width: double.infinity,
            ),
          ),
          Column(children: [
            Webtitle(),
            Expanded(child: Container()),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Award-winning app development company!',
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                  Text(
                    'Building great products for startups and businesses!',
                    style: GoogleFonts.lato(fontSize: 35.0),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ValueListenableBuilder(
                        valueListenable: middleListHover[0],
                        builder:
                            (BuildContext context, bool value, Widget? child) {
                          return InkWell(
                            onTap: () {},
                            onHover: (val) {
                              middleListHover[0].value = val;
                            },
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  'Case styudy',
                                  style: value
                                      ? titleBarStyle.apply(color: Colors.black)
                                      : titleBarStyle,
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  color:
                                      value ? Colors.white : Colors.transparent,
                                  border: Border.all(
                                    color: value ? Colors.white : Colors.white,
                                    width: 2,
                                  )),
                            ),
                          );
                        },
                      ),
                      ValueListenableBuilder(
                        valueListenable: middleListHover[1],
                        builder:
                            (BuildContext context, bool value, Widget? child) {
                          return InkWell(
                            onTap: () {},
                            onHover: (val) {
                              middleListHover[1].value = val;
                            },
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  'Achivement',
                                  style: value
                                      ? titleBarStyle.apply(color: Colors.black)
                                      : titleBarStyle,
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  color:
                                      value ? Colors.white : Colors.transparent,
                                  border: Border.all(
                                    color: value ? Colors.white : Colors.white,
                                    width: 2,
                                  )),
                            ),
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ])
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class Webtitle extends StatelessWidget {
  Webtitle({Key? key}) : super(key: key);

  final ValueNotifier<bool> hover = ValueNotifier(false);
  List<ValueNotifier<bool>> hoveList = [
    ValueNotifier(false),
    ValueNotifier(false),
    ValueNotifier(false),
    ValueNotifier(false),
    ValueNotifier(false),
    ValueNotifier(false),
    ValueNotifier(false)
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 80,
        child: Row(
          children: [
            Image.asset(
              Assert.friends,
              height: 80,
              width: 100,
            ),
            const Text(
              'Friends',
              style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(width: 100),
            ValueListenableBuilder(
              valueListenable: hoveList[0],
              builder: (context, bool value, child) => InkWell(
                onTap: () {},
                onHover: (val) {
                  hoveList[0].value = val;
                },
                child: MaterialButton(
                  onPressed: () {},
                  //color: Colors.transparent,
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'About',
                      style: titleBarStyle,
                    ),
                  ),
                ),
              ),
            ),
            ValueListenableBuilder(
              valueListenable: hoveList[1],
              builder: (context, bool value, child) => InkWell(
                onTap: () {},
                onHover: (val) {
                  hoveList[1].value = val;
                },
                child: MaterialButton(
                  onPressed: () {},
                  //color: Colors.transparent,
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Services',
                      style: titleBarStyle,
                    ),
                  ),
                ),
              ),
            ),
            ValueListenableBuilder(
              valueListenable: hoveList[2],
              builder: (context, bool value, child) => InkWell(
                onTap: () {},
                onHover: (val) {
                  hoveList[2].value = val;
                },
                child: MaterialButton(
                  elevation: value ? 10 : 5,
                  onPressed: () {},
                  //color: Colors.transparent,
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'We Startups',
                      style: titleBarStyle,
                    ),
                  ),
                ),
              ),
            ),
            ValueListenableBuilder(
              valueListenable: hoveList[3],
              builder: (context, bool value, child) => InkWell(
                onTap: () {},
                onHover: (val) {
                  hoveList[3].value = val;
                },
                child: MaterialButton(
                  onPressed: () {},
                  //color: Colors.transparent,
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Achievements',
                      style: titleBarStyle,
                    ),
                  ),
                ),
              ),
            ),
            ValueListenableBuilder(
              valueListenable: hoveList[4],
              builder: (context, bool value, child) => InkWell(
                onTap: () {},
                onHover: (val) {
                  hoveList[4].value = val;
                },
                child: MaterialButton(
                  onPressed: () {},
                  //color: Colors.transparent,
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Careers',
                      style: titleBarStyle,
                    ),
                  ),
                ),
              ),
            ),
            ValueListenableBuilder(
              valueListenable: hoveList[5],
              builder: (context, bool value, child) => InkWell(
                onTap: () {},
                onHover: (val) {
                  hoveList[5].value = val;
                },
                child: MaterialButton(
                  onPressed: () {},
                  //color: Colors.transparent,
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Case study',
                      style: titleBarStyle,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            ValueListenableBuilder(
              valueListenable: hover,
              builder: (BuildContext context, bool value, Widget? child) {
                return InkWell(
                  onTap: () {},
                  onHover: (val) {
                    hover.value = val;
                  },
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Contact us',
                        style: value
                            ? titleBarStyle.apply(color: Colors.black)
                            : titleBarStyle,
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        color: value ? Colors.white : Colors.white,
                        border: Border.all(
                          color: value ? Colors.white : Colors.white,
                          width: 2,
                        )),
                  ),
                );
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
