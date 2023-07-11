import 'package:flutter/material.dart';
import 'package:shopping/utils/constant.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    this.maximumSize = const Size(double.infinity, 52),
    required this.text,
    this.grediantColor = greenGredient,
    this.fontSize = 14,
    required this.onPressed,
    this.minimumSize = const Size(double.infinity, 52),
    this.borderRadiusSize = 0,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final List<Color> grediantColor;
  final String text;
  final Size maximumSize;
  final Size minimumSize;
  final double fontSize;
  final double borderRadiusSize;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(borderRadiusSize);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: grediantColor,
        ),
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(lightningYellowColor),
            minimumSize: MaterialStateProperty.all(minimumSize),
            maximumSize: MaterialStateProperty.all(maximumSize)),
        child: Text(
          text,
          style: TextStyle(
              color: buttonTextColor,
              fontSize: fontSize,
              height: 1.5,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
