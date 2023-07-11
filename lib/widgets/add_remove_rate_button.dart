import 'package:flutter/material.dart';

class AddRemoveRateButtons extends StatelessWidget {
  final VoidCallback onAddButtonClick, onSubtractButtonClick;
  const AddRemoveRateButtons(
      {super.key,
      required this.onAddButtonClick,
      required this.onSubtractButtonClick});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          elevation: 5,
          color: Colors.green,
          child: InkWell(
            onTap: onAddButtonClick,
            child: Container(
              padding: const EdgeInsets.all(5),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Material(
          elevation: 5,
          color: Colors.red,
          child: InkWell(
            onTap: onSubtractButtonClick,
            child: Container(
              padding: const EdgeInsets.all(5),
              child: const Icon(Icons.remove, color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
