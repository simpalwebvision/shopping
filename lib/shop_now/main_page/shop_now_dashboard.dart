import 'package:flutter/material.dart';
import 'package:shopping/shop_now/home/home_screen.dart';
import 'package:shopping/shop_now/main_page/component/bottom_navigation_bar.dart';
import 'package:shopping/shop_now/main_page/main_controller.dart';
import 'package:shopping/shop_now/order/order_screen.dart';
import 'package:shopping/shop_now/profile/profile_screen.dart';
import 'package:shopping/utils/common_function.dart';

class ShopNowDashboard extends StatefulWidget {
  const ShopNowDashboard({super.key});

  @override
  State<ShopNowDashboard> createState() => _ShopNowDashboardState();
}

class _ShopNowDashboardState extends State<ShopNowDashboard> {
  final _homeController = MainController();
  late List<Widget> pageList;
  @override
  void initState() {
    super.initState();
    CommonFunctions().disableCapture();
    pageList = [
      const HomeScreen(),
      const OrderScreen(),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<int>(
        initialData: 0,
        stream: _homeController.navListener.stream,
        builder: (context, snapshot) {
          int index = snapshot.data ?? 0;
          return pageList[index];
        },
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
