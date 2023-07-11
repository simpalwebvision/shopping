import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/utils/constant.dart';

class CustServiceHistoryScreen extends StatefulWidget {
  const CustServiceHistoryScreen({super.key});

  @override
  State<CustServiceHistoryScreen> createState() =>
      _CustServiceHistoryScreenState();
}

class _CustServiceHistoryScreenState extends State<CustServiceHistoryScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool showSearchBar = false, isLoading = false;
  List remark = ['Paid', 'Pending', 'Forward', 'Hold', 'Cancel', 'Bounce'];
  List listOfColumns = [
    {
      'index': "1",
      'date': "02-03-2023",
      'queryNo': '100',
      'comType': "Leakage",
      'remark': 'inProgress',
    },
    {
      'index': "2",
      'date': "02-03-2023",
      'queryNo': '100',
      'comType': "Machine Not Working",
      'remark': 'Done',
    },
    {
      'index': "3",
      'date': "02-03-2023",
      'queryNo': '100',
      'comType': "Siddhant",
      'remark': 'Done',
    },
    {
      'index': "4",
      'date': "02-03-2023",
      'queryNo': '100',
      'comType': "Siddhant",
      'remark': 'Done',
    },
    {
      'index': "5",
      'date': "02-03-2023",
      'queryNo': '100',
      'comType': "Siddhant",
      'remark': 'Done',
    },
    {
      'index': "6",
      'date': "02-03-2023",
      'queryNo': '100',
      'comType': "Siddhant",
      'remark': 'Done',
    },
  ];
  @override
  void initState() {
    super.initState();

    CommonFunctions().disableCapture();
    // getNotified();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: Color(0xFF13617E),

            // Status bar brightness (optional)
            statusBarIconBrightness:
                Brightness.light, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          backgroundColor: const Color(0xFF13617E),
          title: const Text('Service History'),
          actions: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Bill No. = ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.03),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Pending = ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.03),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '25195',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.03),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '2000',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.orange[900],
                              fontSize: size.width * 0.03),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
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
                        hintText: 'Search Complaint...',
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
            : HorizontalDataTable(
                leftHandSideColumnWidth: 50,
                rightHandSideColumnWidth: 600,
                isFixedHeader: true,
                headerWidgets: _getTitleWidget(),
                leftSideItemBuilder: _generateFirstColumnRow,
                rightSideItemBuilder: _generateRightHandSideColumnRow,
                itemCount: listOfColumns.length,
                rowSeparatorWidget: const Divider(
                  color: Colors.black54,
                  height: 1.0,
                  thickness: 0.0,
                ),
                leftHandSideColBackgroundColor: const Color(0xFFE1F5FC),
                rightHandSideColBackgroundColor: const Color(0xFFE1F5FC),
              ));
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('Sr.No', 50),
      _getTitleItemWidget('Date', 100),
      _getTitleItemWidget('Query. No.', 100),
      _getTitleItemWidget('Com Type', 200),
      _getTitleItemWidget('Remark', 100),
      _getTitleItemWidget('Bill PDF', 100),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      color: const Color(0xFF51aac9),
      width: width,
      height: 50,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Text(label,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white)),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      width: 50,
      height: 50,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
      child: Text(listOfColumns[index]['index'].toString()),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          height: 50,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text(listOfColumns[index]['date'].toString()),
        ),
        Container(
          width: 100,
          height: 50,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text(listOfColumns[index]['queryNo'].toString()),
        ),
        Container(
          width: 200,
          height: 50,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: const Text('siddhant sdjddoj aldlawdh aldlawdh'),
        ),
        Container(
          width: 100,
          height: 50,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: const Text('1,25,000'),
        ),
        SizedBox(
          width: 100,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(
                    'assets/svg_images/bill_pdf_icon.svg',
                    height: 20,
                  )),
            ],
          ),
        )
      ],
    );
  }
}
