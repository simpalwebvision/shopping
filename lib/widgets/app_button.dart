import 'package:flutter/material.dart';

class AppButtonWidgetLogin extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;
  const AppButtonWidgetLogin(
      {super.key, required this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
        width: size.width,
        child: ElevatedButton(onPressed: onTap, child: Text(buttonText)));
  }
}

class BlackAppButtonWidgetLogin extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;
  const BlackAppButtonWidgetLogin(
      {super.key, required this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 14, horizontal: 30)),
          backgroundColor: MaterialStateProperty.all(Colors.black87)),
      child: Text(buttonText),
    );
  }
}
