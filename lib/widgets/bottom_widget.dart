import 'package:flutter/material.dart';

import 'package:shopping/utils/constant.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[50],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/gif/phone_call.gif',
              height: size.height * 0.06,
            ),
            SizedBox(
              height: size.height * 0.08,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Aqua Nerio',
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Contact Us',
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: size.width * 0.03,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Image.asset(
              'assets/gif/whatsapp.gif',
              height: size.height * 0.06,
            ),
          ],
        ),
      ),
    );
  }
}
