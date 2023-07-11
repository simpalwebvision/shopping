import 'package:flutter/material.dart';

class SubscriptionTile extends StatelessWidget {
  final VoidCallback ontap;
  final Color? passColor;
  final String head, subtitle;
  const SubscriptionTile({
    Key? key,
    this.passColor,
    required this.ontap,
    required this.head,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: ontap,
      child: Card(
        elevation: 10,
        color: passColor,
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(15)),
        child: Container(
          height: size.height * 0.2,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(head,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontSize: size.width * 0.045,
                  )),
              const SizedBox(
                height: 20,
              ),
              Text(subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                    fontSize: size.width * 0.03,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
