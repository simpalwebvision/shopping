import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    Key? key,
    this.color,
    this.onTap,
    required this.headerText,
    this.isSeeAllShow = true,
  }) : super(key: key);
  final Color? color;
  final String headerText;
  final VoidCallback? onTap;
  final bool isSeeAllShow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            headerText,
            style: const TextStyle(
                fontSize: 18, height: 1.5, fontWeight: FontWeight.w600),
          ),
          isSeeAllShow
              ? InkWell(
                  onTap: onTap,
                  child: Container(
                    // color: iconGreyColor,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: const Text(
                      'See All',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff797979),
                          height: 1.625),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
