import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping/shop_now/main_page/main_controller.dart';
import 'package:shopping/utils/constant.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MainController();
    return SizedBox(
        child: ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      child: StreamBuilder(
        initialData: 0,
        stream: controller.navListener.stream,
        builder: (context, snapshot) {
          int selectedIndex = snapshot.data ?? 0;

          return BottomNavigationBar(
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            backgroundColor: yelloBackground,
            selectedLabelStyle:
                const TextStyle(fontSize: 14, color: lightningYellowColor),
            unselectedLabelStyle:
                const TextStyle(fontSize: 14, color: Color(0xff85959E)),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svg_images/home_icon.svg',
                    color: primaryColor),
                activeIcon: SvgPicture.asset(
                  'assets/svg_images/home-active.svg',
                ),
                label: 'Home',
              ),
              // BottomNavigationBarItem(
              //   icon: SvgPicture.asset(Kimages.inboxIcon),
              //   activeIcon: SvgPicture.asset(Kimages.inboxActive),
              //   label: 'Inbox',
              // ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svg_images/order_icon.svg',
                    color: primaryColor),
                activeIcon: SvgPicture.asset(
                  'assets/svg_images/order-active.svg',
                ),
                label: 'Order',
              ),
              BottomNavigationBarItem(
                tooltip: 'Profile',
                activeIcon: SvgPicture.asset(
                  'assets/svg_images/profile-active.svg',
                ),
                icon: SvgPicture.asset('assets/svg_images/profile_icon.svg',
                    color: primaryColor),
                label: 'Profile',
              ),
            ],
            // type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            onTap: (int index) {
              controller.navListener.sink.add(index);
            },
          );
        },
      ),
    ));
  }
}
