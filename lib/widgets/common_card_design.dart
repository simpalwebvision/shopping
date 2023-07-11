import 'package:flutter/material.dart';

class CommonCardDesign extends StatelessWidget {
  final List<Widget> listOfWidget;
  const CommonCardDesign({super.key, required this.listOfWidget});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.zero,
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Colors.grey)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(children: listOfWidget),
          ),
        ));
  }
}
