import 'package:flutter/material.dart';
import 'package:shopping/widgets/background_decoration.dart';
import 'package:shopping/widgets/detail_widget.dart';

class TechTodaysWorkHistoryTab extends StatefulWidget {
  const TechTodaysWorkHistoryTab({super.key});

  @override
  State<TechTodaysWorkHistoryTab> createState() =>
      _TechTodaysWorkHistoryTabState();
}

class _TechTodaysWorkHistoryTabState extends State<TechTodaysWorkHistoryTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        decoration: BackgroundDecoration().boxD(),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        const DetailRowInfoWidget(
                          labelOne: 'Id : ',
                          dataOne: '',
                        ),
                        Expanded(child: Container()),
                        const DetailRowInfoWidget(
                          labelOne: 'Scheme : ',
                          dataOne: '',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    color: Colors.black54,
                  )
                ],
              );
            }),
      ),
    );
  }
}
