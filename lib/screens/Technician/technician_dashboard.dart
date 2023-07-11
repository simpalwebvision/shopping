import 'dart:async';

// import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/screens/Technician/dashboard/complaint/todays_work/tech_complain_master.dart';
import 'package:shopping/screens/Technician/dashboard/order_form/order_form.dart';
import 'package:shopping/screens/Technician/dashboard/spare_parts/tech_spare_part.dart';
import 'package:shopping/screens/Technician/dashboard/tech_code_scanner.dart';
import 'package:shopping/screens/Technician/dashboard/tech_my_account.dart';
import 'package:shopping/screens/Technician/dashboard/tech_notifiations.dart';
import 'package:shopping/screens/Technician/dashboard/tech_ref_to_friend.dart';
import 'package:shopping/screens/Technician/dashboard/tech_today_offer.dart';
import 'package:shopping/screens/Technician/dashboard/work_history/tech_history.dart';
import 'package:shopping/screens/dashboard_plans.dart';
import 'package:shopping/screens/splash_screen.dart';
import 'package:shopping/shop_now/main_page/shop_now_dashboard.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/utils/constant.dart';
import 'package:shopping/utils/local_shared_preferences.dart';
import 'package:shopping/widgets/background_decoration.dart';
import 'package:shopping/widgets/bottom_widget.dart';
import 'package:shopping/widgets/custom_route_page.dart';
import 'package:shopping/widgets/dashboard_widget.dart';
import 'package:shopping/widgets/drawer_tile.dart';
import 'package:shopping/widgets/svg_image_button.dart';

import 'package:workmanager/workmanager.dart' as WorkM;

class TechnicianDashboardScreen extends StatefulWidget {
  const TechnicianDashboardScreen({super.key});

  @override
  State<TechnicianDashboardScreen> createState() =>
      _TechnicianDashboardScreenState();
}

class _TechnicianDashboardScreenState extends State<TechnicianDashboardScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  Stopwatch watch = Stopwatch();
  Timer? timer;
  bool startStop = true;

  String elapsedTime = '';

  updateTime(Timer timer) {
    if (watch.isRunning) {
      setState(() {
        print("startstop Inside=$startStop");
        elapsedTime = transformMilliSeconds(watch.elapsedMilliseconds);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    CommonFunctions().disableCapture();
    // getNotified();
  }

  getNotified() async {
    String tooken = await LocalPreferences().getUserToken() ?? '';

    CommonFunctions().sendPushMessage(
        tooken, "You have 5 Pending Notification", "Notifications");
  }

  changeRoute() {
    Navigator.pop(context);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const SplashScreen()),
        (route) => false);
  }

  startOrStop() {
    if (startStop) {
      startWatch();
    } else {
      stopWatch();
    }
  }

  startWatch() {
    setState(() {
      startStop = false;
      watch.start();
      timer = Timer.periodic(const Duration(milliseconds: 100), updateTime);
    });
  }

  stopWatch() {
    setState(() {
      startStop = true;
      watch.stop();
      setTime();
    });
  }

  setTime() {
    var timeSoFar = watch.elapsedMilliseconds;
    setState(() {
      elapsedTime = transformMilliSeconds(timeSoFar);
    });
  }

  transformMilliSeconds(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    String hoursStr = (hours % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return "$hoursStr:$minutesStr:$secondsStr";
  }

  // Future<void> initPlatformState() async {
  //   // Configure BackgroundFetch.
  //   BackgroundFetch.configure(
  //           BackgroundFetchConfig(
  //               minimumFetchInterval: 1,
  //               stopOnTerminate: false,
  //               enableHeadless: true,
  //               requiresBatteryNotLow: false,
  //               requiresCharging: false,
  //               requiresStorageNotLow: false,
  //               requiresDeviceIdle: false,
  //               requiredNetworkType: NetworkType.NONE),
  //           _onBackgroundFetch)
  //       .then((int status) async {
  //     // flutterLocalNotificationsPlugin.show(
  //     //     0,
  //     //     "Billing Date",
  //     //     "[BackgroundFetch] configure success: $status'",
  //     //     NotificationDetails(
  //     //         android: AndroidNotificationDetails(channel.id, channel.name,
  //     //             channelDescription: channel.description,
  //     //             importance: Importance.high,
  //     //             color: Colors.blue,
  //     //             playSound: true,
  //     //             icon: '@mipmap/ic_launcher')));
  //     print('[BackgroundFetch] configure success: $status');
  //   }).catchError((e) {
  //     flutterLocalNotificationsPlugin.show(
  //         0,
  //         "Billing Date",
  //         "[BackgroundFetch] configure ERROR: $e",
  //         NotificationDetails(
  //             android: AndroidNotificationDetails(channel.id, channel.name,
  //                 channelDescription: channel.description,
  //                 importance: Importance.high,
  //                 color: Colors.blue,
  //                 playSound: true,
  //                 icon: '@mipmap/ic_launcher')));
  //     print('[BackgroundFetch] configure ERROR: $e');
  //   });
  //   int status = await BackgroundFetch.status;

  //   if (!mounted) return;
  // }

  // void _onBackgroundFetch(String taskId) async {
  //   flutterLocalNotificationsPlugin.show(
  //       0,
  //       "Message",
  //       "From Current Scene",
  //       NotificationDetails(
  //           android: AndroidNotificationDetails(channel.id, channel.name,
  //               channelDescription: channel.description,
  //               importance: Importance.high,
  //               color: Colors.blue,
  //               playSound: true,
  //               icon: '@mipmap/ic_launcher')));
  //   BackgroundFetch.finish(taskId);
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // return BlocBuilder<SignInBloc, SignInState>(
    //   builder: (context, state) {
    //     if (state is SignInLoggedInState) {
    //       return
    //       Scaffold(
    //         key: _key,
    //         drawer: Drawer(
    //           backgroundColor: primaryColor,
    //           child: ListView(children: [
    //             DrawerTile(
    //               imageAsset:
    //                   'assets/svg_images/technician_images/complain.svg',
    //               tilename: 'Complaint',
    //               ontap: () {
    //                 Navigator.pop(context);
    //                 Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                         builder: (context) => const TechComplainMaster(
    //                               isAdmin: false,
    //                             )));
    //               },
    //             ),
    //             DrawerTile(
    //               imageAsset: 'assets/svg_images/technician_images/amcdata.svg',
    //               tilename: 'Plans',
    //               ontap: () {
    //                 Navigator.pop(context);
    //                 // Navigator.push(
    //                 //     context,
    //                 //     MaterialPageRoute(
    //                 //         builder: (context) => const TopUpWalletScreen()));
    //               },
    //             ),
    //             DrawerTile(
    //               imageAsset: 'assets/svg_images/technician_images/history.svg',
    //               tilename: 'History',
    //               ontap: () {
    //                 Navigator.pop(context);
    //                 Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                         builder: (context) => const TechHistoryScreen(
    //                               loginType: 'Technician',
    //                             )));
    //               },
    //             ),
    //             DrawerTile(
    //               imageAsset:
    //                   'assets/svg_images/technician_images/spare_parts.svg',
    //               tilename: 'Spare Parts',
    //               ontap: () {
    //                 Navigator.pop(context);
    //                 Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                         builder: (context) => const TechSparePartScreen()));
    //               },
    //             ),
    //             DrawerTile(
    //               imageAsset:
    //                   'assets/svg_images/technician_images/todays_offer.svg',
    //               tilename: "Today's Offer",
    //               ontap: () {
    //                 Navigator.pop(context);
    //                 Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                         builder: (context) => const TodayOfferScreen()));
    //               },
    //             ),
    //             DrawerTile(
    //               imageAsset:
    //                   'assets/svg_images/technician_images/shop_now.svg',
    //               tilename: "Shop Now",
    //               ontap: () {
    //                 Navigator.pop(context);
    //                 Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                         builder: (context) => const ShopNowDashboard()));
    //               },
    //             ),
    //             DrawerTile(
    //               imageAsset:
    //                   'assets/svg_images/technician_images/refer_to_friend.svg',
    //               tilename: "Refer To Friend",
    //               ontap: () {
    //                 Navigator.pop(context);
    //                 Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                         builder: (context) => const TechReferToFriend()));
    //               },
    //             ),
    //             DrawerTile(
    //               imageAsset: 'assets/svg_images/notification.svg',
    //               tilename: "Notification",
    //               ontap: () {
    //                 Navigator.pop(context);
    //                 Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                         builder: (context) =>
    //                             const TechNotificationsScreen()));
    //               },
    //             ),
    //             DrawerTile(
    //               imageAsset: 'assets/svg_images/logout.svg',
    //               tilename: "Logout",
    //               ontap: () async {
    //                 LocalPreferences().setTechnicianLoginBool(false);
    //                 final preferences = await SharedPreferences.getInstance();
    //                 await preferences.clear();
    //                 changeRoute();
    //               },
    //             ),
    //           ]),
    //         ),
    //         body: SafeArea(
    //             child: Column(
    //           children: [
    //             customAppBar(
    //               size,
    //             ),
    //             Expanded(
    //               child: Center(
    //                 child: Padding(
    //                   padding: const EdgeInsets.all(8.0),
    //                   child: Container(
    //                     alignment: Alignment.center,
    //                     child: GridView.count(
    //                       shrinkWrap: true,
    //                       crossAxisCount: 3,
    //                       crossAxisSpacing: 8.0,
    //                       mainAxisSpacing: 20.0,
    //                       children: [
    //                         DashboardWidget(
    //                           widgetText: 'Complaint',
    //                           notificationVal: "",
    //                           imageAssets:
    //                               'assets/svg_images/technician_images/complain.svg',
    //                           onClicked: () {
    //                             Navigator.push(
    //                                 context,
    //                                 CustomPageRoute(
    //                                     direction: AxisDirection.up,
    //                                     child: const TechComplainMaster(
    //                                       isAdmin: false,
    //                                     )));
    //                           },
    //                         ),
    //                         DashboardWidget(
    //                           widgetText: 'Plans',
    //                           notificationVal: "",
    //                           imageAssets:
    //                               'assets/svg_images/technician_images/amcdata.svg',
    //                           onClicked: () {},
    //                         ),
    //                         DashboardWidget(
    //                           widgetText: 'History',
    //                           notificationVal: "",
    //                           imageAssets:
    //                               'assets/svg_images/technician_images/history.svg',
    //                           onClicked: () {
    //                             Navigator.push(
    //                                 context,
    //                                 CustomPageRoute(
    //                                     direction: AxisDirection.up,
    //                                     child: const TechHistoryScreen(
    //                                         loginType: 'Technician')));
    //                           },
    //                         ),
    //                         DashboardWidget(
    //                           widgetText: 'Spare Parts',
    //                           notificationVal: "",
    //                           imageAssets:
    //                               'assets/svg_images/technician_images/spare_parts.svg',
    //                           onClicked: () {
    //                             Navigator.push(
    //                                 context,
    //                                 CustomPageRoute(
    //                                     direction: AxisDirection.up,
    //                                     child: const TechSparePartScreen()));
    //                           },
    //                         ),
    //                         DashboardWidget(
    //                           widgetText: "Today's Offer",
    //                           notificationVal: "",
    //                           imageAssets:
    //                               'assets/svg_images/technician_images/todays_offer.svg',
    //                           onClicked: () {
    //                             Navigator.push(
    //                                 context,
    //                                 CustomPageRoute(
    //                                     direction: AxisDirection.up,
    //                                     child: const TodayOfferScreen()));
    //                           },
    //                         ),
    //                         DashboardWidget(
    //                           widgetText: "Shop Now",
    //                           notificationVal: "",
    //                           imageAssets:
    //                               'assets/svg_images/technician_images/shop_now.svg',
    //                           onClicked: () {
    //                             Navigator.push(
    //                                 context,
    //                                 MaterialPageRoute(
    //                                     builder: (context) =>
    //                                         const ShopNowDashboard()));
    //                           },
    //                         ),
    //                         DashboardWidget(
    //                           widgetText: "My Account",
    //                           notificationVal: "",
    //                           imageAssets:
    //                               'assets/svg_images/technician_images/my_account.svg',
    //                           onClicked: () {
    //                             Navigator.push(
    //                                 context,
    //                                 CustomPageRoute(
    //                                     direction: AxisDirection.up,
    //                                     child: const MyAccountScreen()));
    //                           },
    //                         ),
    //                         DashboardWidget(
    //                           widgetText: "Refer To Friend",
    //                           imageAssets:
    //                               'assets/svg_images/technician_images/refer_to_friend.svg',
    //                           onClicked: () {
    //                             Navigator.push(
    //                                 context,
    //                                 CustomPageRoute(
    //                                     direction: AxisDirection.up,
    //                                     child: const TechReferToFriend()));
    //                           },
    //                           notificationVal: "",
    //                         ),
    //                         DashboardWidget(
    //                           widgetText: "Notification",
    //                           imageAssets: 'assets/svg_images/notification.svg',
    //                           onClicked: () {
    //                             Navigator.push(
    //                                 context,
    //                                 CustomPageRoute(
    //                                     direction: AxisDirection.up,
    //                                     child:
    //                                         const TechNotificationsScreen()));
    //                           },
    //                           notificationVal: "5",
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             )
    //           ],
    //         )),
    //         bottomSheet: BottomWidget(size: size),
    //       );
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
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.qr_code_scanner_rounded))
        ],
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
            tilename: "Today's Work",
            ontap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TechComplainMaster(
                            isLogin: 'Technician',
                          )));
            },
          ),
          DrawerTile(
            imageAsset: 'assets/svg_images/order_form.svg',
            tilename: "Order Form",
            ontap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OrderFormScreen()));
            },
          ),
          DrawerTile(
            imageAsset: 'assets/svg_images/technician_images/amcdata.svg',
            tilename: 'Plans',
            ontap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  CustomPageRoute(
                      direction: AxisDirection.up,
                      child: const DashboardPlansScreen()));
            },
          ),
          DrawerTile(
            imageAsset: 'assets/svg_images/technician_images/history.svg',
            tilename: 'History',
            ontap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TechHistoryScreen()));
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
                      builder: (context) => const TechSparePartScreen()));
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShopNowDashboard(),
                  ));
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
              LocalPreferences().setTechnicianLoginBool(false);
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
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 20.0,
                      children: [
                        DashboardWidget(
                          widgetText: "Today's Work",
                          notificationVal: "",
                          imageAssets:
                              'assets/svg_images/technician_images/complain.svg',
                          onClicked: () {
                            Navigator.push(
                                context,
                                CustomPageRoute(
                                    direction: AxisDirection.up,
                                    child: const TechComplainMaster(
                                      isLogin: "Technician",
                                    )));
                          },
                        ),
                        DashboardWidget(
                          widgetText: 'Order Form',
                          notificationVal: "",
                          imageAssets: 'assets/svg_images/order_form.svg',
                          onClicked: () {
                            Navigator.push(
                                context,
                                CustomPageRoute(
                                    direction: AxisDirection.up,
                                    child: const OrderFormScreen()));
                          },
                        ),
                        DashboardWidget(
                          widgetText: 'Plans',
                          notificationVal: "",
                          imageAssets:
                              'assets/svg_images/technician_images/amcdata.svg',
                          onClicked: () {
                            Navigator.push(
                                context,
                                CustomPageRoute(
                                    direction: AxisDirection.up,
                                    child: const DashboardPlansScreen()));
                          },
                        ),
                        DashboardWidget(
                          widgetText: 'History',
                          notificationVal: "",
                          imageAssets:
                              'assets/svg_images/technician_images/history.svg',
                          onClicked: () {
                            Navigator.push(
                                context,
                                CustomPageRoute(
                                    direction: AxisDirection.up,
                                    child: const TechHistoryScreen()));
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
                                    child: const TechSparePartScreen()));
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
                          widgetText: "Shop Now",
                          notificationVal: "",
                          imageAssets:
                              'assets/svg_images/technician_images/shop_now.svg',
                          onClicked: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShopNowDashboard()));
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
                          widgetText: "Refer To Friend",
                          imageAssets:
                              'assets/svg_images/technician_images/refer_to_friend.svg',
                          onClicked: () {
                            Navigator.push(
                                context,
                                CustomPageRoute(
                                    direction: AxisDirection.up,
                                    child: const TechReferToFriend()));
                          },
                          notificationVal: "",
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
                  Column(
                    children: <Widget>[
                      Text(elapsedTime,
                          style: const TextStyle(
                              fontSize: 25.0, color: Colors.black)),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FloatingActionButton(
                              backgroundColor: Colors.green,
                              onPressed: () {
                                WorkM.Workmanager().registerOneOffTask(
                                    'taskOne', 'print ttask',
                                    initialDelay: Duration(seconds: 30),
                                    constraints: WorkM.Constraints(
                                        networkType:
                                            WorkM.NetworkType.not_required));
                              }, //resetWatch,
                              child: Icon(Icons.check)),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
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
              _key.currentState!.openDrawer();
            },
          ),
          const SizedBox(
            width: 25,
          ),
          Text(
            'Dashboard',
            style: TextStyle(
                color: primaryColor,
                fontSize: size.width * 0.04,
                fontWeight: FontWeight.w500),
          ),
          Expanded(child: Container()),
          // SvgImageButton(
          //   imageAsset: 'assets/svg_images/notification.svg',
          //   imgSize: 28,
          //   onTap: () {},
          // ),
          // const SizedBox(
          //   width: 10,
          // ),
          SvgImageButton(
            imageAsset: 'assets/svg_images/technician_images/qrcode.svg',
            imgSize: 28,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TechQrScannerScreen()));
            },
          ),
        ],
      ),
    );
  }
}
