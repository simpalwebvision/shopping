import 'package:flutter/material.dart';
import 'package:shopping/utils/constant.dart';

class ToggleButtonComponent extends StatefulWidget {
  const ToggleButtonComponent({
    Key? key,
    required this.onChange,
    required this.textList,
    this.initialLabelIndex = 0,
  }) : super(key: key);

  final void Function(int index) onChange;
  final int initialLabelIndex;
  final List<String> textList;

  @override
  State<ToggleButtonComponent> createState() => _ToggleButtonComponentState();
}

class _ToggleButtonComponentState extends State<ToggleButtonComponent> {
  late int initialLabelIndex;
  late List<String> textList;

  @override
  void initState() {
    super.initState();
    initialLabelIndex = widget.initialLabelIndex;
    textList = widget.textList;
  }

  List<Widget> getBtns() {
    final childList = <Widget>[];

    textList.asMap().forEach(
      (key, value) {
        childList.add(_buildSingleBtn(key, value));
      },
    );
    return childList;
  }

  Widget _buildSingleBtn(int key, String value) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: InkWell(
        onTap: () => setState(() {
          initialLabelIndex = key;
          widget.onChange(initialLabelIndex);
        }),
        child: Container(
          padding: const EdgeInsets.only(bottom: 10, top: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
                color: initialLabelIndex == key ? blackColor : Colors.white),
            borderRadius: BorderRadius.circular(12),
            color:
                initialLabelIndex == key ? lightningYellowColor : Colors.white,
          ),
          child: Text(
            value,
            style: TextStyle(
                fontSize: 14,
                color: initialLabelIndex != key ? Colors.grey : Colors.black87,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: getBtns(),
        ),
      ),
    );
  }
}
