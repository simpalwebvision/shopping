import 'package:flutter/material.dart';
import 'package:shopping/utils/constant.dart';
import 'package:shopping/widgets/background_decoration.dart';
import 'package:shopping/widgets/subscription_tile.dart';

class DashboardPlansScreen extends StatefulWidget {
  const DashboardPlansScreen({super.key});

  @override
  State<DashboardPlansScreen> createState() => _DashboardPlansScreenState();
}

class _DashboardPlansScreenState extends State<DashboardPlansScreen> {
  int selectedPlanVal = 1;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            decoration: BackgroundDecoration().boxD(),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Scheme',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: size.width * 0.045),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: SubscriptionTile(
                          head: 'CMC',
                          subtitle: 'Compressive Maintenance\nContract',
                          passColor: selectedPlanVal == 1
                              ? Colors.amber[200]
                              : Colors.white,
                          ontap: () {
                            setState(() {
                              selectedPlanVal = 1;
                            });
                          },
                        )),
                        Expanded(
                            child: SubscriptionTile(
                          head: 'AMC',
                          subtitle: 'Annual Maintenance\nContract',
                          passColor: selectedPlanVal == 2
                              ? Colors.pink[100]
                              : Colors.white,
                          ontap: () {
                            setState(() {
                              selectedPlanVal = 2;
                            });
                          },
                        )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  selectedPlanVal == 1
                      ? Card(
                          elevation: 10,
                          color: Colors.amber[200],
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(4)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8.0),
                            child: Column(
                              children: [
                                Table(
                                  border: TableBorder.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 1),
                                  children: const [
                                    TableRow(children: [
                                      TableHeaderWidget(
                                        header: 'Rate',
                                      ),
                                      TableHeaderWidget(
                                        header: 'Renewal Year',
                                      ),
                                      TableHeaderWidget(
                                        header: 'Total Amt',
                                      ),
                                    ]),
                                    TableRow(children: [
                                      TableDetailWidget(value: '4500'),
                                      TableDetailWidget(value: '1'),
                                      TableTotalAmountWidget(
                                        value: '4500',
                                      ),
                                    ]),
                                    TableRow(children: [
                                      TableDetailWidget(value: '4400'),
                                      TableDetailWidget(value: '2'),
                                      TableTotalAmountWidget(
                                        value: '8800',
                                      ),
                                    ]),
                                    TableRow(children: [
                                      TableDetailWidget(value: '4300'),
                                      TableDetailWidget(value: '3'),
                                      TableTotalAmountWidget(
                                        value: '12900',
                                      ),
                                    ]),
                                    TableRow(children: [
                                      TableDetailWidget(value: '4200'),
                                      TableDetailWidget(value: '4'),
                                      TableTotalAmountWidget(
                                        value: '16800',
                                      ),
                                    ]),
                                    TableRow(children: [
                                      TableDetailWidget(value: '4100'),
                                      TableDetailWidget(value: '5'),
                                      TableTotalAmountWidget(
                                        value: '20500',
                                      ),
                                    ]),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const SubscriptionBenefits(
                                    iconColor: Colors.black,
                                    text:
                                        'Filtration parts will be replace once in a year-PP, Carbon, Sediment, Membrane.'),
                                const SubscriptionBenefits(
                                    iconColor: Colors.black,
                                    text:
                                        'Filtration electronic parts will be repair if not then replace. Motor, Adaptor, SV, UV Lamp, FR.'),
                                const SubscriptionBenefits(
                                    iconColor: Colors.black,
                                    text:
                                        'Three Service in a year-PP Candle (350x3), the company will resolve all the issue during warranty period cabinet body is not included in any in CMC contract.')
                              ],
                            ),
                          ),
                        )
                      : Container(),
                  selectedPlanVal == 2
                      ? Card(
                          elevation: 10,
                          color: Colors.pink[100],
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(4)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8.0),
                            child: Column(
                              children: [
                                Table(
                                  border: TableBorder.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 1),
                                  children: const [
                                    TableRow(children: [
                                      TableHeaderWidget(
                                        header: 'Rate',
                                      ),
                                      TableHeaderWidget(
                                        header: 'Renewal Year',
                                      ),
                                      TableHeaderWidget(
                                        header: 'Total Amt',
                                      ),
                                    ]),
                                    TableRow(children: [
                                      TableDetailWidget(value: '3500'),
                                      TableDetailWidget(value: '1'),
                                      TableTotalAmountWidget(
                                        value: '3500',
                                      ),
                                    ]),
                                    TableRow(children: [
                                      TableDetailWidget(value: '3400'),
                                      TableDetailWidget(value: '2'),
                                      TableTotalAmountWidget(
                                        value: '6800',
                                      ),
                                    ]),
                                    TableRow(children: [
                                      TableDetailWidget(value: '3300'),
                                      TableDetailWidget(value: '3'),
                                      TableTotalAmountWidget(
                                        value: '9900',
                                      ),
                                    ]),
                                    TableRow(children: [
                                      TableDetailWidget(value: '3200'),
                                      TableDetailWidget(value: '4'),
                                      TableTotalAmountWidget(
                                        value: '9900',
                                      ),
                                    ]),
                                    TableRow(children: [
                                      TableDetailWidget(value: '3100'),
                                      TableDetailWidget(value: '5'),
                                      TableTotalAmountWidget(
                                        value: '15500',
                                      ),
                                    ]),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const SubscriptionBenefits(
                                    iconColor: Colors.black,
                                    text:
                                        'Filtration parts will be replace once in a year-PP, Carbon, Sediment, Membrane.'),
                                const SubscriptionBenefits(
                                    iconColor: Colors.black,
                                    text:
                                        'Three Service in a year-PP Candle change (350x3)'),
                                const SubscriptionBenefits(
                                    iconColor: Colors.black,
                                    text:
                                        'Only one year warranty in new spare parts.')
                              ],
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class TableHeaderWidget extends StatelessWidget {
  final String header;
  const TableHeaderWidget({super.key, required this.header});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            header,
            style: const TextStyle(
                color: primaryColor, fontWeight: FontWeight.bold),
          )
        ]),
      ),
    );
  }
}

class TableDetailWidget extends StatelessWidget {
  final String value;
  const TableDetailWidget({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            value,
            style: const TextStyle(
                color: Colors.black87, fontWeight: FontWeight.w500),
          )
        ]),
      ),
    );
  }
}

class TableTotalAmountWidget extends StatelessWidget {
  final String value;
  final Color? colors;
  const TableTotalAmountWidget({super.key, required this.value, this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            value,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          )
        ]),
      ),
    );
  }
}

class SubscriptionBenefits extends StatelessWidget {
  final String text;
  final Color? iconColor;
  const SubscriptionBenefits(
      {Key? key, required this.text, required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.circle,
            color: iconColor,
            size: 12,
          ),
          const SizedBox(
            width: 15,
          ),
          Flexible(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              maxLines: 10,
            ),
          ),
        ],
      ),
    );
  }
}
