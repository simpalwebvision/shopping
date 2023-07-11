import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/screens/Admin/dashboard/All_Report/admin_all_report.dart';
import 'package:shopping/screens/Admin/dashboard/Employee/employee_master.dart';
import 'package:shopping/screens/Admin/dashboard/Spare_Parts/admin_spare_parts.dart';
import 'package:shopping/screens/Admin/dashboard/admin_customer_data.dart';
import 'package:shopping/screens/Super%20Admin/dashboard/Right_Management/right_management.dart';
import 'package:shopping/screens/Technician/dashboard/complaint/todays_work/tech_complain_master.dart';
import 'package:shopping/screens/Technician/dashboard/tech_my_account.dart';
import 'package:shopping/screens/Technician/dashboard/tech_notifiations.dart';
import 'package:shopping/screens/Technician/dashboard/tech_today_offer.dart';
import 'package:shopping/screens/splash_screen.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/utils/constant.dart';
import 'package:shopping/utils/local_shared_preferences.dart';
import 'package:shopping/widgets/background_decoration.dart';
import 'package:shopping/widgets/bottom_widget.dart';
import 'package:shopping/widgets/custom_route_page.dart';
import 'package:shopping/widgets/dashboard_widget.dart';
import 'package:shopping/widgets/drawer_tile.dart';
import 'package:shopping/widgets/svg_image_button.dart';

import '../Admin/dashboard/Work_History/work_history_main.dart';

class SuperAdminDashboardScreen extends StatefulWidget {
  const SuperAdminDashboardScreen({super.key});

  @override
  State<SuperAdminDashboardScreen> createState() =>
      _SuperAdminDashboardScreenState();
}

class _SuperAdminDashboardScreenState extends State<SuperAdminDashboardScreen> {
  // final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    CommonFunctions().disableCapture();
  }

  changeRoute() {
    Navigator.pop(context);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const SplashScreen()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // return BlocBuilder<SignInBloc, SignInState>(
    //   builder: (context, state) {
    //     if (state is SignInLoggedInState) {
    //       return
    //     } else if (state is SignInLoggedOutState) {
    //       return const SessionLogoutScreen();
    //     } else {
    //       return const SessionLogoutScreen();
    //     }
    //   },
    // );
    return Scaffold(
      // key: _key,
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(
              color: colorWhite,
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.w500),
        ),
        // actions: [
        //   IconButton(
        //       onPressed: () {}, icon: const Icon(Icons.qr_code_scanner_rounded))
        // ],
      ),

      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(children: [
          Stack(
            children: [
              SizedBox(
                height: size.height * 0.2,
                width: double.infinity,
                child: DrawerHeader(
                  decoration: const BoxDecoration(
                    color: primaryColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: size.height * 0.08,
                        width: size.width * 0.15,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(1, 1),
                              blurRadius: 20,
                              color: Colors.white.withOpacity(0.6),
                            ),
                          ],
                        ),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('UserName',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'SuezOne',
                              fontSize: size.width * 0.035)),
                    ],
                  ),
                ),
              ),
              Positioned(
                  right: 10,
                  top: 10,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyAccountScreen()));
                    },
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
          DrawerTile(
            imageAsset: 'assets/svg_images/mastercreation.svg',
            tilename: 'Employee Master',
            ontap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EmployeeAdminScreen()));
            },
          ),
          DrawerTile(
            imageAsset: 'assets/svg_images/technician_images/complain.svg',
            tilename: 'Complaints',
            ontap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TechComplainMaster(
                            isLogin: 'SuperAdmin',
                          )));
            },
          ),
          DrawerTile(
            imageAsset: 'assets/svg_images/technician_images/history.svg',
            tilename: 'Work History',
            ontap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const AdminWorkHistoryMainScreen()));
            },
          ),
          DrawerTile(
            imageAsset: 'assets/svg_images/technician_images/spare_parts.svg',
            tilename: 'Spare Parts',
            ontap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AdminSparePartScreen()));
            },
          ),
          DrawerTile(
            imageAsset: 'assets/svg_images/employee_profile.svg',
            tilename: 'Customer Data',
            ontap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AdminCustomerData()));
            },
          ),
          DrawerTile(
            imageAsset: 'assets/svg_images/all_report.svg',
            tilename: 'All Report',
            ontap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AdminAllReportScreen()));
            },
          ),
          DrawerTile(
            imageAsset: 'assets/svg_images/rights_management.svg',
            tilename: 'Rights Management',
            ontap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RightManagementScreen()));
            },
          ),
          DrawerTile(
            imageAsset: 'assets/svg_images/technician_images/todays_offer.svg',
            tilename: "Today's Offer",
            ontap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TodayOfferScreen()));
            },
          ),
          DrawerTile(
            imageAsset: 'assets/svg_images/notification.svg',
            tilename: "Notification",
            ontap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TechNotificationsScreen()));
            },
          ),
          DrawerTile(
            imageAsset: 'assets/svg_images/logout.svg',
            tilename: "Logout",
            ontap: () async {
              LocalPreferences().setSuperAdminLoginBool(false);
              final preferences = await SharedPreferences.getInstance();
              await preferences.clear();
              changeRoute();
            },
          ),
        ]),
      ),
      body: Stack(
        children: [
          // customAppBar(
          //   size,
          // ),
          Container(
            decoration: BackgroundDecoration().boxD(),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.center,
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 20.0,
                  children: [
                    DashboardWidget(
                      widgetText: 'Employee Master',
                      notificationVal: "",
                      imageAssets: 'assets/svg_images/mastercreation.svg',
                      onClicked: () {
                        Navigator.push(
                            context,
                            CustomPageRoute(
                                direction: AxisDirection.up,
                                child: const EmployeeAdminScreen()));
                      },
                    ),
                    DashboardWidget(
                      widgetText: 'Complaints',
                      notificationVal: "",
                      imageAssets:
                          'assets/svg_images/technician_images/complain.svg',
                      onClicked: () {
                        Navigator.push(
                            context,
                            CustomPageRoute(
                                direction: AxisDirection.up,
                                child: const TechComplainMaster(
                                  isLogin: 'SuperAdmin',
                                )));
                      },
                    ),
                    DashboardWidget(
                      widgetText: 'Work History',
                      notificationVal: "",
                      imageAssets:
                          'assets/svg_images/technician_images/history.svg',
                      onClicked: () {
                        Navigator.push(
                            context,
                            CustomPageRoute(
                                direction: AxisDirection.up,
                                child: const AdminWorkHistoryMainScreen()));
                      },
                    ),
                    DashboardWidget(
                      widgetText: 'Spare Parts',
                      notificationVal: "",
                      imageAssets:
                          'assets/svg_images/technician_images/spare_parts.svg',
                      onClicked: () {
                        Navigator.push(
                            context,
                            CustomPageRoute(
                                direction: AxisDirection.up,
                                child: const AdminSparePartScreen()));
                      },
                    ),
                    DashboardWidget(
                      widgetText: 'Customer Data',
                      notificationVal: "",
                      imageAssets: 'assets/svg_images/employee_profile.svg',
                      onClicked: () {
                        Navigator.push(
                            context,
                            CustomPageRoute(
                                direction: AxisDirection.up,
                                child: const AdminCustomerData()));
                      },
                    ),
                    DashboardWidget(
                      widgetText: 'All Report',
                      notificationVal: "",
                      imageAssets: 'assets/svg_images/all_report.svg',
                      onClicked: () {
                        Navigator.push(
                            context,
                            CustomPageRoute(
                                direction: AxisDirection.up,
                                child: const AdminAllReportScreen()));
                      },
                    ),
                    DashboardWidget(
                      widgetText: "Rights Management",
                      notificationVal: "",
                      imageAssets: 'assets/svg_images/rights_management.svg',
                      onClicked: () {
                        Navigator.push(
                            context,
                            CustomPageRoute(
                                direction: AxisDirection.up,
                                child: const RightManagementScreen()));
                      },
                    ),
                    DashboardWidget(
                      widgetText: "Today's Offer",
                      notificationVal: "",
                      imageAssets:
                          'assets/svg_images/technician_images/todays_offer.svg',
                      onClicked: () {
                        Navigator.push(
                            context,
                            CustomPageRoute(
                                direction: AxisDirection.up,
                                child: const TodayOfferScreen()));
                      },
                    ),
                    DashboardWidget(
                      widgetText: "My Account",
                      notificationVal: "",
                      imageAssets:
                          'assets/svg_images/technician_images/my_account.svg',
                      onClicked: () {
                        Navigator.push(
                            context,
                            CustomPageRoute(
                                direction: AxisDirection.up,
                                child: const MyAccountScreen()));
                      },
                    ),
                    DashboardWidget(
                      widgetText: "Notification",
                      imageAssets: 'assets/svg_images/notification.svg',
                      onClicked: () {
                        Navigator.push(
                            context,
                            CustomPageRoute(
                                direction: AxisDirection.up,
                                child: const TechNotificationsScreen()));
                      },
                      notificationVal: "5",
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomSheet: BottomWidget(size: size),
    );
  }

  Widget customAppBar(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
      child: Row(
        children: [
          SvgImageButton(
            imageAsset: 'assets/svg_images/drawer_menu.svg',
            imgSize: 32,
            onTap: () {
              // _key.currentState!.openDrawer();
            },
          ),
          const SizedBox(
            width: 25,
          ),
          Text(
            'Dashboard',
            style: TextStyle(
                color: primaryColor,
                fontSize: size.width * 0.043,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
