// ignore_for_file: use_key_in_widget_constructors

import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_web_app/zebex/zubexLandingPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'package:flutter_web_app/LargeScreen.dart';
import 'package:flutter_web_app/const/assert.dart';

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
      home: const ZubexLandingPage(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        backgroundColor: Colors.white,
        body: const LargeScreen());
  }
}

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: 80,
            width: 150,
            child: Image.asset('assert/images/logo.jpeg'),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              _NavBarItem('Episodes'),
              SizedBox(
                width: 60,
              ),
              _NavBarItem('About'),
            ],
          )
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String title;
  const _NavBarItem(
    this.title, {
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18),
    );
  }
}

class CenteredView extends StatelessWidget {
  final Widget child;
  const CenteredView({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 60),
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1200),
        child: child,
      ),
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
  GlobalKey pageKey = GlobalKey();
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
                pageKey: pageKey,
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
              const SizedBox(height: 50),
              const ProjectWidget(),
              const SizedBox(height: 50),
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

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .8,
      color: Colors.white,
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              tileMode: TileMode.mirror,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.cyan,
                Color(0xff17a2b8),
              ],
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0xff17a2b8),
                blurRadius: 4,
                offset: Offset(4, 8), // Shadow position
              ),
            ],
            color: const Color(0xff17a2b8),
            borderRadius: BorderRadius.circular(20.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 100, top: 150, right: 0),
                    child: Expanded(
                      child: Text(
                        'A wellness kit on your phone! Already touching lives of over 30k+ users in 75 countries.',
                        style: GoogleFonts.lato(
                            fontSize: 30.0, color: Colors.white),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .4,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(25),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          tileMode: TileMode.mirror,
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xff17a2b8),
                            Color(0xff17a2b8),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'My experiences with Impero has been wonderful in every way. Raza and the team are true professionals in the way they approach every project. They are particularly talented at app development, UX design and understanding the users needs.',
                            style: GoogleFonts.lato(
                                fontSize: 20.0, color: Colors.white),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 20),
                          ListTile(
                            leading: ClipOval(
                              clipBehavior: Clip.hardEdge,
                              child: Image.asset(
                                Assert.logo,
                              ),
                            ),
                            title: Text(
                              'Aimée-Louise Carton',
                              style: GoogleFonts.lato(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                            subtitle: Text(
                              'Co-Founder, KeepAppy',
                              style: GoogleFonts.lato(
                                  color: Colors.white, fontSize: 18.0),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              Assert.logo,
              height: MediaQuery.of(context).size.height * .4,
            ),
          ],
        ),
      ),
    );
  }
}

class PageOne extends StatefulWidget {
  GlobalKey pageKey;
  PageOne({
    Key? key,
    required this.pageKey,
    required this.middleListHover,
  }) : super(key: key);

  final List<ValueNotifier<bool>> middleListHover;

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .9,
      child: Stack(
        //alignment: Alignment.bottomCenter,
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
            Webtitle(
              pageKey: widget.pageKey,
            ),
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
                        valueListenable: widget.middleListHover[0],
                        builder:
                            (BuildContext context, bool value, Widget? child) {
                          return InkWell(
                            onTap: () {},
                            onHover: (val) {
                              widget.middleListHover[0].value = val;
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
                        valueListenable: widget.middleListHover[1],
                        builder:
                            (BuildContext context, bool value, Widget? child) {
                          return InkWell(
                            onTap: () {},
                            onHover: (val) {
                              widget.middleListHover[1].value = val;
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
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        Assert.clutch,
                        fit: BoxFit.cover,
                        height: 60,
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        height: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RatingBar.builder(
                              glow: true,
                              glowColor: Colors.red,
                              itemSize: 20,
                              initialRating: 5,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: false,
                              itemCount: 5,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Text('32 Reviews'),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
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
class Webtitle extends StatefulWidget {
  GlobalKey pageKey;
  Webtitle({
    Key? key,
    required this.pageKey,
  }) : super(key: key);

  @override
  State<Webtitle> createState() => _WebtitleState();
}

class _WebtitleState extends State<Webtitle> {
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

  openMenu(BuildContext context) async {
    final render =
        widget.pageKey.currentContext!.findRenderObject() as RenderBox;
    await showMenu(
      context: context,
      position:
          RelativeRect.fromLTRB(450, 100, double.infinity, double.infinity),
      items: const [
        PopupMenuItem(
          child: Text("Create a website"),
        ),
        PopupMenuItem(
          child: Text("Top Ms commericial management"),
        ),
        PopupMenuItem(
          child: Text("Mobile inventory application"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 80,
        child: Row(
          children: [
            Image.asset(
              Assert.imperoLogo,
              height: 80,
              width: 100,
            ),
            const Text(
              'Impero',
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
                onTapCancel: () {
                  if (kDebugMode) {
                    print('TAP CANCLE');
                  }
                },
                onTapDown: (vale) {
                  if (kDebugMode) {
                    print('TAP DOWN');
                  }
                },
                onFocusChange: (value) {
                  if (kDebugMode) {
                    print('On Focus Change');
                  }
                },
                onHover: (val) {
                  if (kDebugMode) {
                    print('On Hover');
                  }
                  openMenu(context);
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
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 10),
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
