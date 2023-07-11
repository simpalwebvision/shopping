import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopping/screens/Admin/dashboard/Spare_Parts/admin_add_spare.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/utils/constant.dart';
import 'package:shopping/widgets/background_decoration.dart';
import 'package:shopping/widgets/common_loader.dart';

class AdminSparePartScreen extends StatefulWidget {
  const AdminSparePartScreen({super.key});

  @override
  State<AdminSparePartScreen> createState() => _AdminSparePartScreenState();
}

class _AdminSparePartScreenState extends State<AdminSparePartScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool showSearchBar = false, isLoading = false;
  DateTime now = DateTime.now();
  String todate = '';
  Future? resultLoaded;
  @override
  void initState() {
    CommonFunctions().disableCapture();
    todate = DateFormat('dd/MM/yyyy').format(now);
    resultLoaded = _refresh();
    super.initState();
  }

  void navigateEditEmployeePage() async {
    Route route =
        MaterialPageRoute(builder: (context) => const AddSparePartScreen());
    await Navigator.push(context, route).then(onRefresh);
  }

  Future<void> _refresh() async {
    setState(() {
      isLoading = true;
    });
    Future.delayed(const Duration(seconds: 0), () {
      setState(() {
        isLoading = false;
      });
    });
    // try {
    //   await Provider.of<EmployeeCreationProvider>(context, listen: false)
    //       .fetchAndSetEmployeeCreation()
    //       .then((_) {
    //     data =
    //         Prov0ider.of<EmployeeCreationProvider>(context, listen: false).items;
    //     setState(() {
    //       _allResult = data!;
    //       isLoading = false;
    //     });
    //   });
    //   searchResulList();
    // }
    //catch (error) {
    //   setState(() => isLoading = false);
    //   toastView(message: 'Please Check your Internet Connection...');
    // }
  }

  FutureOr onRefresh(dynamic value) {
    _refresh();

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
      appBar: AppBar(
        title: const Text(
          'Spare Parts',
        ),
        actions: [
          IconButton(
            onPressed: () => setState(() => showSearchBar = !showSearchBar),
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () => navigateEditEmployeePage(),
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
        bottom: showSearchBar
            ? PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10, left: 15, right: 15),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search ...',
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
        child: isLoading
            ? const CommonLoaderScreen()
            : RefreshIndicator(
                onRefresh: _refresh,
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        // key: PageStorageKey(index), // TODO : we will place item id here
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.black54),
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Technician Name',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Date : ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(todate)
                                ],
                              ),
                              ListTileTheme(
                                contentPadding: const EdgeInsets.all(0),
                                child: ExpansionTile(
                                  // controlAffinity:
                                  //     ListTileControlAffinity.leading,
                                  expandedCrossAxisAlignment:
                                      CrossAxisAlignment.end,

                                  title: Text(
                                    'Parts Recieved',
                                    style: TextStyle(
                                        fontSize: size.width * 0.035,
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  children: [
                                    ListView.builder(
                                        controller: _scrollController,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: 4,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: Row(
                                              children: [
                                                Text('Part $index'),
                                                Expanded(child: Container()),
                                                const Text('15'),
                                              ],
                                            ),
                                          );
                                        }),
                                  ],
                                ),
                              ),
                              ListTileTheme(
                                contentPadding: const EdgeInsets.all(0),
                                child: ExpansionTile(
                                  // controlAffinity:
                                  //     ListTileControlAffinity.leading,
                                  expandedCrossAxisAlignment:
                                      CrossAxisAlignment.end,

                                  title: Text(
                                    'Parts Returned',
                                    style: TextStyle(
                                        fontSize: size.width * 0.035,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  children: [
                                    ListView.builder(
                                        controller: _scrollController,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: 4,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: Row(
                                              children: [
                                                Text('Part $index'),
                                                Expanded(child: Container()),
                                                const Text('15'),
                                              ],
                                            ),
                                          );
                                        }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
      ),
    );
  }
}
