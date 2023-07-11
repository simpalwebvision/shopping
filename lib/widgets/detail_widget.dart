import 'package:flutter/material.dart';
import 'package:shopping/utils/constant.dart';

class DetailInfoWidget extends StatelessWidget {
  final String? label;
  final String? data;
  const DetailInfoWidget({
    Key? key,
    this.label,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: SelectableText(
            label!,
            style: TextStyle(
                fontSize: size.width * 0.032,
                color: colorText,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          flex: 4,
          child: SelectableText(
            data ?? "",
            style: TextStyle(
              fontSize: size.width * 0.03,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

class BoldHedDetailInfoWidget extends StatelessWidget {
  final String? label;
  final String? data;
  const BoldHedDetailInfoWidget({
    Key? key,
    this.label,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        SelectableText(
          label!,
          style: TextStyle(
              fontSize: size.width * 0.032,
              color: colorText,
              letterSpacing: 0.5,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 5),
        SelectableText(
          '$data',
          style: TextStyle(
              fontSize: size.width * 0.03,
              color: Colors.red,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class DetailRowInfoWidget extends StatelessWidget {
  final String? labelOne;
  final String? dataOne;
  const DetailRowInfoWidget({
    Key? key,
    this.labelOne,
    this.dataOne,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        SelectableText(
          labelOne!,
          style: TextStyle(
              fontSize: size.width * 0.032,
              color: colorText,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w500),
        ),
        SelectableText(
          dataOne ?? "",
          style: TextStyle(
            fontSize: size.width * 0.03,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class DetailWidget extends StatelessWidget {
  final String? label;
  final String? data;
  const DetailWidget({
    Key? key,
    this.label,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        SelectableText(
          label!,
          style: TextStyle(
              fontSize: size.width * 0.032,
              color: colorText,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(width: 5),
        SelectableText(
          data ?? "",
          style: TextStyle(
            fontSize: size.width * 0.03,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
