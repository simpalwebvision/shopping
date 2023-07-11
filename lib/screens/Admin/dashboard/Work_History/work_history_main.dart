import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopping/screens/Technician/dashboard/work_history/text_spare_part_bounce.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/utils/constant.dart';
import 'package:shopping/widgets/detail_widget.dart';

class AdminWorkHistoryMainScreen extends StatefulWidget {
  const AdminWorkHistoryMainScreen({super.key});

  @override
  State<AdminWorkHistoryMainScreen> createState() =>
      _AdminWorkHistoryMainScreenState();
}

class _AdminWorkHistoryMainScreenState
    extends State<AdminWorkHistoryMainScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool showSearchBar = false, isLoading = false;
  List remark = ['Paid', 'Pending', 'Forward', 'Hold', 'Cancel', 'Bounce'];

  List optionsList = [
    'Technician',
    'Sales',
    'Customer',
    'Office Staff',
  ];
  List selectedOptionsList = [];

  String fromDate = '', toDate = '', todate = '';
  var now = DateTime.now();
  @override
  void initState() {
    super.initState();

    todate = DateFormat('dd-MM-yyyy').format(now);

    fromDate = todate;

    // CommonFunctions().disableCapture();
    // getNotified();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Work History'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                showSearchBar = !showSearchBar;
              });
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
        bottom: showSearchBar
            ? PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10, left: 15, right: 15),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search ...',
                      prefixIcon: const Icon(
                        Icons.search,
                        color: primaryColor,
                      ),
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ))
            : null,
      ),
      body: isLoading
          ? const CircularProgressIndicator()
          : Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Wrap(
                  children: optionsList.map(
                    (hobby) {
                      bool isSelected = false;
                      if (selectedOptionsList.contains(hobby)) {
                        isSelected = true;
                      }
                      return GestureDetector(
                        onTap: () {
                          if (!selectedOptionsList.contains(hobby)) {
                            if (selectedOptionsList.length < 5) {
                              selectedOptionsList.add(hobby);
                              setState(() {});
                              // print(selectedOptionsList);
                            }
                          } else {
                            selectedOptionsList
                                .removeWhere((element) => element == hobby);
                            setState(() {});
                            // print(selectedOptionsList);
                          }
                        },
                        child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 4),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(
                                      color: isSelected
                                          ? primaryColor
                                          : Colors.grey,
                                      width: 2)),
                              child: Text(
                                hobby,
                                style: TextStyle(
                                    color:
                                        isSelected ? primaryColor : Colors.grey,
                                    fontSize: 14),
                              ),
                            )),
                      );
                    },
                  ).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () async {
                          String fDate =
                              await CommonFunctions().pickDate(context);
                          setState(() {
                            if (fDate.toString() == 'null') {
                              fromDate = DateFormat('dd-MM-yyyy').format(now);
                            } else {
                              fromDate = fDate;
                            }
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          padding: const EdgeInsets.all(10),
                          child: Text('From Date : $fromDate'),
                        ),
                      ),
                      Expanded(child: Container()),
                      InkWell(
                        onTap: () async {
                          String tDate =
                              await CommonFunctions().pickDate(context);
                          setState(() {
                            if (tDate.toString() == 'null') {
                              toDate = '';
                            } else {
                              toDate = tDate;
                            }
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          padding: const EdgeInsets.all(10),
                          child: Text('Upto Date : $toDate'),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: remark.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 0.0),
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(color: Colors.black54),
                                borderRadius: BorderRadius.circular(0)),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          padding: const EdgeInsets.all(7),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.white,
                                          ),
                                          child: Text(
                                            '${index + 1}.',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Expanded(child: Container()),
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            border: Border.all(
                                                color: Colors.black87)),
                                        child: SelectableText(
                                          remark[index],
                                          style: TextStyle(
                                              fontSize: size.width * 0.035,
                                              color: Colors.black87,
                                              letterSpacing: 0.5,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      (remark[index] == 'Pending' ||
                                              remark[index] == 'Bounce')
                                          ? IconButton(
                                              onPressed: () {
                                                showModalBottomSheet(
                                                    context: context,
                                                    builder: (context) {
                                                      return StatefulBuilder(
                                                          builder: (BuildContext
                                                                  context,
                                                              StateSetter
                                                                  setState /*You can rename this!*/) {
                                                        return Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  vertical: 10,
                                                                  horizontal:
                                                                      5),
                                                          height: 100,
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                '${remark[index]} Register',
                                                                style: TextStyle(
                                                                    color:
                                                                        primaryColor,
                                                                    fontSize:
                                                                        size.height *
                                                                            0.021,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                              Table(
                                                                border: TableBorder.all(
                                                                    color: Colors
                                                                        .black,
                                                                    style: BorderStyle
                                                                        .solid,
                                                                    width: 1),
                                                                children: const [
                                                                  TableRow(
                                                                      children: [
                                                                        TableHeadWidget(
                                                                          headText:
                                                                              'Bill No.',
                                                                        ),
                                                                        TableHeadWidget(
                                                                          headText:
                                                                              'Pending Amt.',
                                                                        ),
                                                                      ]),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        );
                                                      });
                                                    });
                                              },
                                              icon: const Icon(
                                                  Icons.navigate_next_rounded))
                                          : Container()
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      const DetailRowInfoWidget(
                                        labelOne: 'Query No.',
                                        dataOne: '',
                                      ),
                                      Expanded(
                                        child: Container(),
                                      ),
                                      SelectableText(
                                        "Date",
                                        style: TextStyle(
                                            fontSize: size.width * 0.03,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(child: Container()),
                                      TextButton(
                                          style: TextButton.styleFrom(
                                            minimumSize: Size.zero,
                                            padding: const EdgeInsets.all(3),
                                            tapTargetSize: MaterialTapTargetSize
                                                .shrinkWrap,
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            'See Complaint History',
                                            style: TextStyle(
                                                fontSize: size.width * 0.037,
                                                color: primaryColor),
                                          )),
                                      const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 17,
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(child: Container()),
                                      TextButton(
                                          style: TextButton.styleFrom(
                                            minimumSize: Size.zero,
                                            padding: const EdgeInsets.all(3),
                                            tapTargetSize: MaterialTapTargetSize
                                                .shrinkWrap,
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            'See Service History',
                                            style: TextStyle(
                                                fontSize: size.width * 0.037,
                                                color: primaryColor),
                                          )),
                                      const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 17,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
    );
  }
}
