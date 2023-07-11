import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping/screens/Technician/dashboard/work_history/tech_history_todays_work.dart';
import 'package:shopping/screens/Technician/dashboard/work_history/text_spare_part_bounce.dart';
import 'package:shopping/utils/common_function.dart';

import 'tech_spare_part_pending.dart';

class TechHistoryScreen extends StatefulWidget {
  const TechHistoryScreen({
    super.key,
  });

  @override
  State<TechHistoryScreen> createState() => _TechHistoryScreenState();
}

class _TechHistoryScreenState extends State<TechHistoryScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    CommonFunctions().disableCapture();
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('Work History'),
        //   actions: [
        //     IconButton(
        //       onPressed: () {
        //         setState(() {
        //           showSearchBar = !showSearchBar;
        //         });
        //       },
        //       icon: const Icon(
        //         Icons.search,
        //       ),
        //     ),
        //   ],
        //   bottom: showSearchBar
        //       ? PreferredSize(
        //           preferredSize: const Size.fromHeight(60),
        //           child: Padding(
        //             padding:
        //                 const EdgeInsets.only(bottom: 10, left: 15, right: 15),
        //             child: TextField(
        //               controller: _searchController,
        //               decoration: InputDecoration(
        //                 hintText: 'Search Complaint...',
        //                 prefixIcon: const Icon(
        //                   Icons.search,
        //                   color: primaryColor,
        //                 ),
        //                 contentPadding: EdgeInsets.zero,
        //                 border: OutlineInputBorder(
        //                   borderRadius: BorderRadius.circular(5),
        //                   borderSide: BorderSide.none,
        //                 ),
        //                 filled: true,
        //                 fillColor: Colors.white,
        //               ),
        //             ),
        //           ))
        //       : null,
        // ),
        appBar: AppBar(
          title: const Text('P.B.TW. History'),

          bottom: TabBar(
            // isScrollable: true,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white54,
            labelStyle: const TextStyle(),
            controller: tabController,
            indicatorColor: Colors.white,
            indicatorWeight: 3.0,

            tabs: const [
              Tab(
                icon: BoderedStacktext(
                  value: '1250.00 \u{20B9}',
                ),
                child: Text(
                  'Pending',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Tab(
                icon: BoderedStacktext(
                  value: '1250.00 \u{20B9}',
                ),
                child: Text(
                  'Bounce',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.clockRotateLeft),
                child: Text(
                  'TW History',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          // bottom: showSearchBar
          //     ? PreferredSize(
          //         preferredSize: const Size.fromHeight(60),
          //         child: Padding(
          //           padding:
          //               const EdgeInsets.only(bottom: 10, left: 15, right: 15),
          //           child: TextField(
          //             controller: _searchController,
          //             decoration: InputDecoration(
          //               hintText: 'Search Parts...',
          //               prefixIcon: const Icon(
          //                 Icons.search,
          //                 color: primaryColor,
          //               ),
          //               contentPadding: EdgeInsets.zero,
          //               border: OutlineInputBorder(
          //                 borderRadius: BorderRadius.circular(5),
          //                 borderSide: BorderSide.none,
          //               ),
          //               filled: true,
          //               fillColor: Colors.white,
          //             ),
          //           ),
          //         ))
          //     : null,
        ),
        body: TabBarView(
          controller: tabController,
          children: const [
            TechHistoryPendingTab(),
            TechHistoryBounceTab(),
            TechTodaysWorkHistoryTab()
          ],
        ));
  }
}

class BoderedStacktext extends StatelessWidget {
  final String value;
  const BoderedStacktext({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          value,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 2
                ..color = Colors.white),
        ),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
