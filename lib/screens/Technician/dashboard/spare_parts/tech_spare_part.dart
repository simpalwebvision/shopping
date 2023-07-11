import 'package:flutter/material.dart';
import 'package:shopping/screens/Technician/dashboard/spare_parts/tech_req_spare_part.dart';
import 'package:shopping/screens/Technician/dashboard/spare_parts/tech_spare_available_parts.dart';
import 'package:shopping/screens/Technician/dashboard/spare_parts/texh_spare_old_parts.dart';

import '../../../../utils/common_function.dart';

class TechSparePartScreen extends StatefulWidget {
  const TechSparePartScreen({super.key});

  @override
  State<TechSparePartScreen> createState() => _TechSparePartScreenState();
}

class _TechSparePartScreenState extends State<TechSparePartScreen>
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
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 92, 128, 10),
        title: const Text(
          'Spare Parts Data',
          style: TextStyle(color: Colors.white),
        ),

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
              icon: Icon(Icons.checklist_rounded),
              child: Text(
                'Available Parts',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Tab(
              icon: Icon(Icons.content_paste_go_rounded),
              child: Text(
                'Request Parts',
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Tab(
              icon: Icon(Icons.list_alt_rounded),
              child: Text(
                'Old Returned Parts ',
                overflow: TextOverflow.ellipsis,
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
        children: [
          const TechSpareAvailableParts(),
          TechReqSparePartScreen(
            baseContext: context,
          ),
          const TechSpareOldParts()
        ],
      ),

      // body:
      // ListView.builder(
      //     shrinkWrap: true,
      //     itemCount: 5,
      //     itemBuilder: (context, index) {
      //       return Padding(
      //         padding:
      //             const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      //         child: Card(
      //           elevation: 5,
      //           shape: RoundedRectangleBorder(
      //               side: const BorderSide(color: Colors.black54),
      //               borderRadius: BorderRadius.circular(8)),
      //           child: Padding(
      //               padding: const EdgeInsets.all(12.0),
      //               child: Stack(
      //                 children: [
      //                   Row(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Container(
      //                         decoration: BoxDecoration(
      //                             shape: BoxShape.circle,
      //                             border: Border.all(color: Colors.black87)),
      //                         height: size.height * 0.13,
      //                         width: size.width * 0.27,
      //                       ),
      //                       Padding(
      //                         padding: const EdgeInsets.all(8.0),
      //                         child: Column(
      //                           mainAxisAlignment: MainAxisAlignment.start,
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Text(
      //                               'Product Name',
      //                               style: TextStyle(
      //                                   fontSize: size.width * 0.032,
      //                                   color: primaryColor,
      //                                   letterSpacing: 0.5,
      //                                   fontWeight: FontWeight.w500),
      //                             ),
      //                             const SizedBox(
      //                               height: 3,
      //                             ),
      //                             Text('Best Price : ',
      //                                 style: TextStyle(
      //                                   fontSize: size.width * 0.03,
      //                                   fontWeight: FontWeight.w500,
      //                                   color: Colors.black87,
      //                                 )),
      //                             const SizedBox(
      //                               height: 3,
      //                             ),
      //                             Text('Date',
      //                                 style: TextStyle(
      //                                   fontSize: size.width * 0.03,
      //                                   fontWeight: FontWeight.w500,
      //                                   color: Colors.black87,
      //                                 )),
      //                           ],
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                   Positioned(
      //                       right: 0,
      //                       bottom: 0,
      //                       child: InkWell(
      //                         onTap: () {},
      //                         child: const Text(
      //                           'More Images ..',
      //                           style: TextStyle(
      //                               letterSpacing: 1,
      //                               color: Colors.transparent,
      //                               decorationColor: primaryColor,
      //                               shadows: [
      //                                 Shadow(
      //                                     color: primaryColor,
      //                                     offset: Offset(0, -5))
      //                               ],
      //                               decoration: TextDecoration.underline),
      //                         ),
      //                       ))
      //                 ],
      //               )),
      //         ),
      //       );
      //     }),
    );
  }
}
