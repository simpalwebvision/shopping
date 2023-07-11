import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping/utils/constant.dart';

class ExpandedCommonLoaderScreen extends StatelessWidget {
  const ExpandedCommonLoaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('assets/json_files/aquanerio_loading.json', height: 100),
          const Text(
            'Please wait ...',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: darkPrimaryColor,
                letterSpacing: 1.5),
          )
        ],
      ),
    );
  }
}

class CommonLoaderScreen extends StatelessWidget {
  const CommonLoaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('assets/json_files/aquanerio_loading.json', height: 100),
          const Text(
            'Please wait ...',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: darkPrimaryColor,
                letterSpacing: 1.5),
          )
        ],
      ),
    );
  }
}
