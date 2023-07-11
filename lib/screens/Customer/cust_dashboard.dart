import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/screens/Customer/dashboard/cust_complain_master.dart';
import 'package:shopping/screens/Customer/dashboard/cust_service_history.dart';
import 'package:shopping/screens/Technician/dashboard/tech_my_account.dart';
import 'package:shopping/screens/Technician/dashboard/tech_notifiations.dart';
import 'package:shopping/screens/Technician/dashboard/tech_ref_to_friend.dart';
import 'package:shopping/screens/Technician/dashboard/tech_today_offer.dart';
import 'package:shopping/screens/dashboard_plans.dart';
import 'package:shopping/screens/splash_screen.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/utils/constant.dart';
import 'package:shopping/utils/local_shared_preferences.dart';
import 'package:shopping/widgets/background_decoration.dart';
import 'package:shopping/widgets/bottom_widget.dart';
import 'package:shopping/widgets/drawer_tile.dart';
import 'package:shopping/widgets/svg_image_button.dart';

class CustDashboardScreen extends StatefulWidget {
  const CustDashboardScreen({
    super.key,
  });

  @override
  State<CustDashboardScreen> createState() => _CustDashboardScreenState();
}

class _CustDashboardScreenState extends State<CustDashboardScreen> {
  @override
  void initState() {
    super.initState();
    CommonFunctions().disableCapture();
    // getNotified();
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
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: primaryColor,

          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
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
            imageAsset: 'assets/svg_images/technician_images/complain.svg',
            tilename: 'Book Complaint',
            ontap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CustComplainMaster()));
            },
          ),
          DrawerTile(
            imageAsset: 'assets/svg_images/technician_images/amcdata.svg',
            tilename: 'Plans',
            ontap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DashboardPlansScreen()));
            },
          ),
          DrawerTile(
            imageAsset: 'assets/svg_images/technician_images/history.svg',
            tilename: 'Service History',
            ontap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CustServiceHistoryScreen()));
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
            imageAsset: 'assets/svg_images/technician_images/shop_now.svg',
            tilename: "Shop Now",
            ontap: () {
              Navigator.pop(context);
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const TopUpWalletScreen()));
            },
          ),
          DrawerTile(
            imageAsset:
                'assets/svg_images/technician_images/refer_to_friend.svg',
            tilename: "Refer To Friend",
            ontap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TechReferToFriend()));
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
              LocalPreferences().setCustomerLoginBool(false);
              final preferences = await SharedPreferences.getInstance();
              await preferences.clear();
              changeRoute();
            },
          ),
        ]),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BackgroundDecoration().boxD(),
          ),
          // SingleChildScrollView(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Container(
          //       alignment: Alignment.center,
          //       child: GridView.count(
          //         shrinkWrap: true,
          //         crossAxisCount: 3,
          //         crossAxisSpacing: 8.0,
          //         mainAxisSpacing: 20.0,
          //         children: [
          //           DashboardWidget(
          //             widgetText: 'Book Complaint',
          //             notificationVal: "",
          //             imageAssets:
          //                 'assets/svg_images/technician_images/complain.svg',
          //             onClicked: () {
          //               Navigator.push(
          //                   context,
          //                   CustomPageRoute(
          //                       direction: AxisDirection.up,
          //                       child: const CustComplainMaster()));
          //             },
          //           ),
          //           DashboardWidget(
          //             widgetText: 'Plans',
          //             notificationVal: "",
          //             imageAssets:
          //                 'assets/svg_images/technician_images/amcdata.svg',
          //             onClicked: () {
          //               Navigator.push(
          //                   context,
          //                   CustomPageRoute(
          //                       direction: AxisDirection.up,
          //                       child: const DashboardPlansScreen()));
          //             },
          //           ),
          //           DashboardWidget(
          //             widgetText: 'Service History',
          //             notificationVal: "",
          //             imageAssets:
          //                 'assets/svg_images/technician_images/history.svg',
          //             onClicked: () {
          //               Navigator.push(
          //                   context,
          //                   CustomPageRoute(
          //                       direction: AxisDirection.up,
          //                       child: const CustServiceHistoryScreen()));
          //             },
          //           ),
          //           DashboardWidget(
          //             widgetText: "Today's Offer",
          //             notificationVal: "",
          //             imageAssets:
          //                 'assets/svg_images/technician_images/todays_offer.svg',
          //             onClicked: () {
          //               Navigator.push(
          //                   context,
          //                   CustomPageRoute(
          //                       direction: AxisDirection.up,
          //                       child: const TodayOfferScreen()));
          //             },
          //           ),
          //           DashboardWidget(
          //             widgetText: "Shop Now",
          //             notificationVal: "",
          //             imageAssets:
          //                 'assets/svg_images/technician_images/shop_now.svg',
          //             onClicked: () {},
          //           ),
          //           DashboardWidget(
          //             widgetText: "My Account",
          //             notificationVal: "",
          //             imageAssets:
          //                 'assets/svg_images/technician_images/my_account.svg',
          //             onClicked: () {
          //               Navigator.push(
          //                   context,
          //                   CustomPageRoute(
          //                       direction: AxisDirection.up,
          //                       child: const MyAccountScreen()));
          //             },
          //           ),
          //           DashboardWidget(
          //             widgetText: "Refer To Friend",
          //             imageAssets:
          //                 'assets/svg_images/technician_images/refer_to_friend.svg',
          //             onClicked: () {
          //               Navigator.push(
          //                   context,
          //                   CustomPageRoute(
          //                       direction: AxisDirection.up,
          //                       child: const TechReferToFriend()));
          //             },
          //             notificationVal: "",
          //           ),
          //           DashboardWidget(
          //             widgetText: "Notification",
          //             imageAssets: 'assets/svg_images/notification.svg',
          //             onClicked: () {
          //               Navigator.push(
          //                   context,
          //                   CustomPageRoute(
          //                       direction: AxisDirection.up,
          //                       child: const TechNotificationsScreen()));
          //             },
          //             notificationVal: "5",
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // )
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
            onTap: () {},
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
