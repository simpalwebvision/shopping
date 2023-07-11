import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping/screens/Technician/dashboard/order_form/machine_repair_tab.dart';
import 'package:shopping/screens/Technician/dashboard/order_form/new_order_form.dart';
import 'package:shopping/utils/common_function.dart';

class OrderFormScreen extends StatefulWidget {
  const OrderFormScreen({super.key});

  @override
  State<OrderFormScreen> createState() => _OrderFormScreenState();
}

class _OrderFormScreenState extends State<OrderFormScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    CommonFunctions().disableCapture();
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
        title: const Text('Order Form'),
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
              icon: Icon(Icons.assignment),
              child: Text(
                'New Order Form',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Tab(
              icon: Icon(FontAwesomeIcons.wrench),
              child: Text(
                'Machine Repair',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          NewOrderFormTab(ctx: context),
          const MachineRepairTab(),
        ],
      ),
    );
  }
}
