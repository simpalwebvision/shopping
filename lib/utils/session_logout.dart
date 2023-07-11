import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/utils/constant.dart';
import 'package:shopping/utils/local_shared_preferences.dart';
import 'package:shopping/widgets/login_button.dart';

class SessionLogoutScreen extends StatefulWidget {
  const SessionLogoutScreen({super.key});

  @override
  State<SessionLogoutScreen> createState() => _SessionLogoutScreenState();
}

class _SessionLogoutScreenState extends State<SessionLogoutScreen> {
  bool isLoading = false;
  logout() async {
    setState(() {
      isLoading = true;
    });
    LocalPreferences().setTechnicianLoginBool(false);
    final preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    changeRoute();
  }

  changeRoute() {
    Navigator.pop(context);
    // Navigator.pushAndRemoveUntil(
    //   context,
    //   MaterialPageRoute(builder: (context) => const SplashScreen()),
    //  (route) => false);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SizedBox(
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg_images/caution_image.svg',
            height: size.height * 0.17,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Something Went Wrong.',
          ),
          const SizedBox(
            height: 20,
          ),
          isLoading
              ? const CircularProgressIndicator()
              : LoginButtonWidget(onTap: () => logout(), btnColor: primaryColor)
        ],
      ),
    ));
  }
}
