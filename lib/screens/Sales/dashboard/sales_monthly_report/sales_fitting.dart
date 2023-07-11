import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class SalesFittingScreen extends StatefulWidget {
  const SalesFittingScreen({super.key});

  @override
  State<SalesFittingScreen> createState() => _SalesFittingScreenState();
}

class _SalesFittingScreenState extends State<SalesFittingScreen> {
  List listOfColumns = [
    {
      'index': "1",
      'date': "02-03-2023",
      'idNo': '100',
      'name': "Siddhant",
      'amount': '100',
    },
    {
      'index': "2",
      'date': "04-03-2023",
      'idNo': '100',
      'name': "Siddhant",
      'amount': '100',
    },
    {
      'index': "3",
      'date': "02-03-2023",
      'idNo': '100100',
      'name': "Siddhant dsd jjdks",
      'amount': '1,25,000',
    },
    {
      'index': "4",
      'date': "04-03-2023",
      'idNo': '100',
      'name': "Siddhant",
      'amount': '100',
    },
    {
      'index': "5",
      'date': "02-03-2023",
      'idNo': '100',
      'name': "Siddhant",
      'amount': '100',
    },
    {
      'index': "6",
      'date': "04-03-2023",
      'idNo': '100',
      'name': "Siddhant",
      'amount': '100',
    },
    {
      'index': "7",
      'date': "02-03-2023",
      'idNo': '100',
      'name': "Siddhant",
      'amount': '100',
    },
    {
      'index': "8",
      'date': "04-03-2023",
      'idNo': '100',
      'name': "Siddhant",
      'amount': '100',
    },
    {
      'index': "1",
      'date': "02-03-2023",
      'idNo': '100',
      'name': "Siddhant",
      'amount': '100',
    },
    {
      'index': "2",
      'date': "04-03-2023",
      'idNo': '100',
      'name': "Siddhant",
      'amount': '100',
    },
    {
      'index': "1",
      'date': "02-03-2023",
      'idNo': '100',
      'name': "Siddhant",
      'amount': '100',
    },
    {
      'index': "2",
      'date': "04-03-2023",
      'idNo': '100',
      'name': "Siddhant",
      'amount': '100',
    },
    {
      'index': "1",
      'date': "02-03-2023",
      'idNo': '100',
      'name': "Siddhant",
      'amount': '100',
    },
    {
      'index': "2",
      'date': "04-03-2023",
      'idNo': '100',
      'name': "Siddhant",
      'amount': '100',
    },
    {
      'index': "1",
      'date': "02-03-2023",
      'idNo': '100',
      'name': "Siddhant",
      'amount': '100',
    },
    {
      'index': "2",
      'date': "04-03-2023",
      'idNo': '100',
      'name': "Siddhant",
      'amount': '100',
    },
    {
      'index': "1",
      'date': "02-03-2023",
      'idNo': '100',
      'name': "Siddhant",
      'amount': '100',
    },
    {
      'index': "2",
      'date': "04-03-2023",
      'idNo': '100',
      'name': "Siddhant",
      'amount': '100',
    },
    {
      'index': "1",
      'date': "02-03-2023",
      'idNo': '100',
      'name': "Siddhant",
      'amount': '100',
    },
    {
      'index': "2",
      'date': "04-03-2023",
      'idNo': '100',
      'name': "Siddhant",
      'amount': '100',
    },
    {
      'index': "1",
      'date': "02-03-2023",
      'idNo': '100',
      'name': "Siddhant",
      'amount': '100',
    },
    {
      'index': "2",
      'date': "04-03-2023",
      'idNo': '100',
      'name': "Siddhant",
      'amount': '100',
    },
    {
      'index': "1",
      'date': "02-03-2023",
      'idNo': '100',
      'name': "Siddhant",
      'amount': '100',
    },
    {
      'index': "2",
      'date': "04-03-2023",
      'idNo': '100',
      'name': "Siddhant",
      'amount': '100',
    },
    {
      'index': "1",
      'date': "02-03-2023",
      'idNo': '100',
      'name': "Siddhant",
      'amount': '100',
    },
    {
      'index': "2",
      'date': "04-03-2023",
      'idNo': '100',
      'name': "Siddhant",
      'amount': '100',
    },
  ];

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('Sr.No', 50),
      _getTitleItemWidget('Date', 100),
      _getTitleItemWidget('Id. No.', 100),
      _getTitleItemWidget('Name', 200),
      _getTitleItemWidget('Amount', 100),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      color: const Color(0xFF7e66a9),
      width: width,
      height: 50,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Text(label,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white)),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      width: 50,
      height: 50,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
      child: Text(listOfColumns[index]['index'].toString()),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          height: 50,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text(listOfColumns[index]['date'].toString()),
        ),
        Container(
          width: 100,
          height: 50,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text(listOfColumns[index]['idNo'].toString()),
        ),
        Container(
          width: 200,
          height: 50,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: const Text('siddhant sdjddoj aldlawdh aldlawdh'),
        ),
        Container(
          width: 100,
          height: 50,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: const Text('1,25,000'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: HorizontalDataTable(
        leftHandSideColumnWidth: 50,
        rightHandSideColumnWidth: 500,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        itemCount: listOfColumns.length,
        rowSeparatorWidget: const Divider(
          color: Colors.black54,
          height: 1.0,
          thickness: 0.0,
        ),
        leftHandSideColBackgroundColor: const Color(0xFFEADFFD),
        rightHandSideColBackgroundColor: const Color(0xFFEADFFD),
      ),
    ));
  }
}

class NewDataColumnHelper extends StatelessWidget {
  final String text;
  const NewDataColumnHelper({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Expanded(
      child: Text(
        text,
        textAlign: TextAlign.start,
        style:
            TextStyle(fontWeight: FontWeight.bold, fontSize: size.width * 0.03),
      ),
    );
  }
}
