import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgImageButton extends StatelessWidget {
  final double imgSize;
  final String imageAsset;
  final VoidCallback onTap;
  const SvgImageButton(
      {super.key,
      required this.imgSize,
      required this.imageAsset,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SvgPicture.asset(
        imageAsset,
        height: imgSize,
      ),
    );
  }
}
