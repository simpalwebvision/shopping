import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginWidgetHelper extends StatelessWidget {
  final String assetImage, passText;
  final VoidCallback onTap;
  const LoginWidgetHelper(
      {super.key,
      required this.assetImage,
      required this.passText,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      overlayColor: MaterialStateProperty.all(Colors.blue[900]),
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        shadowColor: Colors.blue[900],
        elevation: 5,
        child: Container(
          width: size.width * 0.40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 255, 255, 255),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  assetImage,
                  height: size.height * 0.07,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  passText,
                  style: TextStyle(
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.03,
                      color: Colors.black87),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginWidgetHelper2 extends StatelessWidget {
  final String assetImage, passText;
  final VoidCallback? onTap;
  const LoginWidgetHelper2(
      {super.key,
      required this.assetImage,
      required this.passText,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.grey, width: 1),
      ),
      shadowColor: Colors.grey.withOpacity(0.3),
      elevation: 5.0,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        overlayColor: MaterialStateProperty.all(Colors.green[100]),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          width: size.width * 0.33,
          // decoration: BoxDecoration(
          //   border: Border.all(color: Colors.black),
          //   shape: BoxShape.circle,
          //   color: Colors.white,
          // ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  assetImage,
                  height: size.height * 0.07,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  passText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
