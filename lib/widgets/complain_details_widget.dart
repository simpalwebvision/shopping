import 'package:flutter/material.dart';

class CommplaintDetailWidget extends StatelessWidget {
  final String headText;
  final List<Widget> listWidget;
  const CommplaintDetailWidget(
      {super.key, required this.headText, required this.listWidget});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Card(
      elevation: 5,
      shape:
          const RoundedRectangleBorder(side: BorderSide(color: Colors.black87)),
      margin: EdgeInsets.zero,
      child: ListTileTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        child: ExpansionTile(
          maintainState: true,
          iconColor: Colors.black87,
          // controlAffinity:
          //     ListTileControlAffinity.leading,
          expandedCrossAxisAlignment: CrossAxisAlignment.end,
          title: Text(
            headText,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: size.width * 0.035),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Column(
                children: listWidget,
              ),
            )
          ],
        ),
      ),
    );
  }
}
