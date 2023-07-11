import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:shopping/utils/common_function.dart';

class TodayOfferScreen extends StatefulWidget {
  const TodayOfferScreen({super.key});

  @override
  State<TodayOfferScreen> createState() => _TodayOfferScreenState();
}

class _TodayOfferScreenState extends State<TodayOfferScreen> {
  @override
  void initState() {
    super.initState();
    CommonFunctions().disableCapture();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: SizedBox(
          // decoration: const BoxDecoration(
          //     image: DecorationImage(
          //         fit: BoxFit.cover,
          //         image: AssetImage('assets/images/profile_background.png'))),
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: size.height * 0.07,
                  child: Marquee(
                    text: "Today's Offer !",
                    scrollAxis: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    blankSpace: 20.0,
                    velocity: 100.0,
                    pauseAfterRound: const Duration(seconds: 1),
                    showFadingOnlyWhenScrolling: true,
                    fadingEdgeStartFraction: 0.1,
                    fadingEdgeEndFraction: 0.1,
                    numberOfRounds: null,
                    startPadding: 10.0,
                    accelerationDuration: const Duration(seconds: 1),
                    accelerationCurve: Curves.linear,
                    decelerationDuration: const Duration(milliseconds: 500),
                    decelerationCurve: Curves.easeOut,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black87)),
                    height: size.height * 0.3,
                    width: size.width * 0.6,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  margin: EdgeInsets.zero,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                      side: const BorderSide(color: Colors.black87)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Nerio Misty',
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Upto 15 LPH* ABS Food Grade plastic',
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Wall maunte & table Tab (Two-In-One)\n330L x 233W x 464 H.M.M',
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Outside Sediment+Sediment+Pre-Carbon+UF+RO+UV+TDS+Minerals',
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '11 Watt 3.400kg 60W 24V DC 100-300 v-AC/50 Hz.800m',
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Divider(
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Deal of the Day',
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          '\u{20B9} 13293/- \u{20B9} 18900 Save \u{20B9} 5697 (30 %)',
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Save extra with no cost EMI',
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Extra with No Cost EMI',
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Get it by Monday to Friday Free',
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Delivery by Aqua Nerio',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
