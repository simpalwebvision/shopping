import 'package:flutter/material.dart';
import 'package:shopping/screens/Technician/dashboard/complaint/proceed1_parts/amc_scheme/scheme_amc.dart';
import 'package:shopping/screens/Technician/dashboard/complaint/proceed1_parts/bounce_scheme/scheme_bounce_charge.dart';
import 'package:shopping/screens/Technician/dashboard/complaint/proceed1_parts/cmc_scheme/scheme_cmc.dart';
import 'package:shopping/screens/Technician/dashboard/complaint/proceed1_parts/parts_scheme/scheme_parta.dart';
import 'package:shopping/screens/Technician/dashboard/complaint/proceed1_parts/scheme_visit_description.dart';
import 'package:shopping/screens/Technician/dashboard/complaint/proceed1_parts/warrenty_scheme/scheme_in_warranty.dart';
import 'package:shopping/utils/constant.dart';
import 'package:shopping/widgets/background_decoration.dart';

import 'proceed1_parts/machine_scheme/scheme_machine_exchange.dart';
import 'proceed1_parts/pending_scheme/scheme_pending.dart';

class TechComplaintProceed1 extends StatelessWidget {
  const TechComplaintProceed1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Select Schemes'),
        ),
        body: Stack(
          children: [
            Container(
              decoration: BackgroundDecoration().boxD(),
            ),
            _buildInitialWidget(context)
          ],
        ));
  }

  Widget _buildInitialWidget(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
      child: Column(
        children: [
          SchemeListTile(
            titleString: 'Machine Exchange',
            onClicked: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SchemeMachineExchange()));
            },
          ),
          const SizedBox(
            height: 12,
          ),
          SchemeListTile(
            titleString: 'CMC',
            onClicked: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SchemeCMCScreen()));
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
                      builder: (context) => const SchemeAMCScreen()));
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
                      builder: (context) => const SchemePartScreen()));
            },
          ),
          const SizedBox(
            height: 12,
          ),
          SchemeListTile(
            titleString: 'Bounce Charge',
            onClicked: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SchemeBounceChargeScreen()));
            },
          ),
          const SizedBox(
            height: 12,
          ),
          SchemeListTile(
            titleString: 'Pending',
            onClicked: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SchemePendingScreen()));
            },
          ),
          const SizedBox(
            height: 12,
          ),
          SchemeListTile(
            titleString: 'In Warranty',
            onClicked: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SchemeInWarrantyScreen()));
            },
          ),
          const SizedBox(
            height: 12,
          ),
          SchemeListTile(
            titleString: 'Visit Description',
            onClicked: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const SchemeVisitDescrptionScreen()));
            },
          ),
        ],
      ),
    ));
  }
}

class SchemeListTile extends StatelessWidget {
  final String titleString;
  final VoidCallback onClicked;
  const SchemeListTile(
      {super.key, required this.titleString, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: primaryColor.withOpacity(0.2),
      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: primaryColor, width: 2)),
      onTap: onClicked,
      title: Text(
        titleString,
        style: const TextStyle(letterSpacing: 1),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        color: Colors.black,
        size: 12,
      ),
    );
  }
}
