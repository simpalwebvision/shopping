import 'package:flutter/material.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/widgets/detail_widget.dart';
import 'package:shopping/widgets/dropdown_widget.dart';
import 'package:shopping/widgets/input_field_widget.dart';
import 'package:shopping/widgets/login_button.dart';

class CustComplainMaster extends StatefulWidget {
  const CustComplainMaster({
    super.key,
  });

  @override
  State<CustComplainMaster> createState() => _CustComplainMasterState();
}

class _CustComplainMasterState extends State<CustComplainMaster>
    with SingleTickerProviderStateMixin {
  bool queryNo = false;
  late AnimationController _animationController;
  late Animation<double> _animation;
  final TextEditingController _ctlBillNo = TextEditingController();
  final TextEditingController _ctlOtherComplain = TextEditingController();

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    CommonFunctions().disableCapture();
    // getNotified();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    _ctlBillNo.dispose();
    _ctlOtherComplain.dispose();
  }

  List billNoList = [
    '123456789',
    '456789123',
    '789123456',
  ];

  String? selectedval = '';
  List remark = [
    'Machine not working',
    'leakage',
    'Water test',
    'Not Storage',
    'Shifting',
    'Overflow',
    'Any other query',
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Book Complaint'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
                child: Column(children: [
              queryNo
                  ? Container()
                  : Column(
                      children: [
                        const DetailInfoWidget(
                          label: 'Bill No. :',
                          data: '',
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        ExpandedDropDownWidget(
                            labelText: 'Problem',
                            hintText: 'Select Problem',
                            dropMenuList: remark,
                            selectedReturnValue: (value) {
                              setState(() => selectedval = value);
                            }),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        selectedval == 'Any other query'
                            ? StepperTextField(
                                rOnly: false,
                                controllerValue: _ctlOtherComplain,
                                labelValue: 'Enter your Problem here ..',
                                validateValue: 'Enter your Problem',
                              )
                            : Container(),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        AppButtonWidget(
                          onTap: () {
                            _animationController.forward();
                            setState(() {
                              queryNo = true;
                            });
                            Future.delayed(const Duration(seconds: 5), () {
                              setState(() {
                                queryNo = false;
                              });
                            });
                          },
                          btnText: 'Submit',
                        ),
                      ],
                    ),
              SizedBox(
                height: size.height * 0.02,
              ),
              queryNo
                  // ? ScaleTransition(
                  //     scale: _animation,
                  //     child: CircleAvatar(
                  //       backgroundColor: Colors.green,
                  //       radius: size.width * 0.15,
                  //       child: Icon(
                  //         Icons.thumb_up_alt_sharp,
                  //         color: Colors.white,
                  //         size: size.width * 0.2,
                  //       ),
                  //     ),
                  //   )
                  ? ScaleTransition(
                      scale: _animation,
                      child: Image.asset(
                        'assets/images/book_thumb_icon.jpeg',
                        height: size.height * 0.3,
                      ))
                  : Container(),
              SizedBox(
                height: size.height * 0.03,
              ),
              queryNo
                  ? Text(
                      'Your Complaint Booked ..',
                      style: TextStyle(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold),
                    )
                  : Container(),
              SizedBox(
                height: size.height * 0.01,
              ),
              queryNo
                  ? Text(
                      'Your Query Number : 123456',
                      style: TextStyle(
                          fontSize: size.width * 0.04,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    )
                  : Container(),
            ]))),
      ),
    );
  }
}
