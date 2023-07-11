import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileAppBar extends StatelessWidget {
  final double height;
  final String logo;
  const ProfileAppBar({
    super.key,
    this.height = 120,
    required this.logo,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Colors.white,
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              _buildUserInfo(context),
              Positioned(
                bottom: height - 120,
                left: 20,
                right: 20,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xff333333).withOpacity(.18),
                          blurRadius: 70),
                    ],
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _headerItem(
                          'assets/svg_images/profile_order_icon.svg',
                          'Order',
                          () {
                            // Navigator.pushNamed(
                            //     context, RouteNames.orderScreen);
                          },
                        ),
                        _headerItem(
                          'assets/svg_images/profile_cart_icon.svg',
                          'Cart',
                          () {},
                        ),
                        _headerItem(
                          'assets/svg_images/profile_offer_icon.svg',
                          'Offers',
                          () {},
                        ),
                        _headerItem(
                          'assets/svg_images/profile_wish_list_icon.svg',
                          'WishList',
                          () {},
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerItem(String icon, String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 54,
            width: 54,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: const Color(0xffE8EEF2),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(child: SvgPicture.asset(icon)),
          ),
          const SizedBox(height: 4),
          Text(
            text,
            style: const TextStyle(fontSize: 13),
          )
        ],
      ),
    );
  }

  Widget _buildUserInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: height - 100,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(0),
        ),
      ),
    );
  }
}
