import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_web_app/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

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

class _DashBoradOneState extends State<DashBoradOne> {
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('David', 25, Colors.red),
      ChartData('Steve', 38, Colors.yellow),
      ChartData('Jack', 34, Colors.blueAccent),
      ChartData('Others', 52, Colors.amber)
    ];
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                color: Colors.white,
                width: 200.0,
                height: MediaQuery.of(context).size.height,
                child: LeftMenu(
                    menuItem: menuItem,
                    listValue: listValue,
                    menuIcon: menuIcon),
              ),
              Expanded(
                child: Container(
                  color: const Color.fromRGBO(250, 250, 251, 1),
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RightTopSearch(),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 20, left: 10, right: 10),
                          color: appColor.backGroundColor,
                          height: MediaQuery.of(context).size.height,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const MyFileHeader(),
                                    Row(
                                      children: [
                                        MyFileTile(
                                          backGroundColor:
                                              myFileList[0].backgroundColor!,
                                          iconColor: myFileList[0].iconColor!,
                                          filesCount:
                                              "${myFileList[0].fileCount}",
                                          gb: '${myFileList[0].gb}',
                                          icon: myFileList[0].icon,
                                          name: 'Document',
                                          percentage: 0.2,
                                        ),
                                        MyFileTile(
                                          backGroundColor:
                                              myFileList[1].backgroundColor!,
                                          iconColor: myFileList[1].iconColor!,
                                          filesCount:
                                              "${myFileList[1].fileCount}",
                                          gb: '${myFileList[1].gb}',
                                          icon: myFileList[1].icon,
                                          name: '${myFileList[1].name}',
                                          percentage: 0.2,
                                        ),
                                        MyFileTile(
                                          backGroundColor:
                                              myFileList[2].backgroundColor!,
                                          iconColor: myFileList[2].iconColor!,
                                          filesCount:
                                              "${myFileList[2].fileCount}",
                                          gb: '${myFileList[2].gb}',
                                          icon: myFileList[2].icon,
                                          name: '${myFileList[2].name}',
                                          percentage: 0.2,
                                        ),
                                        MyFileTile(
                                          backGroundColor:
                                              myFileList[3].backgroundColor!,
                                          iconColor: myFileList[3].iconColor!,
                                          filesCount:
                                              "${myFileList[3].fileCount}",
                                          gb: '${myFileList[3].gb}',
                                          icon: myFileList[3].icon,
                                          name: '${myFileList[3].name}',
                                          percentage: 0.2,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        12.0)),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 10,
                                                    right: 15,
                                                    top: 20,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const Text(
                                                        'Recent File',
                                                        style: TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            border: Border.all(
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.2))),
                                                        child: const Text(
                                                          'See more',
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                DataTable(
                                                    columns: const [
                                                      DataColumn(
                                                        label: Text(
                                                          "File Name",
                                                          textScaleFactor: 1,
                                                        ),
                                                        numeric: false,
                                                      ),
                                                      DataColumn(
                                                        label: Text(
                                                          "Date",
                                                          textScaleFactor: 1,
                                                        ),
                                                        numeric: false,
                                                      ),
                                                      DataColumn(
                                                        label: Text(
                                                          "Size",
                                                          textScaleFactor: 1,
                                                        ),
                                                        numeric: false,
                                                      ),
                                                    ],
                                                    rows: recntfileList
                                                        .map(
                                                            (t) => DataRow(
                                                                    cells: [
                                                                      DataCell(
                                                                        Row(
                                                                          children: [
                                                                            Container(
                                                                              height: 40,
                                                                              width: 40,
                                                                              padding: const EdgeInsets.all(10.0),
                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: t.backGroundColor),
                                                                              child: Image.asset(
                                                                                '${t.url}',
                                                                                color: Colors.white,
                                                                              ),
                                                                            ),
                                                                            const SizedBox(width: 8),
                                                                            Text(
                                                                              t.name!,
                                                                              textScaleFactor: 1,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      DataCell(
                                                                          Text(
                                                                        t.date!,
                                                                        maxLines:
                                                                            3,
                                                                        textScaleFactor:
                                                                            1,
                                                                      )),
                                                                      DataCell(
                                                                          Text(
                                                                        t.mb!
                                                                            .toString(),
                                                                        textScaleFactor:
                                                                            1,
                                                                      )),
                                                                    ]))
                                                        .toList())
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        12.0)),
                                            alignment: Alignment.topCenter,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20, right: 20),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(height: 20),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: const [
                                                      Text("Analytics"),
                                                      Icon(Icons.more_vert)
                                                    ],
                                                  ),
                                                  const SizedBox(height: 20),
                                                  Container(
                                                    height: 390.0,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                width: 200,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12.0)),
                                child: Column(
                                  children: [
                                    const Text('Storage details'),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 80,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: appColor.secondaryColor,
                                                width: 2),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12.0)),
                                        child: Row(children: [
                                          const Icon(Icons.usb_rounded),
                                          Column(
                                            children: const [
                                              Text('Dounment Files'),
                                              Text("1,35000")
                                            ],
                                          ),
                                          const Text("5.2 GB")
                                        ]),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 80,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: appColor.secondaryColor,
                                                width: 2),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12.0)),
                                        child: Row(children: [
                                          const Icon(Icons.usb_rounded),
                                          Column(
                                            children: const [
                                              Text('Dounment Files'),
                                              Text("1,10000")
                                            ],
                                          ),
                                          const Text("1.2 GB")
                                        ]),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 80,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: appColor.secondaryColor,
                                                width: 2),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12.0)),
                                        child: Row(children: [
                                          const Icon(Icons.usb_rounded),
                                          Column(
                                            children: const [
                                              Text('Dounment Files'),
                                              Text("1,18000")
                                            ],
                                          ),
                                          const Text("1.5 GB")
                                        ]),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 80,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: appColor.secondaryColor,
                                                width: 2),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12.0)),
                                        child: Row(children: [
                                          const Icon(Icons.usb_rounded),
                                          Column(
                                            children: const [
                                              Text('Dounment Files'),
                                              Text("1,25000")
                                            ],
                                          ),
                                          const Text("1.5 GB")
                                        ]),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 80,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: appColor.secondaryColor,
                                                width: 2),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12.0)),
                                        child: Row(children: [
                                          const Icon(Icons.usb_rounded),
                                          Column(
                                            children: const [
                                              Text('Dounment Files'),
                                              Text("1,32000")
                                            ],
                                          ),
                                          const Text("3.2 GB")
                                        ]),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Container RightTopSearch() {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50),
      height: 60,
      color: const Color.fromRGBO(250, 250, 251, 1),
      child: Row(
        children: [
          const Text(
            'Documents',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Search',
                          contentPadding: EdgeInsets.only(left: 20),
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: appColor.primaryColor,
                        borderRadius: BorderRadius.circular(10.0)),
                    height: 40,
                    width: 40,
                    padding: const EdgeInsets.all(10.0),
                    child: const Icon(
                      CupertinoIcons.search,
                      color: Colors.white,
                      size: 18.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 60,
                  padding: const EdgeInsets.all(15.0),
                  child: ClipOval(
                    child: Image.network(
                      'https://i.picsum.photos/id/868/200/200.jpg?hmac=TH6VPbfiRO1pMY4ZYWqECwlH8wSnlxN_KlCVOzTpbe8',
                      height: 60,
                      width: 60,
                    ),
                  ),
                ),
                const Text(
                  "User Name",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Icon(Icons.arrow_drop_down)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LeftMenu extends StatelessWidget {
  const LeftMenu({
    Key? key,
    required this.menuItem,
    required this.listValue,
    required this.menuIcon,
  }) : super(key: key);

  final List<String> menuItem;
  final List<ValueNotifier<bool>> listValue;
  final List<IconData> menuIcon;

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
                      log('CLICJK');
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
              borderRadius: const BorderRadius.all(Radius.circular(10.0))),
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
