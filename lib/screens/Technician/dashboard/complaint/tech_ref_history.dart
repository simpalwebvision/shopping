import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopping/utils/common_function.dart';

class ReferToFriendHistory extends StatefulWidget {
  const ReferToFriendHistory({super.key});

  @override
  State<ReferToFriendHistory> createState() => _ReferToFriendHistoryState();
}

class _ReferToFriendHistoryState extends State<ReferToFriendHistory> {
  String todate = "";

  @override
  void initState() {
    super.initState();
    CommonFunctions().disableCapture();

    DateTime now = DateTime.now();

    todate = DateFormat('dd-MM-yyyy').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Referral History'),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemCount: 5,
          itemBuilder: ((context, index) {
            return InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Date : $todate',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                    fontSize: 14,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Expanded(child: Container()),
                                Text(
                                  'Ref No. : 123456789',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.blue[900],
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Reward Points : 20',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Office Ex : ABC-XYZ',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            );
          })),
    );
  }
}
