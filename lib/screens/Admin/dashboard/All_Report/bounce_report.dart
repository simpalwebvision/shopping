import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/widgets/background_decoration.dart';
import 'package:shopping/widgets/common_loader.dart';
import 'package:shopping/widgets/detail_widget.dart';

class BounceReportScreen extends StatefulWidget {
  const BounceReportScreen({super.key});

  @override
  State<BounceReportScreen> createState() => _BounceReportScreenState();
}

class _BounceReportScreenState extends State<BounceReportScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool showSearchBar = false, isLoading = false;
  Future? resultLoaded;

  @override
  void initState() {
    super.initState();
    resultLoaded = _refreshComplain();
    CommonFunctions().disableCapture();
  }

  Future<void> _refreshComplain() async {
    if (!mounted) {
      return;
    }
    setState(() {
      isLoading = true;
    });
    Future.delayed(const Duration(seconds: 0), () {
      if (!mounted) {
        return;
      }
      setState(() {
        isLoading = false;
      });
    });
    // try {
    //   await Provider.of<EmployeeCreationProvider>(context, listen: false)
    //       .fetchAndSetEmployeeCreation()
    //       .then((_) {
    //     data =
    //         Provider.of<EmployeeCreationProvider>(context, listen: false).items;
    //     setState(() {
    //       _allResult = data!;
    //       isLoading = false;
    //     });
    //   });
    //   searchResulList();
    // } catch (error) {
    //   setState(() => isLoading = false);
    //   toastView(message: 'Please Check your Internet Connection...');
    // }
  }

  FutureOr onRefresh(dynamic value) {
    _refreshComplain();
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BackgroundDecoration().boxD(),
        child: isLoading
            ? const CommonLoaderScreen()
            : RefreshIndicator(
                onRefresh: _refreshComplain,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 0.0),
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.black54),
                              borderRadius: BorderRadius.circular(0)),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.all(7),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.white,
                                        ),
                                        child: Text(
                                          '${index + 1}.',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Expanded(child: Container()),
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          border: Border.all(
                                              color: Colors.black87)),
                                      child: SelectableText(
                                        'Bounce',
                                        style: TextStyle(
                                            fontSize: size.width * 0.035,
                                            color: Colors.black87,
                                            letterSpacing: 0.5,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    const DetailRowInfoWidget(
                                      labelOne: 'Query No.',
                                      dataOne: '',
                                    ),
                                    Expanded(
                                      child: Container(),
                                    ),
                                    SelectableText(
                                      "Date",
                                      style: TextStyle(
                                          fontSize: size.width * 0.03,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
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
