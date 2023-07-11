import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/screens/Technician/dashboard/complaint/proceed1_parts/machine_scheme/machine_exchange_provider.dart';
import 'package:shopping/screens/Technician/dashboard/complaint/proceed1_parts/machine_scheme/order_form_page.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/utils/constant.dart';
import 'package:shopping/widgets/add_remove_rate_button.dart';
import 'package:shopping/widgets/background_decoration.dart';
import 'package:shopping/widgets/common_card_design.dart';
import 'package:shopping/widgets/detail_widget.dart';
import 'package:shopping/widgets/dropdown_widget.dart';
import 'package:shopping/widgets/input_field_widget.dart';
import 'package:shopping/widgets/login_button.dart';
import 'package:shopping/widgets/typeformfield_widget.dart';

class SchemeMachineExchange extends StatefulWidget {
  const SchemeMachineExchange({super.key});

  @override
  State<SchemeMachineExchange> createState() => _SchemeMachineExchangeState();
}

class _SchemeMachineExchangeState extends State<SchemeMachineExchange> {
  String? selectedval = '';

  final TextEditingController _ctlIdNo = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<FormState> _formKey3 = GlobalKey();

  final TextEditingController _ctlCashAmount = TextEditingController();
  final TextEditingController _ctlOnlineAmount = TextEditingController();

  final TextEditingController _ctlPendingReason = TextEditingController();
  final TextEditingController _ctlMachineExchangeRemark =
      TextEditingController();

  final TextEditingController _ctlProduct = TextEditingController();
  final TextEditingController _ctlProductModel = TextEditingController();
  final TextEditingController _ctlLitters = TextEditingController();
  final TextEditingController _ctlQuantity = TextEditingController();
  final TextEditingController _ctlDescription = TextEditingController();

  final TextEditingController _ctlDesc = TextEditingController();
  final TextEditingController _ctlProductPrice = TextEditingController();
  final TextEditingController _ctlPurchaseAmt = TextEditingController();
  final TextEditingController _ctlTDS = TextEditingController();
  final TextEditingController _ctlAccessories = TextEditingController();

  final TextEditingController ctlChequeDate = TextEditingController();
  final TextEditingController ctlChequeNo = TextEditingController();
  final TextEditingController ctlChequeAmount = TextEditingController();

  @override
  void initState() {
    super.initState();
    CommonFunctions().disableCapture();
    final machineExchangeProvider =
        Provider.of<MachineExchangeProvider>(context, listen: false);
    machineExchangeProvider.resetValues();
  }

  @override
  void dispose() {
    _ctlIdNo.dispose();
    _ctlCashAmount.dispose();
    _ctlOnlineAmount.dispose();
    ctlChequeDate.dispose();
    ctlChequeNo.dispose();
    ctlChequeAmount.dispose();
    _ctlPendingReason.dispose();
    _ctlMachineExchangeRemark.dispose();
    _ctlProduct.dispose();
    _ctlProductModel.dispose();
    _ctlLitters.dispose();
    _ctlQuantity.dispose();
    _ctlDescription.dispose();
    _scrollController.dispose();
    _ctlProductPrice.dispose();
    _ctlTDS.dispose();
    _ctlAccessories.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Machine Exchange'),
        ),
        body: Stack(children: [
          Container(
            decoration: BackgroundDecoration().boxD(),
          ),
          _buildMachineExchangeWidget(size)
        ]),
      ),
    );
  }

  Widget _buildMachineExchangeWidget(Size size) {
    final machineExchangeProvider =
        Provider.of<MachineExchangeProvider>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
        child: Column(
          children: [
            CommonCardDesign(
              listOfWidget: [
                const DetailInfoWidget(
                  label: 'Bill No.',
                  data: '123456',
                ),
                const SizedBox(
                  height: 15,
                ),
                TypeFormFieldWidget(
                  passList: machineExchangeProvider.productData,
                  passedOnSuggestionSelected: (p0) {
                    _ctlProduct.text = p0.toString();
                  },
                  noItemsFoundBuilderString: 'No Product found..',
                  hintTextString: 'Product',
                  validatorString: 'Please select Product',
                  passedController: _ctlProduct,
                ),
                const SizedBox(
                  height: 15,
                ),
                TypeFormFieldWidget(
                  passList: machineExchangeProvider.productModelList,
                  passedOnSuggestionSelected: (p0) {
                    _ctlProductModel.text = p0.toString();
                  },
                  noItemsFoundBuilderString: 'No Product Model found..',
                  hintTextString: 'Product Model',
                  validatorString: 'Please select Product Model',
                  passedController: _ctlProductModel,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Flexible(
                      child: StepperTextField(
                        rOnly: false,
                        controllerValue: _ctlQuantity,
                        labelValue: 'Quantity',
                        validateValue: 'Enter Quantity',
                        inputType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: StepperTextField(
                        rOnly: true,
                        controllerValue: _ctlLitters,
                        inputType: TextInputType.number,
                        labelValue: 'Litters',
                        validateValue: 'Enter Litters',
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                TypeFormFieldWidget(
                  passList: machineExchangeProvider.accessoriesList,
                  passedOnSuggestionSelected: (p0) {
                    _ctlAccessories.text = p0.toString();
                  },
                  noItemsFoundBuilderString: 'No Accessories found..',
                  hintTextString: 'Accessories',
                  validatorString: 'Please select Accessories',
                  passedController: _ctlAccessories,
                ),
                const SizedBox(
                  height: 15,
                ),
                StepperTextField(
                  rOnly: false,
                  controllerValue: _ctlDescription,
                  labelValue: 'Description',
                  validateValue: 'Enter Description',
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Flexible(
                      child: StepperTextField(
                        rOnly: false,
                        controllerValue: _ctlTDS,
                        inputType: TextInputType.number,
                        labelValue: 'TDS',
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      'Product Price : ',
                      style: TextStyle(
                          fontSize: size.width * 0.032,
                          color: colorText,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w500),
                    )),
                    Flexible(
                      child: StepperTextField(
                        rOnly: true,
                        inputType: TextInputType.number,
                        controllerValue: _ctlProductPrice,
                        labelValue: '',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      'Old Machine Disc. & Discount',
                      style: TextStyle(
                          fontSize: size.width * 0.032,
                          color: colorText,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w500),
                    )),
                    Flexible(
                      child: StepperTextField(
                        rOnly: false,
                        controllerValue: _ctlDesc,
                        inputType: TextInputType.number,
                        labelValue: '',
                        validateValue: 'Enter Discount',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      'Purchase amount : ',
                      style: TextStyle(
                          fontSize: size.width * 0.032,
                          color: colorText,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w500),
                    )),
                    Flexible(
                      child: StepperTextField(
                        rOnly: true,
                        controllerValue: _ctlPurchaseAmt,
                        inputType: TextInputType.number,
                        labelValue: '',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Flexible(
                      child: DropDownWidget(
                          labelText: 'Gst Rate',
                          hintText: 'Select Gst Rate',
                          dropMenuList: CommonFunctions.gstRates,
                          selectedReturnValue: (value) {
                            setState(() => selectedval = value);
                          }),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    AddRemoveRateButtons(
                      onAddButtonClick: () {},
                      onSubtractButtonClick: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: size.width,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: primaryColor.withOpacity(0.1),
                      border: Border.all(color: Colors.black54)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'GST Amount',
                            style: TextStyle(
                                fontSize: size.width * 0.034,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Text('100',
                              style: TextStyle(
                                  fontSize: size.width * 0.034,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            'Net Amount',
                            style: TextStyle(
                                fontSize: size.width * 0.034,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Text('+',
                              style: TextStyle(
                                  fontSize: size.width * 0.034,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: size.width * 0.1,
                          ),
                          Text('100',
                              style: TextStyle(
                                  fontSize: size.width * 0.034,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          Text(
                            'Total Amount',
                            style: TextStyle(
                                fontSize: size.width * 0.034,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Text('200',
                              style: TextStyle(
                                  fontSize: size.width * 0.034,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  color: Colors.black,
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
                              color: machineExchangeProvider.sliding == 0
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
                              color: machineExchangeProvider.sliding == 1
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
                              color: machineExchangeProvider.sliding == 2
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
                    groupValue: machineExchangeProvider.sliding,
                    onValueChanged: (int? newValue) {
                      CommonFunctions.hideKeyboard(context);
                      machineExchangeProvider.changeSlidingPosition(newValue);
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
                      if (machineExchangeProvider.sliding == 0)
                        StepperTextField(
                          rOnly: false,
                          controllerValue: _ctlCashAmount,
                          inputType: TextInputType.number,
                          labelValue: 'Cash Amount',
                          validateValue: 'Enter Amount',
                        )
                      else if (machineExchangeProvider.sliding == 1)
                        StepperTextField(
                          rOnly: false,
                          controllerValue: _ctlOnlineAmount,
                          labelValue: 'Online Amount',
                          inputType: TextInputType.number,
                          validateValue: 'Enter Amount',
                        )
                      else if (machineExchangeProvider.sliding == 2)
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
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 7),
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
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    machineExchangeProvider.chequeList.length,
                                controller: _scrollController,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 4),
                                    decoration: BoxDecoration(
                                        color: primaryColor.withOpacity(0.1),
                                        border:
                                            Border.all(color: primaryColor)),
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 7),
                                              decoration: const BoxDecoration(
                                                  border: Border(
                                                      right: BorderSide(
                                                          color:
                                                              primaryColor))),
                                              child: Text(
                                                machineExchangeProvider
                                                    .chequeList[index].checkDate
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        size.width * 0.028),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 7),
                                              decoration: const BoxDecoration(
                                                  border: Border(
                                                      right: BorderSide(
                                                          color:
                                                              primaryColor))),
                                              child: Text(
                                                machineExchangeProvider
                                                    .chequeList[index]
                                                    .checkNumber
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        size.width * 0.028),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 7),
                                              decoration: const BoxDecoration(
                                                  border: Border(
                                                      right: BorderSide(
                                                          color:
                                                              primaryColor))),
                                              child: Text(
                                                '${machineExchangeProvider.chequeList[index].checkAmount.toString()} \u{20B9}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
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
                                                // machineExchangeProvider
                                                //     .chequeList
                                                //     .removeWhere((element) =>
                                                //         element.checkNumber ==
                                                //         machineExchangeProvider
                                                //             .chequeList[index]
                                                //             .checkNumber);
                                                machineExchangeProvider
                                                    .removeCheque(
                                                        index,
                                                        machineExchangeProvider
                                                            .chequeList[index]
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
                                      side: BorderSide(color: Colors.black87),
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(8),
                                      ),
                                    ),
                                    builder: (_) {
                                      return SizedBox(
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
                                                          color: Colors.black87,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          letterSpacing: 1.5,
                                                          fontSize: size.width *
                                                              0.037),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                      ctlChequeDate.clear();
                                                      ctlChequeAmount.clear();
                                                      ctlChequeNo.clear();
                                                    },
                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
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
                                                          onTap: () async {
                                                            String pDate =
                                                                await CommonFunctions()
                                                                    .pickDate(
                                                                        context);
                                                            if (pDate ==
                                                                "null") {
                                                              pDate = "";
                                                            }
                                                            ctlChequeDate.text =
                                                                pDate;
                                                          },
                                                          controllerValue:
                                                              ctlChequeDate,
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
                                                              ctlChequeNo,
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
                                                              ctlChequeAmount,
                                                          hintValue: 'Amount',
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
                                                    MainAxisAlignment.center,
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

                                                        machineExchangeProvider
                                                            .addChequeFunction(
                                                                chequeD:
                                                                    ctlChequeDate
                                                                        .text,
                                                                chequeNumb:
                                                                    ctlChequeNo
                                                                        .text,
                                                                chequeAmou:
                                                                    ctlChequeAmount
                                                                        .text);

                                                        _formKey3.currentState!
                                                            .save();
                                                        ctlChequeDate.clear();
                                                        ctlChequeAmount.clear();
                                                        ctlChequeNo.clear();
                                                      },
                                                      btnText: 'Add Cheque'),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
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
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 15,
                ),
                StepperTextField(
                  rOnly: false,
                  controllerValue: _ctlMachineExchangeRemark,
                  labelValue: 'Remark',
                  validateValue: 'Enter Remark',
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              margin: EdgeInsets.zero,
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: Colors.grey)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    machineExchangeProvider.navigateToSignaturePad(
                        context, machineExchangeProvider);
                  },
                  child: Container(
                    height: size.height * 0.2,
                    width: size.width,
                    alignment: Alignment.center,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: machineExchangeProvider.bytes == null
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
                        : Image.memory(machineExchangeProvider.bytes!.buffer
                            .asUint8List()),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            AppButtonWidget(
              onTap: () async {
                // final pdfFile = await TechMExchangePDF().generate(bill);
                // TechPdfApi.openFile(pdfFile);
                // redirect(pdfFile);
                if (machineExchangeProvider.bytes != null) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MachineOrderFormScreen(
                              byteList: machineExchangeProvider.bytes)));
                } else {
                  CommonFunctions().failedMessage('Add Signature');
                }
              },
              btnText: 'Submit',
            )
          ],
        ),
      ),
    );
  }
}
