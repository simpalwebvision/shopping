import 'package:flutter/material.dart';
import 'package:shopping/screens/Technician/dashboard/complaint/proceed1_parts/pending_scheme/scheme_pending.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/utils/constant.dart';
import 'package:shopping/widgets/background_decoration.dart';
import 'package:shopping/widgets/detail_widget.dart';

class TechHistoryPendingTab extends StatefulWidget {
  const TechHistoryPendingTab({
    super.key,
  });

  @override
  State<TechHistoryPendingTab> createState() => _TechHistoryPendingTabState();
}

class _TechHistoryPendingTabState extends State<TechHistoryPendingTab> {
  final TextEditingController _searchController = TextEditingController();
  bool showSearchBar = false, isLoading = false;

  @override
  void initState() {
    super.initState();
    CommonFunctions().disableCapture();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BackgroundDecoration().boxD(),
        child: isLoading
            ? const CircularProgressIndicator()
            : ListView.builder(
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 8.0),
                    child: Card(
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(color: appBorderColor, width: 1),
                      ),
                      shadowColor: Colors.grey.withOpacity(0.3),
                      elevation: 5.0,
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
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                    ),
                                    child: Text(
                                      '${index + 1}.',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const DetailRowInfoWidget(
                              labelOne: 'Bill No.',
                              dataOne: '',
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const DetailRowInfoWidget(
                              labelOne: 'Customer Name :',
                              dataOne: '',
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const DetailRowInfoWidget(
                              labelOne: 'Address :',
                              dataOne: '',
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const DetailRowInfoWidget(
                              labelOne: 'Contact No. :',
                              dataOne: '',
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const DetailRowInfoWidget(
                              labelOne: 'Scheme :',
                              dataOne: '',
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const DetailRowInfoWidget(
                              labelOne: 'Amount :',
                              dataOne: '',
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            // const DetailRowInfoWidget(
                            //   labelOne: 'Mode of Payment :',
                            //   dataOne: '',
                            // ),
                            // const SizedBox(
                            //   height: 5,
                            // ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SchemePendingScreen()));
                                },
                                child: const Text('Proceed'))
                          ],
                        ),
                      ),
                    ),
                  );
                }),
      ),
    );
  }
}
