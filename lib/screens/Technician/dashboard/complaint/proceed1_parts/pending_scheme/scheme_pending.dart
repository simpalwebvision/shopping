import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/screens/Technician/dashboard/complaint/proceed1_parts/pending_scheme/pending_provider.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/utils/constant.dart';
import 'package:shopping/widgets/add_remove_rate_button.dart';
import 'package:shopping/widgets/background_decoration.dart';
import 'package:shopping/widgets/detail_widget.dart';
import 'package:shopping/widgets/dropdown_widget.dart';
import 'package:shopping/widgets/input_field_widget.dart';
import 'package:shopping/widgets/login_button.dart';

class SchemePendingScreen extends StatefulWidget {
  const SchemePendingScreen({super.key});

  @override
  State<SchemePendingScreen> createState() => _SchemePendingScreenState();
}

class _SchemePendingScreenState extends State<SchemePendingScreen> {
  String? selectedval = '';

  var bytes;

  final TextEditingController _ctlCashAmount = TextEditingController();
  final TextEditingController _ctlOnlineAmount = TextEditingController();
  final TextEditingController _ctlChequeNo = TextEditingController();
  final TextEditingController _ctlChequeAmount = TextEditingController();

  final ScrollController _scrollController = ScrollController();
  final TextEditingController _ctlPname = TextEditingController();
  final TextEditingController _ctlPquantity = TextEditingController();
  final TextEditingController _ctlDiscount = TextEditingController();
  final TextEditingController _ctlChequeDate = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final GlobalKey<FormState> _formKey2 = GlobalKey();
  final GlobalKey<FormState> _formKey3 = GlobalKey();

  @override
  void initState() {
    final pendingProvider =
        Provider.of<PendingProvider>(context, listen: false);
    pendingProvider.resetValue();
    super.initState();
  }

  @override
  void dispose() {
    _ctlCashAmount.dispose();
    _ctlOnlineAmount.dispose();
    _ctlChequeNo.dispose();
    _ctlChequeAmount.dispose();

    _ctlPname.dispose();
    _ctlPquantity.dispose();
    _ctlDiscount.dispose();
    _ctlChequeDate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('Pending')),
      body: Stack(
        children: [
          Container(
            decoration: BackgroundDecoration().boxD(),
          ),
          _buildPendingWidget(size)
        ],
      ),
    );
  }

  Widget _buildPendingWidget(Size size) {
    final pendingProvider = Provider.of<PendingProvider>(context);
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
          child: Column(
            children: [
              Card(
                elevation: 5,
                color: const Color(0xFFE65755),
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 12.0),
                  child: Row(
                    children: [
                      SelectableText(
                        'Pending Amount',
                        style: TextStyle(
                            fontSize: size.width * 0.032,
                            color: Colors.white,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 5),
                      SelectableText(
                        "",
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          color: Colors.black,
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
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 8.0),
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
                                    color: pendingProvider.sliding == 0
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
                                    color: pendingProvider.sliding == 1
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
                                    color: pendingProvider.sliding == 2
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
                          groupValue: pendingProvider.sliding,
                          onValueChanged: (int? newValue) {
                            CommonFunctions.hideKeyboard(context);
                            pendingProvider.changeSlidingPosition(newValue);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const BoldHedDetailInfoWidget(
                        label: 'Pending Amt :',
                        data: '123',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Column(
                          children: [
                            if (pendingProvider.sliding == 0)
                              StepperTextField(
                                rOnly: false,
                                controllerValue: _ctlCashAmount,
                                inputType: TextInputType.number,
                                labelValue: 'Cash Amount',
                                validateValue: 'Enter Amount',
                              )
                            else if (pendingProvider.sliding == 1)
                              StepperTextField(
                                rOnly: false,
                                controllerValue: _ctlOnlineAmount,
                                labelValue: 'Online Amount',
                                inputType: TextInputType.number,
                                validateValue: 'Enter Amount',
                              )
                            else if (pendingProvider.sliding == 2)
                              Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 4),
                                    decoration: BoxDecoration(
                                        color: primaryColor.withOpacity(0.1),
                                        border:
                                            Border.all(color: primaryColor)),
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
                                      itemCount:
                                          pendingProvider.chequeList.length,
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
                                                      pendingProvider
                                                          .chequeList[index]
                                                          .checkDate
                                                          .toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: size.width *
                                                              0.028),
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
                                                      pendingProvider
                                                          .chequeList[index]
                                                          .checkNumber
                                                          .toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: size.width *
                                                              0.028),
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
                                                      '${pendingProvider.chequeList[index].checkAmount.toString()} \u{20B9}',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: size.width *
                                                              0.028),
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
                                                      pendingProvider
                                                          .removeCheque(
                                                              index,
                                                              pendingProvider
                                                                  .chequeList[
                                                                      index]
                                                                  .checkNumber);
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
                                            side: BorderSide(
                                                color: Colors.black87),
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
                                                        MainAxisAlignment
                                                            .center,
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
                                                                  fontSize: size
                                                                          .width *
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
                                                                    Icons
                                                                        .close)),
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
                                                                    String
                                                                        pDate =
                                                                        await CommonFunctions()
                                                                            .pickDate(context);
                                                                    if (pDate ==
                                                                        "null") {
                                                                      pDate =
                                                                          "";
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
                                                                pendingProvider.addChequeFunction(
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

                                                                _ctlChequeNo
                                                                    .clear();
                                                                _ctlChequeAmount
                                                                    .clear();
                                                                _ctlChequeDate
                                                                    .clear();
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
              pendingProvider.finallist.isEmpty
                  ? Container()
                  : const SizedBox(
                      height: 20,
                    ),
              pendingProvider.finallist.isEmpty
                  ? Container()
                  : Container(
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black54)),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Text(
                            'Used Parts List',
                            style: TextStyle(
                                color: Colors.green[800],
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                                fontSize: size.width * 0.037),
                          ),
                          const Divider(
                            color: Colors.black87,
                          ),
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: pendingProvider.finallist.length,
                              controller: _scrollController,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var quan = double.parse(pendingProvider
                                    .finallist[index].quantity
                                    .toString());
                                var price = double.parse(pendingProvider
                                    .finallist[index].price
                                    .toString());
                                var total = quan * price;

                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        '${index + 1})   ${pendingProvider.finallist[index].pname.toString()}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: size.width * 0.034),
                                      ),
                                      const Spacer(),
                                      Text(
                                        '${pendingProvider.finallist[index].price.toString()}  x  ${pendingProvider.finallist[index].quantity.toString()}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: size.width * 0.034),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        '=',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: size.width * 0.034),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        pendingProvider
                                                .finallist[index].fromAddPARTS
                                            ? "0"
                                            : total.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: size.width * 0.034),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          pendingProvider.removePart(
                                              index,
                                              pendingProvider
                                                  .finallist[index].pname,
                                              _ctlDiscount.text);

                                          if (pendingProvider
                                              .finallist.isEmpty) {
                                            _ctlDiscount.clear();
                                          }
                                        },
                                        child: const Icon(
                                          Icons.cancel_presentation_outlined,
                                          color: Colors.red,
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }),
                          const SizedBox(
                            height: 7,
                          ),
                          Container(
                            height: 1.5,
                            color: Colors.black54,
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Total  :',
                                        style: TextStyle(
                                            color: darkPrimaryColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: size.width * 0.034),
                                      ),
                                    ),
                                    Text(
                                      pendingProvider.total.toStringAsFixed(2),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: size.width * 0.034),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Discount  :',
                                      style: TextStyle(
                                          color: darkPrimaryColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: size.width * 0.034),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.25,
                                      height: size.width * 0.08,
                                      child: TextFormField(
                                        style: const TextStyle(
                                            fontSize: 15, letterSpacing: 2),
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
                                          pendingProvider
                                              .discountOnChangedFunction(value);
                                        },
                                        decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 15,
                                                    vertical: 0),
                                            filled: true,
                                            fillColor: Colors.white,
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: const BorderSide(
                                                  color: borderColor),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                borderSide: const BorderSide(
                                                    color: borderColor)),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(12),
                                                    borderSide:
                                                        const BorderSide(
                                                            color:
                                                                borderColor)),
                                            errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                borderSide: const BorderSide(
                                                    color: Colors.red)),
                                            labelStyle: const TextStyle(
                                                color: Colors.black87)),
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    Text(
                                      'Total Amt :',
                                      style: TextStyle(
                                          color: darkPrimaryColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: size.width * 0.034),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      pendingProvider.totalAmount
                                          .toStringAsFixed(2),
                                      style: TextStyle(
                                          color: darkPrimaryColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: size.width * 0.034),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                      child: DropDownWidget(
                                          labelText: 'Gst Rate',
                                          hintText: 'Select Gst Rate',
                                          dropMenuList:
                                              CommonFunctions.gstRates,
                                          selectedReturnValue: (value) {
                                            setState(() => selectedval = value);
                                          }),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    AddRemoveRateButtons(
                                      onAddButtonClick: () {
                                        pendingProvider
                                            .onAddButtonClick(selectedval);
                                      },
                                      onSubtractButtonClick: () {
                                        pendingProvider
                                            .onSubtractButtonClick(selectedval);
                                      },
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'GST Total Amount  :',
                                        style: TextStyle(
                                            color: darkPrimaryColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: size.width * 0.034),
                                      ),
                                    ),
                                    Text(
                                      pendingProvider.gstTotalAmt
                                          .toStringAsFixed(2),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: size.width * 0.034),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppAddIconButtonWidget(
                    onTap: () {
                      showModalBottomSheet(
                          barrierColor: Colors.transparent,
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.blue[300],
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black87),
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(8),
                            ),
                          ),
                          builder: (_) => SizedBox(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 15,
                                      right: 15,
                                      top: 15,
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Add Part',
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 1.5,
                                                  fontSize: size.width * 0.037),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              _ctlPname.clear();
                                              _ctlPquantity.clear();
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        color: Colors.black87),
                                                    shape: BoxShape.circle),
                                                child: const Icon(Icons.close)),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Form(
                                        key: _formKey,
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 3,
                                                child: ModelTextField(
                                                  controllerValue: _ctlPname,
                                                  hintValue: 'Part Name',
                                                  inputType: TextInputType.text,
                                                  validateValue:
                                                      'Enter Part Name',
                                                )),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: ModelTextField(
                                                  controllerValue:
                                                      _ctlPquantity,
                                                  hintValue: 'Quantity',
                                                  inputType:
                                                      TextInputType.number,
                                                  validateValue:
                                                      'Enter Quantity',
                                                )),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      AppAddPartButtonWidget(
                                          onTap: () {
                                            final isValid = _formKey
                                                .currentState!
                                                .validate();

                                            if (!isValid) {
                                              return;
                                            }
                                            pendingProvider.addPartsFunction(
                                              fromAddParts: true,
                                              partName: _ctlPname.text,
                                              partPrice: '100',
                                              partQuantity: _ctlPquantity.text,
                                              discount: _ctlDiscount.text,
                                            );
                                            _ctlPname.clear();
                                            _ctlPquantity.clear();
                                            _formKey.currentState!.save();
                                          },
                                          btnText: 'Add Part'),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ));
                    },
                    btnText: 'Add Parts',
                  ),
                  AppAddIconButtonWidget(
                    onTap: () {
                      showModalBottomSheet(
                          barrierColor: Colors.transparent,
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.blue[300],
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black87),
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
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Add External Part',
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 1.5,
                                                  fontSize: size.width * 0.037),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              _ctlPname.clear();
                                              _ctlPquantity.clear();
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        color: Colors.black87),
                                                    shape: BoxShape.circle),
                                                child: const Icon(Icons.close)),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Form(
                                        key: _formKey2,
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 3,
                                                child: ModelTextField(
                                                  controllerValue: _ctlPname,
                                                  hintValue: 'Part Name',
                                                  inputType: TextInputType.text,
                                                  validateValue:
                                                      'Enter Part Name',
                                                )),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: ModelTextField(
                                                  controllerValue:
                                                      _ctlPquantity,
                                                  hintValue: 'Quantity',
                                                  inputType:
                                                      TextInputType.number,
                                                  validateValue:
                                                      'Enter Quantity',
                                                )),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      AppAddPartButtonWidget(
                                          onTap: () {
                                            final isValid = _formKey2
                                                .currentState!
                                                .validate();

                                            if (!isValid) {
                                              return;
                                            }
                                            pendingProvider.addPartsFunction(
                                                fromAddParts: false,
                                                partName: _ctlPname.text,
                                                partPrice: '100',
                                                partQuantity:
                                                    _ctlPquantity.text,
                                                discount: _ctlDiscount.text);
                                            _ctlPname.clear();
                                            _ctlPquantity.clear();
                                            _formKey2.currentState!.save();
                                          },
                                          btnText: 'Add Part'),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ));
                    },
                    btnText: 'Add External Parts',
                  ),
                ],
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
                      pendingProvider.navigateToSignaturePad(
                          context, pendingProvider);
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
          )),
    );
  }
}
