import 'package:flutter/material.dart';

const Color blackColor = Color(0xff0B2C3D);
const Color lightningYellowColor = Color(0xffFFBB38);
const Color yelloBackground = Color(0xffFFF7E7);
const Color colorWhite = Colors.white;
const Color colorText = Colors.black87;
const whiteColor = Colors.white;
// const primaryColor = Color(0xFF448AFF);
const primaryColor = Color(0xFF00beff);
const Color appBgColor = Color(0xffFFFCF7);
const appBorderColor = Colors.black54;
const darkPrimaryColor = Color.fromARGB(255, 13, 36, 170);
const secondaryColor = Color(0xFF448AFF);
final borderRadius = BorderRadius.circular(4);
const borderColor = Colors.grey;
const greenGredient = [lightningYellowColor, lightningYellowColor];
const Color buttonTextColor = Color(0xff1D1D1D);
const Color paragraphColor = Color(0xff18587A);

const enableButtonColor = Colors.green;
const disableButtonColor = Colors.grey;

const appgradientColor = LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
  stops: [0.1, 0.5, 0.7, 0.9],
  colors: [
    // Color.fromARGB(255, 138, 181, 255),
    // Color.fromARGB(255, 119, 169, 255),
    // Color.fromARGB(255, 67, 133, 248),
    // Color.fromARGB(255, 41, 118, 250)
    primaryColor, primaryColor, primaryColor, primaryColor
  ],
);

const loginAppgradientColor = LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
  stops: [0.1, 0.5, 0.7, 0.9],
  colors: [
    Color.fromARGB(255, 138, 181, 255),
    Color.fromARGB(255, 119, 169, 255),
    Color.fromARGB(255, 67, 133, 248),
    Color.fromARGB(255, 41, 118, 250)
  ],
);

class AppImageUrl {
  String appLogoImage = 'assets/app_logo/aquanerio_app_logo.png';
}
