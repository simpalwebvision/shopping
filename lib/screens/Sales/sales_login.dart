import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping/Bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:shopping/Bloc/sign_in_bloc/sign_in_event.dart';
import 'package:shopping/Bloc/sign_in_bloc/sign_in_state.dart';
import 'package:shopping/screens/Sales/sales_dashboard.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/utils/constant.dart';
import 'package:shopping/widgets/login_button.dart';
import 'package:shopping/widgets/login_form_field.dart';

class SalesLoginScreen extends StatefulWidget {
  const SalesLoginScreen({super.key});

  @override
  State<SalesLoginScreen> createState() => _SalesLoginScreenState();
}

class _SalesLoginScreenState extends State<SalesLoginScreen> {
  final TextEditingController ctlMobile = TextEditingController();

  @override
  void initState() {
    super.initState();
    CommonFunctions().disableCapture();
  }

  @override
  void dispose() {
    super.dispose();
    ctlMobile.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: loginAppgradientColor),
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(),
            ),
            SizedBox(
              width: size.width,
              child: Card(
                elevation: 15,
                margin: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Log in and go to Dashboard',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                            fontSize: size.width * 0.04),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 15,
                      ),
                      SvgPicture.asset(
                        'assets/svg_images/sales.svg',
                        height: 80,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Sales Login',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                            letterSpacing: 1,
                            fontSize: size.width * 0.032),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Column(
                        children: [
                          LoginTextFormField(
                            textFieldLabel:
                                'Enter Your Sales Registered Mobile Number :',
                            fieldController: ctlMobile,
                            onchange: (val) {
                              BlocProvider.of<SignInBloc>(context)
                                  .add(SignInTextChangeEvent(ctlMobile.text));
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          BlocBuilder<SignInBloc, SignInState>(
                            builder: (context, state) {
                              if (state is SignInErrorState) {
                                return Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorMessage,
                                    style: const TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w500),
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          BlocConsumer<SignInBloc, SignInState>(
                            builder: (context, state) {
                              if (state is SignInLoadingState) {
                                return const CircularProgressIndicator();
                              } else {
                                return LoginButtonWidget(
                                    btnColor: (state is SignInValidState)
                                        ? enableButtonColor
                                        : disableButtonColor,
                                    onTap: (state is SignInValidState)
                                        ? () {
                                            BlocProvider.of<SignInBloc>(context)
                                                .add(SignInSubmittedEvent(
                                                    ctlMobile.text,
                                                    'Sales',
                                                    '123456789'));
                                          }
                                        : null);
                              }
                            },
                            listener: (context, state) {
                              if (state is SignInLogginSuccessState) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SalesDashboardScreen()),
                                    (route) => false);
                              } else if (state is SignFirebaseErrorState) {
                                CommonFunctions()
                                    .failedMessage(state.errorMessage);
                              }
                            },
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
