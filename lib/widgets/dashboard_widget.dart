import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as badges;

class DashboardWidget extends StatelessWidget {
  final String widgetText, imageAssets;
  final String? notificationVal;
  final VoidCallback onClicked;

  const DashboardWidget(
      {super.key,
      required this.widgetText,
      required this.imageAssets,
      required this.onClicked,
      this.notificationVal});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.grey, width: 1),
        ),
        shadowColor: Colors.grey.withOpacity(0.3),
        elevation: 5.0,
        child: InkWell(
          onTap: onClicked,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (notificationVal == null || notificationVal == "")
                  ? SvgPicture.asset(
                      imageAssets,
                      height: size.height * 0.07,
                      width: size.width * 0.05,
                    )
                  : badges.Badge(
                      badgeStyle: const badges.BadgeStyle(
                        shape: badges.BadgeShape.circle,
                        borderSide: BorderSide(color: Colors.black87),
                        badgeColor: Colors.amber,
                        padding: EdgeInsets.all(10),
                        elevation: 0,
                      ),
                      badgeAnimation: const badges.BadgeAnimation.rotation(
                        animationDuration: Duration(seconds: 1),
                        colorChangeAnimationDuration: Duration(seconds: 1),
                        loopAnimation: false,
                        curve: Curves.fastOutSlowIn,
                        colorChangeAnimationCurve: Curves.easeInCubic,
                      ),
                      badgeContent: const Text(
                        "5",
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                      ),
                      child: SvgPicture.asset(
                        imageAssets,
                        height: size.height * 0.07,
                        width: size.width * 0.05,
                      ),
                    ),

              const SizedBox(
                height: 10,
              ),
              Text(
                widgetText,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: size.width * 0.027),
              ),
              // (notificationVal == null || notificationVal == "")
              //     ? Container()
              //     : Container(
              //         padding: const EdgeInsets.all(8),
              //         decoration: BoxDecoration(
              //             border: Border.all(color: Colors.black87),
              //             color: Colors.amber,
              //             shape: BoxShape.circle),
              //         child: Text(
              //           notificationVal!,
              //           textAlign: TextAlign.center,
              //           style: const TextStyle(fontWeight: FontWeight.w500),
              //         ),
              //       )
            ],
          ),
        ),
      ),
    );
  }
}
