import 'package:flutter/material.dart';
import 'package:shopping/screens/Sales/dashboard/sales_monthly_report/sales_cancel.dart';
import 'package:shopping/screens/Sales/dashboard/sales_monthly_report/sales_fitting.dart';
import 'package:shopping/screens/Sales/dashboard/sales_monthly_report/sales_hold.dart';
import 'package:shopping/screens/Technician/dashboard/work_history/tech_history.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/utils/constant.dart';

class SalesMonthlyReportScreen extends StatefulWidget {
  const SalesMonthlyReportScreen({super.key});

  @override
  State<SalesMonthlyReportScreen> createState() =>
      _SalesMonthlyReportScreenState();
}

class _SalesMonthlyReportScreenState extends State<SalesMonthlyReportScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int currentMon = 0;
  List months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    CommonFunctions().disableCapture();
    var now = DateTime.now();
    currentMon = now.month;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 77, 45, 138),
          title: const Text('Monthly Report'),
          actions: [
            Padding(
              padding: EdgeInsets.all(size.width * 0.015),
              child: Container(
                padding: EdgeInsets.only(
                    right: size.width * 0.03, left: size.width * 0.03),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Text(
                  months[currentMon - 1],
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: size.width * 0.03,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
          bottom: TabBar(
            // isScrollable: true,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white54,
            labelStyle: const TextStyle(),
            controller: tabController,
            indicatorColor: Colors.white,
            indicatorWeight: 3.0,

            tabs: [
              Tab(
                icon: Stack(
                  children: [
                    Text(
                      '15',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 1
                            ..color = const Color(0xFF1B5E20)),
                    ),
                    const Text(
                      '15',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 60, 255, 0),
                      ),
                    ),
                  ],
                ),
                child: Text(
                  'Fitting',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Tab(
                icon: const BoderedStacktext(
                  value: '5',
                ),
                child: Text(
                  'Hold',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Tab(
                icon: const BoderedStacktext(
                  value: '4',
                ),
                child: Text(
                  'Cancel',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: tabController,
          children: const [
            SalesFittingScreen(),
            SalesHoldScreen(),
            SalesCancelScreen(),
          ],
        ));
  }
}
