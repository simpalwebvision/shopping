import 'package:flutter/material.dart';

class DescriptionComponent extends StatelessWidget {
  const DescriptionComponent(this.description, {Key? key}) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          // Html(data: description),
          const SizedBox(height: 14),
        ],
      ),
    );
  }
}
