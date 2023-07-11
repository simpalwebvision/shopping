import 'package:flutter/material.dart';
import 'package:shopping/screens/Technician/dashboard/complaint/tech_complain_proceed1.dart';
import 'package:shopping/screens/Technician/dashboard/order_form/order_form_cmc.dart';
import 'package:shopping/screens/Technician/dashboard/order_form/order_form_parts.dart';
import 'package:shopping/widgets/background_decoration.dart';

import 'order_form_amc.dart';

class MachineRepairTab extends StatefulWidget {
  const MachineRepairTab({super.key});

  @override
  State<MachineRepairTab> createState() => _MachineRepairTabState();
}

class _MachineRepairTabState extends State<MachineRepairTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BackgroundDecoration().boxD(),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
            child: Column(
              children: [
                SchemeListTile(
                  titleString: 'CMC',
                  onClicked: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OrderCMCScreen()));
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                SchemeListTile(
                  titleString: 'AMC',
                  onClicked: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OrderAMCScreen()));
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                SchemeListTile(
                  titleString: 'Parts',
                  onClicked: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OrderPartScreen()));
                  },
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
