import 'package:flutter/material.dart';

class LoginTextFormField extends StatelessWidget {
  final String textFieldLabel;
  final TextEditingController fieldController;
  final String? validateValue;
  final Function(String)? onchange;

  const LoginTextFormField(
      {super.key,
      required this.textFieldLabel,
      required this.fieldController,
      this.validateValue,
      this.onchange});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textFieldLabel,
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: size.width * 0.032),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: fieldController,
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.done,
          maxLength: 10,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
          onChanged: onchange,
          // validator: (value) {
          //   if (value!.isEmpty) {
          //     return 'Enter Mobile Number.';
          //   } else if (value.length < 10) {
          //     return 'Mobile number size atleast be 10 digits.';
          //   } else {
          //     return null;
          //   }
          // },
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.phone),
              hintText: 'Mobile Number',
              border: OutlineInputBorder(),
              counterText: ''),
        ),
      ],
    );
  }
}
