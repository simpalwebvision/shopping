import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:shopping/utils/constant.dart';

class TypeFormFieldWidget extends StatelessWidget {
  final List passList;
  final Function(dynamic) passedOnSuggestionSelected;
  final String noItemsFoundBuilderString, hintTextString;
  final String validatorString;
  final TextEditingController passedController;
  const TypeFormFieldWidget(
      {super.key,
      required this.passList,
      required this.passedOnSuggestionSelected,
      required this.noItemsFoundBuilderString,
      required this.hintTextString,
      required this.validatorString,
      required this.passedController});

  @override
  Widget build(BuildContext context) {
    return TypeAheadFormField(
      suggestionsCallback: (pattern) => passList.where(
        (item) => item.toUpperCase().contains(pattern.toUpperCase()),
      ),
      itemBuilder: (_, item) => ListTile(title: Text(item.toString())),
      onSuggestionSelected: passedOnSuggestionSelected,
      getImmediateSuggestions: true,
      hideSuggestionsOnKeyboardHide: true,
      hideOnEmpty: false,
      noItemsFoundBuilder: (context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(noItemsFoundBuilderString),
      ),
      textFieldConfiguration: TextFieldConfiguration(
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            filled: true,
            fillColor: Colors.blueGrey[50],
            // labelText: labelTextString,
            hintText: hintTextString,
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
        controller: passedController,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return validatorString;
        } else {
          return null;
        }
      },
    );
  }
}
