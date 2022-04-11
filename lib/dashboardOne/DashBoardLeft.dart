import 'package:flutter/material.dart';

import '../colors.dart';
import 'DashBoardOne.dart';
import 'RightTopSearch.dart';

class DashBoardLeft extends StatefulWidget {
  DashBoardLeft(
      {Key? key, required this.myFileList, required this.recntfileList})
      : super(key: key);
  List<MyFileModel> myFileList = [];
  List<RecentFileModel> recntfileList = [];

  @override
  _DashBoardLeftState createState() => _DashBoardLeftState();
}

class _DashBoardLeftState extends State<DashBoardLeft> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
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
                                    widget.myFileList[0].backgroundColor!,
                                iconColor: widget.myFileList[0].iconColor!,
                                filesCount: "${widget.myFileList[0].fileCount}",
                                gb: '${widget.myFileList[0].gb}',
                                icon: widget.myFileList[0].icon,
                                name: 'Document',
                                percentage: 0.2,
                              ),
                              MyFileTile(
                                backGroundColor:
                                    widget.myFileList[1].backgroundColor!,
                                iconColor: widget.myFileList[1].iconColor!,
                                filesCount: "${widget.myFileList[1].fileCount}",
                                gb: '${widget.myFileList[1].gb}',
                                icon: widget.myFileList[1].icon,
                                name: '${widget.myFileList[1].name}',
                                percentage: 0.2,
                              ),
                              MyFileTile(
                                backGroundColor:
                                    widget.myFileList[2].backgroundColor!,
                                iconColor: widget.myFileList[2].iconColor!,
                                filesCount: "${widget.myFileList[2].fileCount}",
                                gb: '${widget.myFileList[2].gb}',
                                icon: widget.myFileList[2].icon,
                                name: '${widget.myFileList[2].name}',
                                percentage: 0.2,
                              ),
                              MyFileTile(
                                backGroundColor:
                                    widget.myFileList[3].backgroundColor!,
                                iconColor: widget.myFileList[3].iconColor!,
                                filesCount: "${widget.myFileList[3].fileCount}",
                                gb: '${widget.myFileList[3].gb}',
                                icon: widget.myFileList[3].icon,
                                name: '${widget.myFileList[3].name}',
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
                                          BorderRadius.circular(12.0)),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 15,
                                          top: 20,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Recent File',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                      color: Colors.grey
                                                          .withOpacity(0.2))),
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
                                          rows: widget.recntfileList
                                              .map((t) => DataRow(cells: [
                                                    DataCell(
                                                      Row(
                                                        children: [
                                                          Container(
                                                            height: 40,
                                                            width: 40,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                color: t
                                                                    .backGroundColor),
                                                            child: Image.asset(
                                                              '${t.url}',
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              width: 8),
                                                          Text(
                                                            t.name!,
                                                            textScaleFactor: 1,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    DataCell(Text(
                                                      t.date!,
                                                      maxLines: 3,
                                                      textScaleFactor: 1,
                                                    )),
                                                    DataCell(Text(
                                                      t.mb!.toString(),
                                                      textScaleFactor: 1,
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
                                          BorderRadius.circular(12.0)),
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
                                              MainAxisAlignment.spaceBetween,
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
                                      color: appColor.secondaryColor, width: 2),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.0)),
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
                                      color: appColor.secondaryColor, width: 2),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.0)),
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
                                      color: appColor.secondaryColor, width: 2),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.0)),
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
                                      color: appColor.secondaryColor, width: 2),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.0)),
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
                                      color: appColor.secondaryColor, width: 2),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.0)),
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
    );
  }
}
