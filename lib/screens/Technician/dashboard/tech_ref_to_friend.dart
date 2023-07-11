import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shopping/screens/Technician/dashboard/complaint/tech_ref_history.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/utils/constant.dart';

class TechReferToFriend extends StatefulWidget {
  const TechReferToFriend({super.key});

  @override
  State<TechReferToFriend> createState() => _TechReferToFriendState();
}

class _TechReferToFriendState extends State<TechReferToFriend> {
  PageController _ctlPageController = PageController();
  int currentIndex = 0;
  List freeList = [
    'One Year AFC',
    'One Year AMC',
    'One Year CMC',
    'Two Year CMC'
  ];

  String todate = "";

  @override
  void initState() {
    super.initState();
    CommonFunctions().disableCapture();
    _ctlPageController = PageController(initialPage: 0, viewportFraction: 0.75);
    DateTime now = DateTime.now();

    todate = DateFormat('dd-MM-yyyy').format(now);
  }

  @override
  void dispose() {
    _ctlPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Refer To Friend'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReferToFriendHistory()));
              },
              icon: const Icon(Icons.history))
        ],
      ),
      body: Column(children: [
        SizedBox(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                  height: size.height * 0.27,
                  width: size.width,
                  child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      controller: _ctlPageController,
                      pageSnapping: true,
                      onPageChanged: (value) {
                        setState(() {
                          currentIndex = value;
                        });
                      },
                      itemBuilder: ((context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.black87),
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 5,
                          margin: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            width: size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/schemes.png',
                                  height: 45,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Scheme : ${index + 1} Machine Sale',
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'Free : ${freeList[index]}',
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'Reward Date : 23 July 2023 - 23 August 2023',
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                InkWell(
                                  onTap: () async {
                                    await Share.share('Data');
                                  },
                                  child: Container(
                                    width: size.width,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    color: primaryColor,
                                    child: const Text(
                                      'Select',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }))),
              Positioned(
                bottom: 18,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    4,
                    (index) => buildDot(index, context),
                  ),
                ),
              ),
              // Positioned(
              //     left: 20,
              //     top: 50,
              //     child: TextButton(
              //         onPressed: () {
              //           _ctlPageController.animateToPage(slides.length - 1,
              //               duration: const Duration(milliseconds: 100),
              //               curve: Curves.bounceIn);
              //         },
              //         child: const Text(
              //           'Skip',
              //           style: TextStyle(fontSize: 18, color: primaryColor),
              //         ))),
            ],
          ),
        ),
        const Divider(
          color: blackColor,
        ),
        // Expanded(
        //     child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     ElevatedButton.icon(
        //         style: ButtonStyle(
        //             elevation: MaterialStateProperty.all(5),
        //             shape: MaterialStateProperty.all(
        //               const CircleBorder(),
        //             )),
        //         onPressed: () async {
        //           await Share.share('Data');
        //         },
        //         icon: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: SvgPicture.asset(
        //             'assets/svg_images/share_to_friend.svg',
        //             height: size.height * 0.1,
        //             color: Colors.white,
        //           ),
        //         ),
        //         label: const Text('')),
        //     const Material(
        //         //   child: InkWell(
        //         //     onTap: () {},
        //         //     child: Container(
        //         //       alignment: Alignment.center,
        //         //       height: size.height * 0.15,
        //         //       padding: const EdgeInsets.all(20),
        //         //       decoration: BoxDecoration(
        //         //           border: Border.all(color: Colors.black87),
        //         //           shape: BoxShape.circle),
        //         //       child: SvgPicture.asset(
        //         //         'assets/svg_images/share_to_friend.svg',
        //         //         height: size.height * 0.1,
        //         //       ),
        //         //     ),
        //         //   ),
        //         // ),
        //         )
        //   ],
        // ))
      ]),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 12,
      width: currentIndex == index ? 12 : 12,
      margin: const EdgeInsets.only(
        right: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black87),
        color: currentIndex == index ? primaryColor : Colors.grey[300],
      ),
    );
  }
}
