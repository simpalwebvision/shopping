import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping/screens/Super%20Admin/dashboard/Right_Management/right_manage_tech.dart';
import 'package:shopping/screens/Super%20Admin/dashboard/Right_Management/right_management_admin.dart';
import 'package:shopping/screens/Super%20Admin/dashboard/Right_Management/right_management_sales.dart';
import 'package:shopping/utils/common_function.dart';

class RightManagementScreen extends StatefulWidget {
  const RightManagementScreen({super.key});

  @override
  State<RightManagementScreen> createState() => _RightManagementScreenState();
}

class _RightManagementScreenState extends State<RightManagementScreen> {
  @override
  void initState() {
    super.initState();
    CommonFunctions().disableCapture();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rights Management'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          children: [
            RightManagementWidget(
              widgetText: 'Admin',
              imageAssets: 'assets/svg_images/subadmin.svg',
              onClicked: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RightManagementAdmin()));
              },
            ),
            RightManagementWidget(
              widgetText: 'Technician',
              imageAssets: 'assets/svg_images/technician.svg',
              onClicked: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const RightManagementTechnician()));
              },
            ),
            RightManagementWidget(
              widgetText: 'Sales',
              imageAssets: 'assets/svg_images/sales.svg',
              onClicked: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RightManagementSales()));
              },
            )
          ],
        ),
      ),
    );
  }
}

class RightManagementWidget extends StatelessWidget {
  final String widgetText, imageAssets;
  final VoidCallback onClicked;

  const RightManagementWidget({
    super.key,
    required this.widgetText,
    required this.imageAssets,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.grey, width: 1),
        ),
        shadowColor: Colors.grey.withOpacity(0.3),
        child: InkWell(
          onTap: onClicked,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                imageAssets,
                height: size.height * 0.13,
                width: size.width * 0.05,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widgetText,
                textAlign: TextAlign.center,
                style: TextStyle(
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.036),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
