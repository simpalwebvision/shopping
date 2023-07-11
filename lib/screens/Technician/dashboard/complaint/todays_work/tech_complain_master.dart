import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:shopping/screens/Customer/dashboard/cust_complain_master.dart';
import 'package:shopping/screens/Technician/dashboard/complaint/tech_complain_proceed1.dart';
import 'package:shopping/screens/Technician/dashboard/complaint/todays_work/tech_today_work_provider.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/utils/constant.dart';
import 'package:shopping/widgets/background_decoration.dart';
import 'package:shopping/widgets/common_loader.dart';
import 'package:shopping/widgets/detail_widget.dart';

class TechComplainMaster extends StatefulWidget {
  final String isLogin;
  const TechComplainMaster({super.key, required this.isLogin});

  @override
  State<TechComplainMaster> createState() => _TechComplainMasterState();
}

class _TechComplainMasterState extends State<TechComplainMaster> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    CommonFunctions().disableCapture();
    final todayWorkProvider =
        Provider.of<TechTodayWorkProvider>(context, listen: false);
    todayWorkProvider.resetValue();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchData();
    });
  }

  _fetchData() async {
    try {
      await Provider.of<TechTodayWorkProvider>(context).refreshComplain();
    } catch (err) {
      // Show dialog
    }
  }

  FutureOr onRefresh(dynamic value) {
    _fetchData();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todayWorkProvider = Provider.of<TechTodayWorkProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Today's Work"),
        actions: [
          IconButton(
            onPressed: () {
              todayWorkProvider
                  .searchBarOnClick(todayWorkProvider.showSearchBar);
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
          widget.isLogin == "Customer"
              ? IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CustComplainMaster()));
                  },
                  icon: const Icon(
                    Icons.add,
                  ),
                )
              : Container(),
        ],
        bottom: todayWorkProvider.showSearchBar
            ? PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10, left: 15, right: 15),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search Complain...',
                      prefixIcon: const Icon(
                        Icons.search,
                        color: primaryColor,
                      ),
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ))
            : null,
      ),
      body: Container(
        decoration: BackgroundDecoration().boxD(),
        child: todayWorkProvider.isLoading
            ? const CommonLoaderScreen()
            : RefreshIndicator(
                onRefresh: todayWorkProvider.refreshComplain,
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 8.0),
                        child: Card(
                          margin: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(
                                color: appBorderColor, width: 1),
                          ),
                          shadowColor: Colors.grey.withOpacity(0.3),
                          elevation: 5.0,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: const [
                                    DetailWidget(
                                      label: 'Bill No.',
                                      data: '123456',
                                    ),
                                    Spacer(),
                                    DetailWidget(
                                      label: 'Query No.',
                                      data: '123456',
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const DetailInfoWidget(
                                  label: 'Customer Name',
                                  data: '',
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const DetailInfoWidget(
                                  label: 'Address :',
                                  data: '',
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const DetailInfoWidget(
                                  label: 'Station :',
                                  data: '',
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: const [
                                    DetailWidget(
                                      label: 'Contact No. :',
                                      data: '',
                                    ),
                                    Spacer(),
                                    DetailWidget(
                                      label: 'Alternate No. :',
                                      data: '',
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const DetailInfoWidget(
                                  label: 'Purchase Date :',
                                  data: '',
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: const [
                                    DetailWidget(
                                      label: 'Product :',
                                      data: '',
                                    ),
                                    Spacer(),
                                    DetailWidget(
                                      label: 'Price :',
                                      data: '',
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const DetailInfoWidget(
                                  label: 'Remark :',
                                  data: '',
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const DetailInfoWidget(
                                  label: 'Reason :',
                                  data: '',
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const DetailInfoWidget(
                                  label: 'Last Visit Tech :',
                                  data: '',
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Divider(
                                  color: borderColor,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const DetailInfoWidget(
                                  label: 'Scheme :',
                                  data: '',
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: const [
                                    DetailWidget(
                                      label: 'Start Date :',
                                      data: '',
                                    ),
                                    Spacer(),
                                    DetailWidget(
                                      label: 'End Date :',
                                      data: '',
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const DetailInfoWidget(
                                  label: 'Ex Name :',
                                  data: '',
                                ),
                                widget.isLogin == "Technician"
                                    ? ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const TechComplaintProceed1()));
                                        },
                                        child: const Text('Proceed'))
                                    : Container()
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
      ),
    );
  }
}
