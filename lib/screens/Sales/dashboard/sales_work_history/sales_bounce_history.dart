import 'package:flutter/material.dart';
import 'package:shopping/screens/Sales/dashboard/sales_work_history/sales_collection_amt/sales_bounce_proceed.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/utils/constant.dart';
import 'package:shopping/widgets/background_decoration.dart';
import 'package:shopping/widgets/detail_widget.dart';

class SalesBounceHistoryScreen extends StatefulWidget {
  const SalesBounceHistoryScreen({super.key});

  @override
  State<SalesBounceHistoryScreen> createState() =>
      _SalesBounceHistoryScreenState();
}

class _SalesBounceHistoryScreenState extends State<SalesBounceHistoryScreen> {
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    CommonFunctions().disableCapture();
  }

  @override
  Widget build(BuildContext context) {
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
                              labelOne: 'Id No.',
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
                            // const DetailRowInfoWidget(
                            //   labelOne: 'Scheme :',
                            //   dataOne: '',
                            // ),
                            // const SizedBox(
                            //   height: 5,
                            // ),
                            const DetailRowInfoWidget(
                              labelOne: 'Amount :',
                              dataOne: '',
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SalesBounceProceed()));
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
