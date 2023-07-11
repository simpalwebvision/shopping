import 'package:flutter/material.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/utils/constant.dart';
import 'package:shopping/widgets/common_loader.dart';

import '../../../../widgets/background_decoration.dart';

class TechSpareAvailableParts extends StatefulWidget {
  const TechSpareAvailableParts({super.key});

  @override
  State<TechSpareAvailableParts> createState() =>
      _TechSpareAvailablePartsState();
}

class _TechSpareAvailablePartsState extends State<TechSpareAvailableParts> {
  final TextEditingController _searchController = TextEditingController();
  bool showSearchBar = false, isLoading = false;
  List listOfColumns = [
    {
      'index': "1",
      'partname': "Sediment",
      'partquantity': '100',
    },
    {
      'index': "2",
      'partname': "Sediment2",
      'partquantity': '200',
    },
  ];
  DateTime now = DateTime.now();
  String todate = '';
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    CommonFunctions().disableCapture();
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

  // @override
  // Widget build(BuildContext context) {
  //   var size = MediaQuery.of(context).size;
  //   return Scaffold(
  //     body: Container(
  //       decoration: BackgroundDecoration().boxD(),
  //       child: isLoading
  //           ? const CommonLoaderScreen()
  //           : Padding(
  //               padding: const EdgeInsets.only(top: 8.0),
  //               child: RefreshIndicator(
  //                 onRefresh: _refresh,
  //                 child: ListView.builder(
  //                     itemCount: 10,
  //                     itemBuilder: (context, index) {
  //                       return Card(
  //                         margin: const EdgeInsets.symmetric(
  //                             horizontal: 10, vertical: 5),
  //                         elevation: 5,
  //                         // key: PageStorageKey(index), // TODO : we will place item id here
  //                         shape: RoundedRectangleBorder(
  //                             side: const BorderSide(color: Colors.black54),
  //                             borderRadius: BorderRadius.circular(8)),
  //                         child: Padding(
  //                           padding: const EdgeInsets.all(12.0),
  //                           child: Column(
  //                             mainAxisAlignment: MainAxisAlignment.start,
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               Row(
  //                                 children: [
  //                                   const Text(
  //                                     'Date : ',
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontWeight: FontWeight.w500),
  //                                   ),
  //                                   Text(todate)
  //                                 ],
  //                               ),
  //                               const SizedBox(
  //                                 height: 10,
  //                               ),
  //                               Row(
  //                                 children: const [
  //                                   DetailWidget(
  //                                     label: 'Part Name :',
  //                                     data: '',
  //                                   ),
  //                                   Spacer(),
  //                                   DetailWidget(
  //                                     label: 'Quantity :',
  //                                     data: '',
  //                                   )
  //                                 ],
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       );
  //                     }),
  //               ),
  //             ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BackgroundDecoration().boxD(),
        child: isLoading
            ? const CommonLoaderScreen()
            : SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: DataTable(
                  headingRowColor:
                      const MaterialStatePropertyAll(Color(0xFF9ab856)),
                  // border: TableBorder.all(color: Colors.black87),
                  columns: <DataColumn>[
                    DataColumn(
                      label: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Sr.No',
                              style: TextStyle(
                                  fontSize: size.width * 0.032,
                                  color: colorText,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Part Name',
                              style: TextStyle(
                                  fontSize: size.width * 0.032,
                                  color: colorText,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Quantity',
                              style: TextStyle(
                                  fontSize: size.width * 0.032,
                                  color: colorText,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  rows:
                      listOfColumns // Loops through dataColumnText, each iteration assigning the value to element
                          .map(
                            ((element) => DataRow(
                                  color: MaterialStateProperty.all(
                                      const Color(0xFF9ab856).withOpacity(0.1)),
                                  cells: <DataCell>[
                                    DataCell(DataCellHelper(
                                      data: element['index'],
                                    )), //
                                    DataCell(DataCellHelper(
                                      data: element['partname'],
                                    )), //Extracting from Map element the value
                                    DataCell(DataCellHelper(
                                      data: element['partquantity'],
                                    )),
                                  ],
                                )),
                          )
                          .toList(),
                )),
      ),
    );
  }
}

class DataCellHelper extends StatelessWidget {
  final String data;
  const DataCellHelper({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          data,
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: size.width * 0.03),
        ),
      ],
    );
  }
}
