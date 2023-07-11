import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping/screens/Admin/dashboard/add_employee.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/widgets/background_decoration.dart';
import 'package:shopping/widgets/common_loader.dart';
import '../../../../utils/constant.dart';

class EmployeeAdminScreen extends StatefulWidget {
  const EmployeeAdminScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeAdminScreen> createState() => _EmployeeAdminScreenState();
}

class _EmployeeAdminScreenState extends State<EmployeeAdminScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool showSearchBar = false, isLoading = false;

  Future? resultLoaded;
  List? data;

  Future<void> _refreshEmployee() async {
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

  @override
  void initState() {
    super.initState();
    CommonFunctions().disableCapture();
    resultLoaded = _refreshEmployee();
    // _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    // _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  // _onSearchChanged() {
  //   searchResulList();
  // }

  // searchResulList() {
  //   var showResult = [];
  //   if (_searchController.text != '') {
  //     showResult = _allResult.where((prod) {
  //       var empDesignation = prod.empDesignation!.toLowerCase();
  //       var empName = prod.empName!.toLowerCase();
  //       return empDesignation.contains(_searchController.text.toLowerCase()) ||
  //           empName.contains(_searchController.text.toLowerCase());
  //     }).toList();
  //   } else {
  //     showResult = List.from(_allResult);
  //   }
  //   setState(() => _searchResultList = showResult);
  // }

  FutureOr onRefresh(dynamic value) {
    _refreshEmployee();
    setState(() {});
  }

  void navigateEditEmployeePage() async {
    Route route =
        MaterialPageRoute(builder: (context) => const AddEmployeeScreen());
    await Navigator.push(context, route).then(onRefresh);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Employee',
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
                      hintText: 'Search Employee...',
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
            // : _searchResultList.isEmpty
            //     ? Center(
            //         child: Text(
            //           'No Employee Added yet...',
            //           style: TextStyle(
            //               fontWeight: FontWeight.w500,
            //               color: primaryColor,
            //               fontSize: size.width * 0.04,
            //               letterSpacing: 1.5),
            //         ),
            //       )
            //     :
            : RefreshIndicator(
                onRefresh: _refreshEmployee,
                child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return employeeCard(index, size);
                    }),
              ),
      ),
    );
  }

  // Widget buildBoxShimmer() => ListTile(
  //       leading: ShimmerBoxWidget.circular(
  //         width: 64,
  //         height: height(context)! * 0.15,
  //         shapeBorder:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  //       ),
  //       title: ShimmerBoxWidget.rectangular(
  //         height: height(context)! * 0.15,
  //       ),
  //     );

  Widget employeeCard(int index, Size size) {
    String? empPic;
    empPic = "assets/svg_images/employee_profile.svg";

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Container(
        height: size.height * 0.15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: const Color(0xFFa3aaae)),
          boxShadow: const [
            BoxShadow(
              offset: Offset(2.0, 0),
              color: Color(0xFFa3aaae),
              blurRadius: 3.0,
            ),
          ],
        ),
        child: Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.black54),
              borderRadius: BorderRadius.circular(4)),
          child: InkWell(
            borderRadius: BorderRadius.circular(4),
            onTap: () {},
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: SvgPicture.asset(
                        empPic,
                        height: size.height * 0.10,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Stack(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Full Name",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Divider(
                            color: Colors.black,
                          ),
                          const Spacer(),
                          empInfoDt(
                            index,
                            Icons.person_pin_rounded,
                            '  Designation',
                            size,
                          ),
                          const Spacer(),
                          empInfoDt(
                            index,
                            Icons.email,
                            '  Email ID',
                            size,
                          ),
                          const Spacer(),
                          empInfoDt(
                            index,
                            Icons.call,
                            '  ContactNum',
                            size,
                          ),
                          const Spacer(),
                        ],
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget empInfoDt(int index, IconData icon, String? txt, Size? scSize) {
    return SizedBox(
      width: scSize!.width * 0.45,
      child: RichText(
        maxLines: 1,
        text: TextSpan(
          children: [
            WidgetSpan(
              child: Icon(
                icon,
                size: 14,
                color: Colors.black87,
              ),
            ),
            TextSpan(
                text: txt,
                style: const TextStyle(
                  color: Colors.black87,
                )),
          ],
        ),
      ),
    );
  }
}
