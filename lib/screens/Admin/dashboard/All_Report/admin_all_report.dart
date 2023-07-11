import 'package:flutter/material.dart';
import 'package:shopping/screens/Admin/dashboard/All_Report/bounce_report.dart';
import 'package:shopping/screens/Admin/dashboard/All_Report/pending_report.dart';

class AdminAllReportScreen extends StatefulWidget {
  const AdminAllReportScreen({super.key});

  @override
  State<AdminAllReportScreen> createState() => _AdminAllReportScreenState();
}

class _AdminAllReportScreenState extends State<AdminAllReportScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Report'),
        bottom: TabBar(
          // isScrollable: true,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.white,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          controller: tabController,
          indicatorColor: Colors.black,
          indicatorWeight: 2.0,
          indicator: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(0)),
          tabs: const [
            Tab(
              child: Text(
                'Pending',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Tab(
              child: Text(
                'Bounce',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [PendingReportScreen(), BounceReportScreen()],
      ),
    );
  }
}
