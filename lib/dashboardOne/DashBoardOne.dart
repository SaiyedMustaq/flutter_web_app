import 'dart:developer';

import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_web_app/colors.dart';
import 'package:flutter_web_app/dashboardOne/DashBoardLeft.dart';
import 'package:flutter_web_app/dashboardOne/NotificationPage.dart';
import 'package:flutter_web_app/dashboardOne/TaskPage.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import 'TransctionPage.dart';

const prefixAssert = 'assert/images/';

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}

class MyFileModel {
  String? name;
  Color? iconColor;
  Color? backgroundColor;
  String? gb;
  String? fileCount;
  double? perc;
  IconData icon;
  MyFileModel(
      {this.name,
      this.backgroundColor,
      this.gb,
      this.fileCount,
      this.iconColor,
      this.perc,
      required this.icon});
}

class RecentFileModel {
  Color? backGroundColor;
  Color? iconColor;
  String? name;
  IconData? icon;
  String? date;
  String? mb;
  String? url;

  RecentFileModel(
      {required this.backGroundColor,
      required this.date,
      required this.icon,
      required this.iconColor,
      required this.mb,
      required this.name,
      required this.url});
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class DashBoradOne extends StatefulWidget {
  const DashBoradOne({Key? key}) : super(key: key);

  @override
  _DashBoradOneState createState() => _DashBoradOneState();
}

class _DashBoradOneState extends State<DashBoradOne>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int active = 0;

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  late TooltipBehavior _tooltip;
  List<ValueNotifier<bool>> listValue = [
    ValueNotifier(false),
    ValueNotifier(false),
    ValueNotifier(false),
    ValueNotifier(false),
    ValueNotifier(false),
    ValueNotifier(false),
    ValueNotifier(false),
  ];
  List<String> menuItem = [
    "Dashboard",
    "Transaction",
    "Task",
    "Store",
    "Notification",
    "Profile",
    "Setting"
  ];
  List<IconData> menuIcon = [
    Icons.ad_units,
    Icons.track_changes,
    Icons.task,
    Icons.store,
    Icons.notifications,
    Icons.verified_user,
    Icons.settings,
  ];

  List<MyFileModel> myFileList = [
    MyFileModel(
        backgroundColor: appColor.secondaryColor,
        fileCount: "1,325",
        gb: '1.3',
        iconColor: appColor.primaryColor,
        name: 'Documents',
        perc: .1,
        icon: Icons.copy),
    MyFileModel(
      backgroundColor: const Color.fromRGBO(255, 246, 231, 1),
      fileCount: "1,325",
      gb: '1.3',
      iconColor: const Color.fromRGBO(255, 158, 12, 1),
      name: 'Google Drive',
      perc: .2,
      icon: Icons.drive_eta,
    ),
    MyFileModel(
      backgroundColor: const Color.fromRGBO(231, 236, 243, 1),
      fileCount: "2,325",
      gb: '1.3',
      iconColor: const Color.fromRGBO(10, 66, 31, 1),
      name: 'One Drive',
      perc: .3,
      icon: Icons.cloud,
    ),
    MyFileModel(
      backgroundColor: appColor.secondaryColor,
      fileCount: "3,325",
      gb: '1.3',
      iconColor: appColor.primaryColor,
      name: 'Dropbox',
      perc: .4,
      icon: Icons.book,
    )
  ];

  List<RecentFileModel> recntfileList = [
    RecentFileModel(
        backGroundColor: appColor.xdColor,
        date: '25/02/2022',
        icon: Icons.add,
        iconColor: Colors.white,
        mb: '3',
        name: 'Xd File',
        url: 'assert/images/xd.png'),
    RecentFileModel(
        backGroundColor: appColor.fingmaColor,
        date: '22/03/2022',
        icon: Icons.add,
        iconColor: Colors.white,
        mb: '19',
        name: 'Figma File',
        url: 'assert/images/figma.png'),
    RecentFileModel(
        backGroundColor: appColor.documnetColor,
        date: '02/08/2022',
        icon: Icons.add,
        iconColor: Colors.white,
        mb: '17',
        name: 'Documents',
        url: 'assert/images/file.png'),
    RecentFileModel(
        backGroundColor: appColor.soundColor,
        date: '22/02/2022',
        icon: Icons.add,
        iconColor: Colors.white,
        mb: '25.0',
        name: 'Sound File',
        url: 'assert/images/sound.png'),
    RecentFileModel(
        backGroundColor: appColor.mediaColor,
        date: '15/04/2022',
        icon: Icons.add,
        iconColor: Colors.white,
        mb: '35',
        name: 'Media',
        url: 'assert/images/youtube.png'),
    RecentFileModel(
        backGroundColor: appColor.salsePDFColor,
        date: '01/04/2022',
        icon: Icons.add,
        iconColor: Colors.white,
        mb: '25',
        name: 'Salse PDF',
        url: 'assert/images/acrobat-reader-file.png'),
    RecentFileModel(
        backGroundColor: appColor.excleColor,
        date: '22/06/2022',
        icon: Icons.add,
        iconColor: Colors.white,
        mb: '45',
        name: 'Excle File',
        url: 'assert/images/excel.png')
  ];

  List<_SalesData> _dataop = [
    _SalesData('Sun', 35),
    _SalesData('Mon', 28),
    _SalesData('Tue', 34),
    _SalesData('Thu', 32),
    _SalesData('Wed', 25),
    _SalesData('Fri', 15),
    _SalesData('Sat', 50)
  ];
  late List<_ChartData> data = [];
  @override
  void initState() {
    data = [
      _ChartData('Sun', 12),
      _ChartData('Mon', 15),
      _ChartData('Tue', 30),
      _ChartData('Thu', 6.4),
      _ChartData('Web', 16),
      _ChartData('Fri', 35),
      _ChartData('Sat', 48),
    ];

    _tooltip = TooltipBehavior(enable: true);
    tabController = TabController(vsync: this, length: 4, initialIndex: 0)
      ..addListener(() {
        setState(() {
          active = tabController.index;
        });
      });
    super.initState();
  }

  PageController page = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: page,
            style: SideMenuStyle(
              displayMode: SideMenuDisplayMode.auto,
              hoverColor: Colors.blue[100],
              selectedColor: Colors.lightBlue,
              selectedTitleTextStyle: const TextStyle(color: Colors.white),
              selectedIconColor: Colors.white,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.all(Radius.circular(10)),
              // ),
              // backgroundColor: Colors.blueGrey[700]
            ),
            // title: Column(
            //   children: [
            //     // ConstrainedBox(
            //     //   constraints: BoxConstraints(
            //     //     maxHeight: 150,
            //     //     maxWidth: 150,
            //     //   ),
            //     //   child: Icon(Icons.menu),
            //     // ),
            //     Divider(
            //       indent: 8.0,
            //       endIndent: 8.0,
            //     ),
            //   ],
            // ),
            footer: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'mohada',
                style: TextStyle(fontSize: 15),
              ),
            ),
            items: [
              SideMenuItem(
                priority: 0,
                title: 'Dashboard',
                onTap: () {
                  page.jumpToPage(0);
                },
                icon: const Icon(Icons.home),
                badgeContent: const Text(
                  '3',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SideMenuItem(
                priority: 1,
                title: 'Users',
                onTap: () {
                  page.jumpToPage(1);
                },
                icon: const Icon(Icons.supervisor_account),
              ),
              SideMenuItem(
                priority: 2,
                title: 'Files',
                onTap: () {
                  page.jumpToPage(2);
                },
                icon: const Icon(Icons.file_copy_rounded),
              ),
              SideMenuItem(
                priority: 3,
                title: 'Download',
                onTap: () {
                  page.jumpToPage(3);
                },
                icon: const Icon(Icons.download),
              ),
              SideMenuItem(
                priority: 4,
                title: 'Settings',
                onTap: () {
                  page.jumpToPage(4);
                },
                icon: const Icon(Icons.settings),
              ),
              SideMenuItem(
                priority: 6,
                title: 'Exit',
                onTap: () async {},
                icon: const Icon(Icons.exit_to_app),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: page,
              children: [
                DashBoardLeft(
                    myFileList: myFileList, recntfileList: recntfileList),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Users',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Files',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Download',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Settings',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

typedef onIndexClick(int id);

class LeftMenu extends StatelessWidget {
  LeftMenu({
    Key? key,
    required this.menuItem,
    required this.listValue,
    required this.menuIcon,
    required this.onClick,
  }) : super(key: key);

  final List<String> menuItem;
  final List<ValueNotifier<bool>> listValue;
  final List<IconData> menuIcon;
  onIndexClick onClick;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              'assert/images/impero_logo.png',
              height: 80,
              width: 80,
            ),
            Text(
              'Impero',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.blue[900],
                fontStyle: FontStyle.italic,
              ),
            )
          ],
        ),
        ListView.builder(
            itemCount: menuItem.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => ValueListenableBuilder(
                  valueListenable: listValue[index],
                  builder: (context, vlue, child) => InkWell(
                    onTap: () {
                      onClick(index);
                      onNavigate(index);
                    },
                    onHover: (val) {
                      listValue[index].value = !listValue[index].value;
                    },
                    child: Container(
                      color: Colors.white,
                      width: double.infinity,
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            height: 55,
                            decoration: BoxDecoration(
                              color: listValue[index].value
                                  ? Colors.blue[600]
                                  : Colors.white,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15.0),
                                  bottomLeft: Radius.circular(15.0)),
                            ),
                            child: Icon(
                              menuIcon[index],
                              color: listValue[index].value
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                          Expanded(
                            child: Card(
                              color: listValue[index].value
                                  ? const Color.fromRGBO(65, 164, 255, 1)
                                  : Colors.white,
                              elevation: listValue[index].value ? 8.0 : 0.0,
                              child: Container(
                                height: 55,
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  color: listValue[index].value
                                      ? const Color.fromRGBO(65, 164, 255, 1)
                                      : Colors.white,
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0)),
                                ),
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  menuItem[index],
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: listValue[index].value
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
                color: Color.fromRGBO(233, 242, 255, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                )),
            padding: const EdgeInsets.only(
              left: 18,
              right: 18,
              top: 10,
              bottom: 8,
            ),
            width: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Upgread to pro get \nall featurs',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    Text(
                      'Upgread Now',
                      style: TextStyle(fontSize: 15.0, color: Colors.blue),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(width: 20),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.blue,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(
            Icons.logout,
            color: Colors.grey,
          ),
          title: const Text(
            'LogOut',
            style: TextStyle(fontSize: 18.0, color: Colors.black),
          ),
        )
      ],
    );
  }

  void onNavigate(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
      default:
    }
  }
}

class MyFileTile extends StatelessWidget {
  MyFileTile({
    Key? key,
    required this.icon,
    required this.name,
    required this.filesCount,
    required this.gb,
    required this.percentage,
    required this.iconColor,
    required this.backGroundColor,
  }) : super(key: key);
  IconData icon;
  Color iconColor;
  Color backGroundColor;
  String name;
  String filesCount;
  String gb;
  double percentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.only(top: 10, right: 10, bottom: 10, left: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40.0,
                width: 40.0,
                margin: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: backGroundColor),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 18.0,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
                color: Colors.grey,
              )
            ],
          ),
          const SizedBox(height: 20),
          Text(
            name,
            style: const TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 18),
          LinearProgressIndicator(
            value: percentage,
            semanticsLabel: 'Linear progress indicator',
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$filesCount Files',
                style: const TextStyle(fontSize: 10.0, color: Colors.grey),
              ),
              Text(
                '${gb}GB',
                style: const TextStyle(fontSize: 10.0, color: Colors.grey),
              )
            ],
          )
        ],
      ),
    );
  }
}

class MyFileHeader extends StatelessWidget {
  const MyFileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'My Files',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 20),
          decoration: const BoxDecoration(
              color: appColor.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          padding:
              const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
          child: const Text(
            '+ Add new',
            style: TextStyle(color: Colors.white, fontSize: 14.0),
          ),
        ),
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
