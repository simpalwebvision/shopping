import 'package:flutter/material.dart';
import 'package:shopping/utils/constant.dart';

class LoginButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final Color btnColor;

  const LoginButtonWidget({
    super.key,
    required this.onTap,
    required this.btnColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 14, horizontal: 16)),
          backgroundColor: MaterialStateProperty.all(btnColor)),
      onPressed: onTap,
      child: const Text(
        'Login',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class AppButtonWidget extends StatelessWidget {
  final String btnText;
  final VoidCallback? onTap;

  const AppButtonWidget({
    super.key,
    required this.onTap,
    required this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 14, horizontal: 30)),
          backgroundColor: MaterialStateProperty.all(Colors.green)),
      onPressed: onTap,
      child: Text(
        btnText,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}

class AppSquareButtonWidget extends StatelessWidget {
  final String btnText;
  final VoidCallback? onTap;

  const AppSquareButtonWidget({
    super.key,
    required this.onTap,
    required this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
          backgroundColor: MaterialStateProperty.all(Colors.black87)),
      onPressed: onTap,
      child: Text(
        btnText,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}

class AppAddPartButtonWidget extends StatelessWidget {
  final String btnText;
  final VoidCallback? onTap;

  const AppAddPartButtonWidget({
    super.key,
    required this.onTap,
    required this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 20)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
          backgroundColor: MaterialStateProperty.all(darkPrimaryColor)),
      onPressed: onTap,
      child: Text(
        btnText,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}

class AppAddIconButtonWidget extends StatelessWidget {
  final String btnText;
  final VoidCallback? onTap;

  const AppAddIconButtonWidget({
    super.key,
    required this.onTap,
    required this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 20)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
          backgroundColor: MaterialStateProperty.all(darkPrimaryColor)),
      onPressed: onTap,
      icon: const Icon(Icons.add),
      label: Text(
        btnText,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}
