import 'package:flutter/material.dart';
import 'package:shopping/screens/Sales/dashboard/sales_work_history/sales_bounce_history.dart';
import 'package:shopping/screens/Sales/dashboard/sales_work_history/sales_pending_history.dart';
import 'package:shopping/screens/Technician/dashboard/work_history/tech_history.dart';
import 'package:shopping/utils/common_function.dart';

class SalesHistoryMainScreen extends StatefulWidget {
  const SalesHistoryMainScreen({super.key});

  @override
  State<SalesHistoryMainScreen> createState() => _SalesHistoryMainScreenState();
}

class _SalesHistoryMainScreenState extends State<SalesHistoryMainScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    CommonFunctions().disableCapture();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('History'),
          bottom: TabBar(
            // isScrollable: true,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white54,
            labelStyle: const TextStyle(),
            controller: tabController,
            indicatorColor: Colors.white,
            indicatorWeight: 3.0,

            tabs: const [
              Tab(
                icon: BoderedStacktext(
                  value: '1250.00 \u{20B9}',
                ),
                child: Text(
                  'Pending',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Tab(
                icon: BoderedStacktext(
                  value: '1250.00 \u{20B9}',
                ),
                child: Text(
                  'Bounce',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: const [
            SalesPendingHistoryScreen(),
            SalesBounceHistoryScreen(),
          ],
        ));
  }
}
