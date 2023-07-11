import 'package:flutter/material.dart';

class BackgroundDecoration {
  Decoration boxD() => BoxDecoration(
        image: DecorationImage(
          image: const AssetImage(
            'assets/images/choose_login_back.jpg',
          ),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.8),
            BlendMode.dstATop,
          ),
        ),
      );

  Decoration gridBoxD() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: const [
          BoxShadow(
            // color: Color(
            //   0xFFA83242,
            // ),
            color: Colors.blueAccent,
            blurRadius: 2,
            offset: Offset(1, 1),
          ),
          BoxShadow(
            // color: Color(
            //   0xFFA83242,
            // ),
            color: Colors.blueAccent,
            blurRadius: 2,
            offset: Offset(1, 1),
          ),
        ],
      );

  // Decoration gridBoxD() => BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(30.0),
  //       border: Border.all(color: Colors.blueAccent),
  //       boxShadow: const [
  //         BoxShadow(
  //           // color: Color(
  //           //   0xFFA83242,
  //           // ),
  //           color: Colors.blueAccent,
  //           blurRadius: 2,
  //           offset: Offset(1, 1),
  //         ),
  //         BoxShadow(
  //           // color: Color(
  //           //   0xFFA83242,
  //           // ),
  //           color: Colors.blueAccent,
  //           blurRadius: 2,
  //           offset: Offset(1, 1),
  //         ),
  //       ],
  //     );
}
