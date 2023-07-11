import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/screens/Admin/admin_dashboard.dart';
import 'package:shopping/screens/Customer/cust_dashboard.dart';
import 'package:shopping/screens/Sales/sales_dashboard.dart';
import 'package:shopping/screens/Super%20Admin/s_admin_dashboard.dart';
import 'package:shopping/screens/Technician/technician_dashboard.dart';
import 'package:shopping/screens/choose_login_screen.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/utils/constant.dart';
import 'package:shopping/utils/local_shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool technicianLoggedIn = false,
      salesLoggedIn = false,
      customerLoggedIn = false,
      adminLoggedIn = false,
      supAdminLoggedIn = false;
  @override
  void initState() {
    super.initState();
    CommonFunctions().disableCapture();
    getislogin();
    // Future.delayed(const Duration(seconds: 2), () {

    // });
  }

  getislogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    technicianLoggedIn = prefs.getBool(technicianLoginKey) ?? false;
    salesLoggedIn = prefs.getBool(salesLoginKey) ?? false;
    customerLoggedIn = prefs.getBool(customerLoginKey) ?? false;
    adminLoggedIn = prefs.getBool(adminLoginKey) ?? false;
    supAdminLoggedIn = prefs.getBool(superAdminLoginKey) ?? false;

    delayedFunction();
  }

  delayedFunction() {
    if (technicianLoggedIn) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => const TechnicianDashboardScreen()),
          (route) => false);
    } else if (salesLoggedIn) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const SalesDashboardScreen()),
          (route) => false);
    } else if (customerLoggedIn) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const CustDashboardScreen()),
          (route) => false);
    } else if (adminLoggedIn) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const AdminDashboardScreen()),
          (route) => false);
    } else if (supAdminLoggedIn) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => const SuperAdminDashboardScreen()),
          (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const ChooseLoginScreen()),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: appgradientColor,
        ),
        height: size.height,
        width: size.width,
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            child: Lottie.asset(
                'assets/json_files/water-loading-animation.json',
                height: 80),
          ),
        ),
      ),
    );
  }
}
