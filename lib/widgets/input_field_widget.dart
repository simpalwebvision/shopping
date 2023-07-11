import 'package:flutter/material.dart';
import 'package:shopping/utils/constant.dart';

class StepperTextField extends StatelessWidget {
  final TextEditingController? controllerValue;
  final VoidCallback? onTap;
  final String? validateValue;
  final bool? rOnly;
  final TextInputType? inputType;
  final TextInputAction? actionNext;
  final String? labelValue;
  final int? maxLine, mLength;
  const StepperTextField(
      {Key? key,
      this.controllerValue,
      this.validateValue,
      this.labelValue,
      this.onTap,
      this.rOnly,
      this.inputType,
      this.actionNext,
      this.mLength,
      this.maxLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return TextFormField(
      style: TextStyle(fontSize: size.width * 0.03, letterSpacing: 1),
      cursorColor: Colors.black87,
      readOnly: rOnly!,
      textInputAction: actionNext,
      maxLines: maxLine,
      onTap: onTap,
      keyboardType: inputType,
      validator: (value) {
        if (value!.isEmpty) {
          return validateValue;
        } else {
          return null;
        }
      },
      controller: controllerValue!,
      maxLength: mLength,
      decoration: InputDecoration(
          counterText: '',
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          filled: true,
          fillColor: Colors.blueGrey[50],
          // label: Text(labelValue!),
          hintText: labelValue!,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: primaryColor)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: primaryColor)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red)),
          labelStyle: const TextStyle(color: Colors.black87)),
    );
  }
}

class ModelTextField extends StatelessWidget {
  final TextEditingController? controllerValue;
  final VoidCallback? onTap;
  final String? validateValue;
  final TextInputType? inputType;
  final TextInputAction? actionNext;
  final String? hintValue;
  final int? maxLine, mLength;
  const ModelTextField(
      {Key? key,
      this.controllerValue,
      this.validateValue,
      this.hintValue,
      this.onTap,
      this.inputType,
      this.actionNext,
      this.mLength,
      this.maxLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(fontSize: 15, letterSpacing: 2),
      cursorColor: Colors.black87,
      textInputAction: actionNext,
      maxLines: maxLine,
      onTap: onTap,
      keyboardType: inputType,
      validator: (value) {
        if (value!.isEmpty) {
          return validateValue;
        } else {
          return null;
        }
      },
      controller: controllerValue!,
      maxLength: mLength,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          filled: true,
          fillColor: Colors.white,
          counterText: '',
          hintText: hintValue,
          hintStyle: const TextStyle(fontSize: 13),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: borderColor),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: borderColor)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: borderColor)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red)),
          labelStyle: const TextStyle(color: Colors.black87)),
    );
  }
}

class CheckModelTextField extends StatelessWidget {
  final TextEditingController? controllerValue;
  final VoidCallback? onTap;
  final String? validateValue;
  final TextInputType? inputType;
  final TextInputAction? actionNext;
  final String? hintValue;
  final int? maxLine, mLength;
  final bool? rOnly;
  const CheckModelTextField(
      {Key? key,
      this.controllerValue,
      this.validateValue,
      this.hintValue,
      this.onTap,
      this.inputType,
      this.actionNext,
      this.mLength,
      this.maxLine,
      this.rOnly})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return TextFormField(
      style: TextStyle(fontSize: size.width * 0.03, letterSpacing: 2),
      cursorColor: Colors.black87,
      textInputAction: actionNext,
      maxLines: maxLine,
      onTap: onTap,
      readOnly: rOnly!,
      keyboardType: inputType,
      validator: (value) {
        if (value!.isEmpty) {
          return validateValue;
        } else {
          return null;
        }
      },
      controller: controllerValue!,
      maxLength: mLength,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          filled: true,
          fillColor: Colors.white,
          counterText: '',
          hintText: hintValue,
          hintStyle: const TextStyle(fontSize: 13),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: borderColor),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: borderColor)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: borderColor)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red)),
          labelStyle: const TextStyle(color: Colors.black87)),
    );
  }
}
