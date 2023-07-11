import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/Bloc/internet_bloc/internet.state.dart';
import 'package:shopping/Bloc/internet_bloc/internet_bloc.dart';
import 'package:shopping/Bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:shopping/screens/Admin/admin_login.dart';
import 'package:shopping/screens/Sales/sales_login.dart';
import 'package:shopping/screens/Super%20Admin/super_admin_login.dart';
import 'package:shopping/screens/Technician/technician_login.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/widgets/bottom_widget.dart';
import 'package:shopping/widgets/custom_route_page.dart';
import 'package:shopping/widgets/login_widget_helper.dart';
import 'package:shopping/widgets/no_internet_widget.dart';

class CompanyLoginCategoryScreen extends StatefulWidget {
  const CompanyLoginCategoryScreen({super.key});

  @override
  State<CompanyLoginCategoryScreen> createState() =>
      _CompanyLoginCategoryScreenState();
}

class _CompanyLoginCategoryScreenState
    extends State<CompanyLoginCategoryScreen> {
  @override
  void initState() {
    super.initState();
    CommonFunctions().disableCapture();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<InternetBloc, InternetState>(
      builder: (context, state) {
        if (state is InternetGainedState) {
          return Scaffold(
            body: Container(
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/auth-bg.jpg',
                      ),
                      fit: BoxFit.cover),
                  // gradient: LinearGradient(
                  //   begin: Alignment.bottomLeft,
                  //   end: Alignment.topRight,
                  //   stops: [0.1, 0.5, 0.7, 0.9],
                  //   colors: [
                  //     Color.fromARGB(255, 150, 199, 221),
                  //     Color.fromARGB(255, 104, 181, 218),
                  //     Color.fromARGB(255, 69, 168, 214),
                  //     Color.fromARGB(255, 28, 159, 219),
                  //   ],
                  // ),
                  color: Colors.white),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Choose Login to Continue',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.05),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Card(
                        margin: EdgeInsets.zero,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            side:
                                const BorderSide(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(8)),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20.0),
                          alignment: Alignment.center,
                          child: GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            crossAxisSpacing: 15.0,
                            mainAxisSpacing: 20.0,
                            children: [
                              LoginWidgetHelper2(
                                assetImage:
                                    'assets/svg_images/super_administrator.svg',
                                passText: 'Super Admin',
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      CustomPageRoute(
                                          direction: AxisDirection.up,
                                          child:
                                              const SuperAdminLoginScreen()));
                                },
                              ),
                              LoginWidgetHelper2(
                                assetImage: 'assets/svg_images/subadmin.svg',
                                passText: 'Admin',
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      CustomPageRoute(
                                          direction: AxisDirection.up,
                                          child: const SubAdminLoginScreen()));
                                },
                              ),
                              LoginWidgetHelper2(
                                assetImage: 'assets/svg_images/technician.svg',
                                passText: 'Technician',
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      CustomPageRoute(
                                          direction: AxisDirection.up,
                                          child: BlocProvider(
                                            create: (context) => SignInBloc(),
                                            child:
                                                const TechnicianLoginScreen(),
                                          )));
                                },
                              ),
                              LoginWidgetHelper2(
                                assetImage: 'assets/svg_images/sales.svg',
                                passText: 'Sales',
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      CustomPageRoute(
                                          direction: AxisDirection.up,
                                          child: const SalesLoginScreen()));
                                },
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            bottomSheet: BottomWidget(size: size),
          );
        } else if (state is InternetLostState) {
          return const NoInternetWidget();
        } else {
          return const Text('Loading');
        }
      },
    );
  }
}
