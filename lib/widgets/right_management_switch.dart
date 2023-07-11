import 'package:flutter/material.dart';

class RightManagementSwitch extends StatelessWidget {
  final bool val;
  final Function(bool) onChange;
  final String rightText;
  const RightManagementSwitch(
      {super.key,
      required this.val,
      required this.onChange,
      required this.rightText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black87)),
      child: SwitchListTile(
          activeColor: Colors.green,
          value: val,
          onChanged: onChange,
          title: Text(
            rightText,
            style: const TextStyle(
                color: Colors.black87, fontWeight: FontWeight.w500),
          )),
    );
  }
}
