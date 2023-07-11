import 'package:flutter/material.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/widgets/background_decoration.dart';
import 'package:shopping/widgets/common_loader.dart';

class TechSpareOldParts extends StatefulWidget {
  const TechSpareOldParts({super.key});

  @override
  State<TechSpareOldParts> createState() => _TechSpareOldPartsState();
}

class _TechSpareOldPartsState extends State<TechSpareOldParts> {
  bool showSearchBar = false, isLoading = false;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BackgroundDecoration().boxD(),
        child: isLoading
            ? const CommonLoaderScreen()
            : Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: RefreshIndicator(
                  onRefresh: _refresh,
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                  const SizedBox(
                                    height: 10,
                                  ),
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
                            const Divider(
                              color: Colors.black,
                            )
                          ],
                        );
                      }),
                ),
              ),
      ),
    );
  }
}
