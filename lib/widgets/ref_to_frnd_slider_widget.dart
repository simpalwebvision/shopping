import 'package:flutter/material.dart';
import 'package:shopping/utils/constant.dart';

class SliderHelper extends StatelessWidget {
  final String? image, slideDescription, slideHeads;
  final double? sHeight;
  final double? sWidth;
  final VoidCallback? onClick;
  final int? passIndex, sLength;
  const SliderHelper(
      {super.key,
      this.image,
      this.sHeight,
      this.slideHeads,
      this.sWidth,
      this.onClick,
      this.passIndex,
      this.sLength,
      this.slideDescription});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        SizedBox(
          width: sWidth! * 0.9,
          child: Text(
            slideHeads!,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 22, color: primaryColor, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: sWidth! * 0.9,
          child: Text(
            slideDescription!,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
              backgroundColor: MaterialStateProperty.all(primaryColor)),
          onPressed: onClick!,
          child: Text(
            passIndex == sLength! - 1 ? "Continue" : "Next",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
