import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/models/add_check_model.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/utils/constant.dart';
import 'package:shopping/widgets/background_decoration.dart';
import 'package:shopping/widgets/common_signature_pad.dart';
import 'package:shopping/widgets/detail_widget.dart';
import 'package:shopping/widgets/input_field_widget.dart';

import '../../../../../widgets/login_button.dart';

class SalesBounceProceed extends StatefulWidget {
  const SalesBounceProceed({super.key});

  @override
  State<SalesBounceProceed> createState() => _SalesBounceProceedState();
}

class _SalesBounceProceedState extends State<SalesBounceProceed> {
  double totalAmount = 0.0,
      finalAmount = 0.0,
      finalPrice = 0.0,
      directDiscAmt = 0.0;
  int? sliding = 0;
  String? selectedval = '';
  var bytes;

  final TextEditingController _ctlCashAmount = TextEditingController();
  final TextEditingController _ctlOnlineAmount = TextEditingController();
  final TextEditingController _ctlChequeNo = TextEditingController();
  final TextEditingController _ctlChequeAmount = TextEditingController();
  final TextEditingController _ctlChequeDate = TextEditingController();
  final TextEditingController _ctlPendingReason = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final TextEditingController _ctlDiscount = TextEditingController();
  final TextEditingController _ctlTopDiscount = TextEditingController();

  final GlobalKey<FormState> _formKey3 = GlobalKey();

  List<AddCheckModel> chequeList = [];

  Future<void> _navigateToSignaturePad(BuildContext context) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const CommonSignaturePad()));
    if (!mounted) return;

    setState(() {
      bytes = result;
    });
  }

  @override
  void dispose() {
    _ctlCashAmount.dispose();
    _ctlOnlineAmount.dispose();
    _ctlChequeNo.dispose();
    _ctlChequeAmount.dispose();
    _ctlPendingReason.dispose();
    _ctlDiscount.dispose();
    _ctlTopDiscount.dispose();
    _ctlChequeDate.dispose();
    super.dispose();
  }

  void addChequeFunction(
      {required String chequeNumb,
      required String chequeAmou,
      required String chequeD}) {
    chequeList.add(AddCheckModel(
        checkNumber: chequeNumb, checkAmount: chequeAmou, checkDate: chequeD));

    _ctlChequeNo.clear();
    _ctlChequeAmount.clear();
    _ctlChequeDate.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('Bounce Register')),
      body: Stack(
        children: [
          Container(
            decoration: BackgroundDecoration().boxD(),
          ),
          _buildBounceRegisterWidget(size)
        ],
      ),
    );
  }

  Widget _buildBounceRegisterWidget(Size size) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
        child: Column(
          children: [
            Card(
              elevation: 5,
              color: Color(0xFFede90e),
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 12.0),
                child: Column(
                  children: const [
                    DetailWidget(
                      label: 'Cheque Amount :',
                      data: '',
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    DetailWidget(
                      label: 'Bounce Charge :',
                      data: '',
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    DetailWidget(
                      label: 'Convenience Charge :',
                      data: '',
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    DetailWidget(
                      label: 'Total Amount :',
                      data: '1200',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 12.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.2,
                          child: Text(
                            'Discount : ',
                            style: TextStyle(
                                fontSize: size.width * 0.032,
                                color: colorText,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        // SizedBox(
                        //   width: size.width * 0.3,
                        //   child: StepperTextField(
                        //     rOnly: false,
                        //     controllerValue: _ctlTopDiscount,
                        //     inputType: TextInputType.number,
                        //     labelValue: '',
                        //   ),
                        // ),
                        SizedBox(
                          width: size.width * 0.25,
                          height: size.width * 0.08,
                          child: TextFormField(
                            style:
                                const TextStyle(fontSize: 15, letterSpacing: 2),
                            cursorColor: Colors.black87,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Discount';
                              } else {
                                return null;
                              }
                            },
                            controller: _ctlDiscount,
                            onChanged: (value) {
                              directDiscAmt =
                                  CommonFunctions.discountOnChangedFunction(
                                      value, 1200);

                              setState(() {});
                            },
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 0),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                      const BorderSide(color: borderColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide:
                                        const BorderSide(color: borderColor)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide:
                                        const BorderSide(color: borderColor)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide:
                                        const BorderSide(color: Colors.red)),
                                labelStyle:
                                    const TextStyle(color: Colors.black87)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    BoldHedDetailInfoWidget(
                      label: 'Final Amount :',
                      data: directDiscAmt.toString(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                child: Column(
                  children: [
                    Text(
                      'Payment Type',
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: size.width * 0.037),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: CupertinoSlidingSegmentedControl(
                        thumbColor: primaryColor,
                        children: {
                          0: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "Cash",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: sliding == 0
                                      ? Colors.white
                                      : Colors.black87),
                            ),
                          ),
                          1: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "Online",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: sliding == 1
                                      ? Colors.white
                                      : Colors.black87),
                            ),
                          ),
                          2: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "Cheque",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: sliding == 2
                                      ? Colors.white
                                      : Colors.black87),
                            ),
                          ),
                          // 3: Padding(
                          //   padding: const EdgeInsets.symmetric(vertical: 10),
                          //   child: Text(
                          //     "Pending",
                          //     style: TextStyle(
                          //         fontSize: 15.0,
                          //         fontWeight: FontWeight.bold,
                          //         color:
                          //             sliding == 3 ? Colors.white : Colors.black87),
                          //   ),
                          // )
                        },
                        groupValue: sliding,
                        onValueChanged: (int? newValue) {
                          CommonFunctions.hideKeyboard(context);
                          setState(() {
                            sliding = newValue;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const BoldHedDetailInfoWidget(
                      label: 'Pending Amt :',
                      data: '',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Column(
                        children: [
                          if (sliding == 0)
                            StepperTextField(
                              rOnly: false,
                              controllerValue: _ctlCashAmount,
                              inputType: TextInputType.number,
                              labelValue: 'Cash Amount',
                              validateValue: 'Enter Amount',
                            )
                          else if (sliding == 1)
                            StepperTextField(
                              rOnly: false,
                              controllerValue: _ctlOnlineAmount,
                              labelValue: 'Online Amount',
                              inputType: TextInputType.number,
                              validateValue: 'Enter Amount',
                            )
                          else if (sliding == 2)
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 4),
                                  decoration: BoxDecoration(
                                      color: primaryColor.withOpacity(0.1),
                                      border: Border.all(color: primaryColor)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 7),
                                          decoration: const BoxDecoration(
                                              border: Border(
                                                  right: BorderSide(
                                                      color: primaryColor))),
                                          child: Text(
                                            'Cheque Date',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: size.width * 0.028,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 7),
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                right: BorderSide(
                                                    color: primaryColor))),
                                        child: Text(
                                          'Cheque No.',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: size.width * 0.028,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87),
                                        ),
                                      )),
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 7),
                                          decoration: const BoxDecoration(
                                              border: Border(
                                                  right: BorderSide(
                                                      color: primaryColor))),
                                          child: Text(
                                            'Cheque Amt.',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: size.width * 0.028,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      SizedBox(
                                        width: size.width * 0.1,
                                        child: Text(
                                          'Action',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: size.width * 0.028,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                    ],
                                  ),
                                ),
                                ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: chequeList.length,
                                    controller: _scrollController,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 4),
                                        decoration: BoxDecoration(
                                            color:
                                                primaryColor.withOpacity(0.1),
                                            border: Border.all(
                                                color: primaryColor)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 6.0),
                                          child: Row(
                                            children: [
                                              // Text(
                                              //   '${index + 1})',
                                              //   textAlign: TextAlign.center,
                                              //   style: TextStyle(
                                              //       fontWeight: FontWeight.w500,
                                              //       fontSize: size.width * 0.034),
                                              // ),
                                              Expanded(
                                                child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 7),
                                                  decoration: const BoxDecoration(
                                                      border: Border(
                                                          right: BorderSide(
                                                              color:
                                                                  primaryColor))),
                                                  child: Text(
                                                    chequeList[index]
                                                        .checkDate
                                                        .toString(),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            size.width * 0.028),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 7),
                                                  decoration: const BoxDecoration(
                                                      border: Border(
                                                          right: BorderSide(
                                                              color:
                                                                  primaryColor))),
                                                  child: Text(
                                                    chequeList[index]
                                                        .checkNumber
                                                        .toString(),
                                                    textAlign: TextAlign.center,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            size.width * 0.028),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 7),
                                                  decoration: const BoxDecoration(
                                                      border: Border(
                                                          right: BorderSide(
                                                              color:
                                                                  primaryColor))),
                                                  child: Text(
                                                    '${chequeList[index].checkAmount.toString()} \u{20B9}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            size.width * 0.028),
                                                  ),
                                                ),
                                              ),

                                              const SizedBox(
                                                width: 5,
                                              ),
                                              SizedBox(
                                                width: size.width * 0.1,
                                                child: InkWell(
                                                  onTap: () {
                                                    chequeList.removeWhere(
                                                        (element) =>
                                                            element
                                                                .checkNumber ==
                                                            chequeList[index]
                                                                .checkNumber);

                                                    setState(() {});
                                                  },
                                                  child: const Center(
                                                    child: Icon(
                                                      Icons
                                                          .cancel_presentation_outlined,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                const SizedBox(
                                  height: 8,
                                ),
                                AppAddIconButtonWidget(
                                  onTap: () {
                                    showModalBottomSheet(
                                        barrierColor: Colors.transparent,
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: Colors.blue[300],
                                        shape: const RoundedRectangleBorder(
                                          side:
                                              BorderSide(color: Colors.black87),
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(8),
                                          ),
                                        ),
                                        builder: (_) => SizedBox(
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 15,
                                                    top: 15,
                                                    right: 15,
                                                    bottom:
                                                        MediaQuery.of(context)
                                                            .viewInsets
                                                            .bottom),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            'Add Cheque Detail',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black87,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                letterSpacing:
                                                                    1.5,
                                                                fontSize:
                                                                    size.width *
                                                                        0.037),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                            _ctlChequeNo
                                                                .clear();
                                                            _ctlChequeAmount
                                                                .clear();
                                                            _ctlChequeDate
                                                                .clear();
                                                          },
                                                          child: Container(
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .black87),
                                                                  shape: BoxShape
                                                                      .circle),
                                                              child: const Icon(
                                                                  Icons.close)),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Form(
                                                      key: _formKey3,
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                              flex: 2,
                                                              child:
                                                                  CheckModelTextField(
                                                                rOnly: true,
                                                                onTap:
                                                                    () async {
                                                                  String pDate =
                                                                      await CommonFunctions()
                                                                          .pickDate(
                                                                              context);
                                                                  if (pDate ==
                                                                      "null") {
                                                                    pDate = "";
                                                                  }
                                                                  _ctlChequeDate
                                                                          .text =
                                                                      pDate;
                                                                },
                                                                controllerValue:
                                                                    _ctlChequeDate,
                                                                hintValue:
                                                                    'Cheque Date',
                                                                validateValue:
                                                                    'Enter Cheque Date',
                                                              )),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Expanded(
                                                              flex: 2,
                                                              child:
                                                                  CheckModelTextField(
                                                                rOnly: false,
                                                                controllerValue:
                                                                    _ctlChequeNo,
                                                                hintValue:
                                                                    'Cheque Number',
                                                                mLength: 10,
                                                                inputType:
                                                                    TextInputType
                                                                        .number,
                                                                validateValue:
                                                                    'Enter Cheque Number',
                                                              )),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Expanded(
                                                              flex: 1,
                                                              child:
                                                                  CheckModelTextField(
                                                                rOnly: false,
                                                                controllerValue:
                                                                    _ctlChequeAmount,
                                                                hintValue:
                                                                    'Amount',
                                                                inputType:
                                                                    TextInputType
                                                                        .number,
                                                                validateValue:
                                                                    'Enter Amount',
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        // Expanded(
                                                        //   child: AppSquareButtonWidget(
                                                        //       onTap: () {
                                                        //         Navigator.pop(context);
                                                        //       },
                                                        //       btnText: 'Done'),
                                                        // ),
                                                        // const SizedBox(
                                                        //   width: 10,
                                                        // ),
                                                        AppAddPartButtonWidget(
                                                            onTap: () {
                                                              final isValid =
                                                                  _formKey3
                                                                      .currentState!
                                                                      .validate();

                                                              if (!isValid) {
                                                                return;
                                                              }
                                                              addChequeFunction(
                                                                  chequeD:
                                                                      _ctlChequeDate
                                                                          .text,
                                                                  chequeNumb:
                                                                      _ctlChequeNo
                                                                          .text,
                                                                  chequeAmou:
                                                                      _ctlChequeAmount
                                                                          .text);
                                                              _formKey3
                                                                  .currentState!
                                                                  .save();
                                                            },
                                                            btnText:
                                                                'Add Cheque'),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ));
                                  },
                                  btnText: 'Add Cheque',
                                ),
                              ],
                            ),

                          // else if (sliding == 3)
                          //   StepperTextField(
                          //     rOnly: false,
                          //     controllerValue: _ctlPendingReason,
                          //     labelValue: 'Reason',
                          //     validateValue: 'Enter Pending Reason',
                          //   ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    _navigateToSignaturePad(context);
                  },
                  child: Container(
                    height: size.height * 0.3,
                    width: size.width,
                    alignment: Alignment.center,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: bytes == null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                color: Colors.blue.shade900,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Add Signature',
                                style: TextStyle(
                                    color: Colors.blue.shade900,
                                    letterSpacing: 1,
                                    fontSize: size.width * 0.035),
                              ),
                            ],
                          )
                        : Image.memory(bytes!.buffer.asUint8List()),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            AppButtonWidget(
              onTap: () {},
              btnText: 'Submit',
            )
          ],
        ),
      ),
    );
  }
}
