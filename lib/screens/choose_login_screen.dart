import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping/Bloc/internet_bloc/internet.state.dart';
import 'package:shopping/Bloc/internet_bloc/internet_bloc.dart';
import 'package:shopping/screens/Customer/cust_login_screen.dart';
import 'package:shopping/screens/Customer/new_cust_complain.dart';
import 'package:shopping/screens/company_login_screen.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/utils/constant.dart';
import 'package:shopping/widgets/login_widget_helper.dart';
import 'package:shopping/widgets/no_internet_widget.dart';

class ChooseLoginScreen extends StatefulWidget {
  const ChooseLoginScreen({super.key});

  @override
  State<ChooseLoginScreen> createState() => _ChooseLoginScreenState();
}

class _ChooseLoginScreenState extends State<ChooseLoginScreen> {
  @override
  void initState() {
    super.initState();
    CommonFunctions().disableCapture();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(body: BlocBuilder<InternetBloc, InternetState>(
      builder: (context, state) {
        if (state is InternetGainedState) {
          return Container(
            decoration: const BoxDecoration(
                // gradient: appgradientColor
                color: Colors.white),
            child: Column(
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [],
                )),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomPaint(
                      size: Size(MediaQuery.of(context).size.width,
                          MediaQuery.of(context).size.height),
                      painter: BackgroundPainter(),
                    ),
                    Positioned(
                        top: size.height * 0.08,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CompanyLoginCategoryScreen()));
                              },
                              child: Image.asset(
                                AppImageUrl().appLogoImage,
                                height: size.height * 0.12,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SvgPicture.asset(
                              'assets/svg_images/mobile_app.svg',
                              height: size.height * 0.23,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Text(
                              'Sit Back and Stay Relax!',
                            ),
                            Text(
                              'Get One stop solution on the app now.',
                            ),
                          ],
                        )),
                    Positioned(
                      bottom: 20,
                      child: SizedBox(
                        width: size.width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Column(
                            children: [
                              Text(
                                'Please Choose Anyone to Continue',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'SecularOne-Regular',
                                    color: Colors.black87,
                                    fontSize: size.width * 0.04),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  LoginWidgetHelper(
                                    assetImage:
                                        'assets/svg_images/existing_user.svg',
                                    passText: 'EXISTING USER',
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const CustLoginScreen()));
                                    },
                                  ),
                                  LoginWidgetHelper(
                                    assetImage:
                                        'assets/svg_images/new_user.svg',
                                    passText: 'NEW USER',
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const NewCustComplainForm()));
                                    },
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'For any inquiry kindly ',
                                  style: const TextStyle(color: Colors.white),
                                  children: [
                                    TextSpan(
                                      text: 'Click here.',
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: darkPrimaryColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap =
                                            () => Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Container(),
                                                  ),
                                                ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        } else if (state is InternetLostState) {
          return const NoInternetWidget();
        } else {
          return const Text('Loading');
        }
      },
    )
        //     BlocBuilder<InternetBloc, InternetState>(builder: (context, state) {
        //   if (state is InternetGainedState) {
        //     return Container(
        //       decoration: const BoxDecoration(
        //           // gradient: appgradientColor
        //           color: Colors.white),
        //       child: Column(
        //         children: [
        //           Expanded(
        //               child: Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             children: const [
        //               // const Spacer(),
        //               // InkWell(
        //               //   onTap: () {
        //               //     Navigator.push(
        //               //         context,
        //               //         MaterialPageRoute(
        //               //             builder: (context) =>
        //               //                 const CompanyLoginCategoryScreen()));
        //               //   },
        //               //   child: Card(
        //               //     margin: EdgeInsets.zero,
        //               //     color: Colors.white,
        //               //     shadowColor: const Color.fromARGB(255, 16, 57, 90),
        //               //     elevation: 3,
        //               //     shape: RoundedRectangleBorder(
        //               //         borderRadius: BorderRadius.circular(8)),
        //               //     child: Image.asset(
        //               //       AppImageUrl().appLogoImage,
        //               //       height: size.height * 0.12,
        //               //     ),
        //               //   ),
        //               // ),
        //               // InkWell(
        //               //   onTap: () {
        //               //     Navigator.push(
        //               //         context,
        //               //         MaterialPageRoute(
        //               //             builder: (context) =>
        //               //                 const CompanyLoginCategoryScreen()));
        //               //   },
        //               //   child: Image.asset(
        //               //     AppImageUrl().appLogoImage,
        //               //     height: size.height * 0.12,
        //               //   ),
        //               // ),
        //               // const Spacer(),
        //               // SvgPicture.asset(
        //               //   'assets/svg_images/mobile_app.svg',
        //               //   height: size.height * 0.3,
        //               // ),
        //               // Text(
        //               //   'Sit Back and Stay Relax!',
        //               //   style: GoogleFonts.secularOne(
        //               //       color: primaryColor,
        //               //       letterSpacing: .5,
        //               //       fontSize: size.width * 0.046),
        //               // ),
        //               // Text(
        //               //   'Get One stop solution on the app now.',
        //               //   style: GoogleFonts.secularOne(
        //               //       color: primaryColor,
        //               //       letterSpacing: .5,
        //               //       fontSize: size.width * 0.046),
        //               // ),
        //               // const Spacer(),
        //               // SvgPicture.asset(
        //               //   'assets/svg_images/mobile_app.svg',
        //               //   height: size.height * 0.3,
        //               // ),
        //             ],
        //           )),
        //           // SizedBox(
        //           //   width: size.width,
        //           //   child: Card(
        //           //     elevation: 10,
        //           //     margin: EdgeInsets.zero,
        //           //     shape: const RoundedRectangleBorder(
        //           //         side: BorderSide(color: Color.fromARGB(255, 16, 57, 90)),
        //           //         borderRadius: BorderRadius.only(
        //           //             topLeft: Radius.circular(25),
        //           //             topRight: Radius.circular(25))),
        //           //     child: Padding(
        //           //       padding: const EdgeInsets.symmetric(vertical: 15.0),
        //           //       child: Column(
        //           //         children: [
        //           //           Text(
        //           //             'Please Choose Anyone to Continue',
        //           //             style: TextStyle(
        //           //                 fontWeight: FontWeight.w500,
        //           //                 fontFamily: 'SecularOne-Regular',
        //           //                 color: Colors.black87,
        //           //                 fontSize: size.width * 0.04),
        //           //           ),
        //           //           const SizedBox(
        //           //             height: 7,
        //           //           ),
        //           //           const Divider(
        //           //             color: Color.fromARGB(255, 16, 57, 90),
        //           //           ),
        //           //           const SizedBox(
        //           //             height: 7,
        //           //           ),
        //           //           Row(
        //           //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //           //             children: [
        //           //               LoginWidgetHelper(
        //           //                 assetImage: 'assets/svg_images/existing_user.svg',
        //           //                 passText: 'EXISTING USER',
        //           //                 onTap: () {
        //           //                   Navigator.push(
        //           //                       context,
        //           //                       MaterialPageRoute(
        //           //                           builder: (context) =>
        //           //                               const CustLoginScreen()));
        //           //                 },
        //           //               ),
        //           //               LoginWidgetHelper(
        //           //                 assetImage: 'assets/svg_images/new_user.svg',
        //           //                 passText: 'NEW USER',
        //           //                 onTap: () {
        //           //                   Navigator.push(
        //           //                       context,
        //           //                       MaterialPageRoute(
        //           //                           builder: (context) =>
        //           //                               const NewCustComplainForm()));
        //           //                 },
        //           //               )
        //           //             ],
        //           //           ),
        //           //           const SizedBox(
        //           //             height: 20,
        //           //           ),
        //           //           RichText(
        //           //             text: TextSpan(
        //           //               text: 'For any inquiry kindly ',
        //           //               style: const TextStyle(color: Colors.black87),
        //           //               children: [
        //           //                 TextSpan(
        //           //                   text: 'Click here.',
        //           //                   style: const TextStyle(
        //           //                     fontSize: 13,
        //           //                     color: primaryColor,
        //           //                     fontWeight: FontWeight.bold,
        //           //                   ),
        //           //                   recognizer: TapGestureRecognizer()
        //           //                     ..onTap = () => Navigator.of(context).push(
        //           //                           MaterialPageRoute(
        //           //                             builder: (context) => Container(),
        //           //                           ),
        //           //                         ),
        //           //                 ),
        //           //               ],
        //           //             ),
        //           //           ),
        //           //           const SizedBox(
        //           //             height: 10,
        //           //           ),
        //           //         ],
        //           //       ),
        //           //     ),
        //           //   ),
        //           // ),
        //           Stack(
        //             alignment: Alignment.center,
        //             children: [
        //               CustomPaint(
        //                 size: Size(MediaQuery.of(context).size.width,
        //                     MediaQuery.of(context).size.height),
        //                 painter: BackgroundPainter(),
        //               ),
        //               Positioned(
        //                   top: size.height * 0.08,
        //                   child: Column(
        //                     children: [
        //                       InkWell(
        //                         onTap: () {
        //                           Navigator.push(
        //                               context,
        //                               MaterialPageRoute(
        //                                   builder: (context) =>
        //                                       const CompanyLoginCategoryScreen()));
        //                         },
        //                         child: Image.asset(
        //                           AppImageUrl().appLogoImage,
        //                           height: size.height * 0.12,
        //                         ),
        //                       ),
        //                       const SizedBox(
        //                         height: 30,
        //                       ),
        //                       SvgPicture.asset(
        //                         'assets/svg_images/mobile_app.svg',
        //                         height: size.height * 0.23,
        //                       ),
        //                       const SizedBox(
        //                         height: 40,
        //                       ),
        //                       Text(
        //                         'Sit Back and Stay Relax!',
        //                         style: GoogleFonts.secularOne(
        //                             color: primaryColor,
        //                             letterSpacing: .5,
        //                             fontSize: size.width * 0.043),
        //                       ),
        //                       Text(
        //                         'Get One stop solution on the app now.',
        //                         style: GoogleFonts.secularOne(
        //                             color: primaryColor,
        //                             letterSpacing: .5,
        //                             fontSize: size.width * 0.043),
        //                       ),
        //                     ],
        //                   )),
        //               Positioned(
        //                 bottom: 20,
        //                 child: SizedBox(
        //                   width: size.width,
        //                   child: Padding(
        //                     padding: const EdgeInsets.symmetric(vertical: 15.0),
        //                     child: Column(
        //                       children: [
        //                         Text(
        //                           'Please Choose Anyone to Continue',
        //                           style: TextStyle(
        //                               fontWeight: FontWeight.w500,
        //                               fontFamily: 'SecularOne-Regular',
        //                               color: Colors.black87,
        //                               fontSize: size.width * 0.04),
        //                         ),
        //                         const SizedBox(
        //                           height: 30,
        //                         ),
        //                         Row(
        //                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                           children: [
        //                             LoginWidgetHelper(
        //                               assetImage:
        //                                   'assets/svg_images/existing_user.svg',
        //                               passText: 'EXISTING USER',
        //                               onTap: () {
        //                                 Navigator.push(
        //                                     context,
        //                                     MaterialPageRoute(
        //                                         builder: (context) =>
        //                                             const CustLoginScreen()));
        //                               },
        //                             ),
        //                             LoginWidgetHelper(
        //                               assetImage: 'assets/svg_images/new_user.svg',
        //                               passText: 'NEW USER',
        //                               onTap: () {
        //                                 Navigator.push(
        //                                     context,
        //                                     MaterialPageRoute(
        //                                         builder: (context) =>
        //                                             const NewCustComplainForm()));
        //                               },
        //                             )
        //                           ],
        //                         ),
        //                         const SizedBox(
        //                           height: 20,
        //                         ),
        //                         RichText(
        //                           text: TextSpan(
        //                             text: 'For any inquiry kindly ',
        //                             style: const TextStyle(color: Colors.white),
        //                             children: [
        //                               TextSpan(
        //                                 text: 'Click here.',
        //                                 style: const TextStyle(
        //                                   fontSize: 13,
        //                                   color: Colors.black,
        //                                   fontWeight: FontWeight.w500,
        //                                 ),
        //                                 recognizer: TapGestureRecognizer()
        //                                   ..onTap = () =>
        //                                       Navigator.of(context).push(
        //                                         MaterialPageRoute(
        //                                           builder: (context) => Container(),
        //                                         ),
        //                                       ),
        //                               ),
        //                             ],
        //                           ),
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           )
        //         ],
        //       ),
        //     );
        //   } else if (state is InternetLostState) {
        //     return const Center(
        //       child: Text('No Internet'),
        //     );
        //   } else {
        //     return const Text('Loading');
        //   }
        // })
        );
  }
}

class StackedWavesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(colors: [
        Colors.blue,
        Color.fromARGB(255, 7, 48, 231),
      ]).createShader(Offset.zero & size);
    const double side = 120;
    const double radius = 120;

    final path = Path()
      ..moveTo(0, size.height / 2 + side)
      ..arcToPoint(Offset(side, size.height / 2),
          radius: const Radius.circular(radius))
      ..lineTo(size.width - side, size.height / 2)
      ..arcToPoint(Offset(size.width, size.height / 2 - side),
          radius: const Radius.circular(radius), clockwise: false)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.save();
    canvas.drawPath(path, paint);
    canvas.restore();

    canvas.save();
    canvas.translate(0, 100);
    canvas.drawPath(path, Paint()..color = Colors.white);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Paint paint = Paint()..color = Colors.white;
    final paint = Paint()
      ..shader = const LinearGradient(colors: [
        // Color.fromARGB(255, 90, 173, 241),
        // Color.fromARGB(255, 90, 173, 241),
        primaryColor, primaryColor
      ]).createShader(Offset.zero & size);
    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width * 0.5, 0);
    path.lineTo(0, size.height * 0.3);

    path.close();

    final path2 = Path();

    path2.moveTo(size.width, 0);
    path2.lineTo(size.width, size.height * 0.4);
    path2.lineTo(0, size.height);

    path2.lineTo(size.width, size.height);
    path2.close();

    canvas.drawPath(path, paint);
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
