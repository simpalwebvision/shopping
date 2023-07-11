import 'package:flutter/material.dart';
import 'package:shopping/utils/constant.dart';

class DropDownWidget extends StatefulWidget {
  final List? dropMenuList;
  final String? labelText;
  final Function? selectedReturnValue;
  final String? hintText;

  const DropDownWidget({
    Key? key,
    required this.dropMenuList,
    required this.labelText,
    this.hintText = "",
    required this.selectedReturnValue,
  }) : super(key: key);

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  List? notify;

  String? selectedMenuItem;

  @override
  void initState() {
    notify = widget.dropMenuList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor),
        borderRadius: BorderRadius.circular(12),
        color: Colors.blueGrey[50],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isDense: true,
          iconSize: 25,
          icon: const Icon(
            Icons.keyboard_arrow_down_outlined,
          ),
          iconEnabledColor: primaryColor,
          iconDisabledColor: primaryColor,
          isExpanded: false,
          style: const TextStyle(
            fontSize: 15.0,
            color: Colors.black87,
          ),
          hint: Text(
            widget.hintText!,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black87,
            ),
          ),
          items: notify!.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() => selectedMenuItem = newValue.toString());
            widget.selectedReturnValue!(selectedMenuItem);
          },
          value: selectedMenuItem,
        ),
      ),
    );
  }
}

class ExpandedDropDownWidget extends StatefulWidget {
  final List? dropMenuList;
  final String? labelText;
  final Function? selectedReturnValue;
  final String? hintText;

  const ExpandedDropDownWidget({
    Key? key,
    required this.dropMenuList,
    required this.labelText,
    this.hintText = "",
    required this.selectedReturnValue,
  }) : super(key: key);

  @override
  State<ExpandedDropDownWidget> createState() => _ExpandedDropDownWidgetState();
}

class _ExpandedDropDownWidgetState extends State<ExpandedDropDownWidget> {
  List? notify;

  String? selectedMenuItem;

  @override
  void initState() {
    notify = widget.dropMenuList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor),
        borderRadius: BorderRadius.circular(12),
        color: Colors.blueGrey[50],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isDense: true,
          iconSize: 25,
          icon: const Icon(
            Icons.keyboard_arrow_down_outlined,
          ),
          iconEnabledColor: primaryColor,
          iconDisabledColor: primaryColor,
          isExpanded: true,
          style: const TextStyle(
            fontSize: 15.0,
            color: Colors.black87,
          ),
          hint: Text(
            widget.hintText!,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black87,
            ),
          ),
          items: notify!.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() => selectedMenuItem = newValue.toString());
            widget.selectedReturnValue!(selectedMenuItem);
          },
          value: selectedMenuItem,
        ),
      ),
    );
  }
}
