import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/models/add_check_model.dart';
import 'package:shopping/models/cmc_part_model.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/utils/constant.dart';
import 'package:shopping/widgets/add_remove_rate_button.dart';
import 'package:shopping/widgets/background_decoration.dart';
import 'package:shopping/widgets/common_card_design.dart';
import 'package:shopping/widgets/common_signature_pad.dart';
import 'package:shopping/widgets/detail_widget.dart';
import 'package:shopping/widgets/dropdown_widget.dart';
import 'package:shopping/widgets/input_field_widget.dart';
import 'package:shopping/widgets/login_button.dart';

class OrderCMCScreen extends StatefulWidget {
  const OrderCMCScreen({super.key});

  @override
  State<OrderCMCScreen> createState() => _OrderCMCScreenState();
}

class _OrderCMCScreenState extends State<OrderCMCScreen> {
  double totalAmount = 0.0, finalAmount = 0.0, finalPrice = 0.0;
  String? selectedval = '';
  int? sliding = 0;
  var bytes;
  final TextEditingController _ctlPname = TextEditingController();
  final TextEditingController _ctlPquantity = TextEditingController();
  final TextEditingController _ctlCashAmount = TextEditingController();
  final TextEditingController _ctlOnlineAmount = TextEditingController();
  final TextEditingController _ctlChequeNo = TextEditingController();
  final TextEditingController _ctlChequeAmount = TextEditingController();
  final TextEditingController _ctlPendingReason = TextEditingController();
  final TextEditingController _ctlDiscount = TextEditingController();
  final TextEditingController _ctlChequeDate = TextEditingController();

  final TextEditingController _ctlCustNameController = TextEditingController();
  final TextEditingController _ctlContactNumController =
      TextEditingController();
  final TextEditingController _ctlAlternateContactNumController =
      TextEditingController();
  final TextEditingController _ctlEmailController = TextEditingController();
  final TextEditingController _ctlAddressController = TextEditingController();
  final TextEditingController _ctlStationController = TextEditingController();
  final TextEditingController _ctlPinController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final GlobalKey<FormState> _formKey2 = GlobalKey();
  final GlobalKey<FormState> _formKey3 = GlobalKey();

  final ScrollController _scrollController = ScrollController();
  List<AddPartModel> finallist = [];
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
  void initState() {
    super.initState();
    CommonFunctions().disableCapture();
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

  void addPartsFunction(
      {required bool fromAddParts,
      required String partName,
      required String partPrice,
      required String partQuantity}) {
    finallist.add(AddPartModel(
        pname: partName,
        price: partPrice,
        quantity: partQuantity,
        fromAddPARTS: fromAddParts));
    totalAmount = 4500.0;

    for (var val in finallist) {
      if (!val.fromAddPARTS) {
        var parTotal = double.parse(val.price!) * double.parse(val.quantity!);
        totalAmount += parTotal;
      }
    }

    _ctlPname.clear();
    _ctlPquantity.clear();
    setState(() {});
  }

  @override
  void dispose() {
    _ctlPname.dispose();
    _ctlPquantity.dispose();
    _scrollController.dispose();
    _ctlCashAmount.dispose();
    _ctlOnlineAmount.dispose();
    _ctlChequeNo.dispose();
    _ctlChequeAmount.dispose();
    _ctlPendingReason.dispose();
    _ctlChequeDate.dispose();

    _ctlCustNameController.dispose();
    _ctlContactNumController.dispose();
    _ctlAlternateContactNumController.dispose();
    _ctlEmailController.dispose();
    _ctlAddressController.dispose();
    _ctlStationController.dispose();
    _ctlPinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('CMC'),
        ),
        body: Stack(
          children: [
            Container(
              decoration: BackgroundDecoration().boxD(),
            ),
            _buildCMCWidget(size)
          ],
        ));
  }

  Widget _buildCMCWidget(Size size) {
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
            child: Column(
              children: [
                CommonCardDesign(
                  listOfWidget: [
                    StepperTextField(
                      rOnly: false,
                      controllerValue: _ctlCustNameController,
                      inputType: TextInputType.number,
                      validateValue: 'Enter Customer Name',
                      labelValue: 'Customer Name',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: StepperTextField(
                            rOnly: false,
                            controllerValue: _ctlContactNumController,
                            inputType: TextInputType.number,
                            validateValue: 'Enter Contact Number',
                            labelValue: 'Contact Number',
                            mLength: 10,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: StepperTextField(
                            rOnly: false,
                            controllerValue: _ctlAlternateContactNumController,
                            validateValue: 'Enter Alternate Contact Number',
                            labelValue: 'Alternate Contact Number',
                            mLength: 10,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    StepperTextField(
                      rOnly: false,
                      controllerValue: _ctlEmailController,
                      validateValue: 'Enter Email',
                      labelValue: 'Email',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    StepperTextField(
                      rOnly: false,
                      controllerValue: _ctlAddressController,
                      validateValue: 'Enter Address',
                      labelValue: 'Address',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    StepperTextField(
                      rOnly: false,
                      controllerValue: _ctlStationController,
                      validateValue: 'Enter Station',
                      labelValue: 'Station',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    StepperTextField(
                      rOnly: false,
                      controllerValue: _ctlPinController,
                      validateValue: 'Enter Pin Code',
                      labelValue: 'Pin Code',
                      inputType: TextInputType.number,
                    ),
                  ],
                ),
                finallist.isEmpty
                    ? Container()
                    : const SizedBox(
                        height: 20,
                      ),
                finallist.isEmpty
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
                                itemCount: finallist.length,
                                controller: _scrollController,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  var quan = double.parse(
                                      finallist[index].quantity.toString());
                                  var price = double.parse(
                                      finallist[index].price.toString());
                                  var total = quan * price;

                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 6.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          '${index + 1})   ${finallist[index].pname.toString()}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: size.width * 0.034),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '${finallist[index].price.toString()}  x  ${finallist[index].quantity.toString()}',
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
                                          finallist[index].fromAddPARTS
                                              ? '0'
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
                                            finallist.removeWhere((element) =>
                                                element.pname ==
                                                finallist[index].pname);
                                            totalAmount = 4500.0;
                                            for (var val in finallist) {
                                              if (!val.fromAddPARTS) {
                                                var parTotal = double.parse(
                                                        val.price!) *
                                                    double.parse(val.quantity!);
                                                totalAmount += parTotal;
                                              }
                                            }
                                            setState(() {});
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
                                        totalAmount.toString(),
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
                                          onChanged: (value) async {
                                            finalAmount = CommonFunctions
                                                .discountOnChangedFunction(
                                                    value, totalAmount);

                                            setState(() {});
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
                                        'Total Amt : ',
                                        style: TextStyle(
                                            color: darkPrimaryColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: size.width * 0.034),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        finalAmount.toString(),
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
                                      SizedBox(
                                        width: size.width * 0.4,
                                        child: DropDownWidget(
                                            labelText: 'Gst Rate',
                                            hintText: 'Select Gst Rate',
                                            dropMenuList:
                                                CommonFunctions.gstRates,
                                            selectedReturnValue: (value) {
                                              setState(
                                                  () => selectedval = value);
                                            }),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      AddRemoveRateButtons(
                                        onAddButtonClick: () {
                                          var tmpValue =
                                              selectedval!.replaceAll('%', '');
                                          var amt = (finalAmount *
                                                  int.parse(tmpValue)) /
                                              100;
                                          finalPrice = finalAmount + amt;
                                          setState(() {});
                                        },
                                        onSubtractButtonClick: () {
                                          var tmpValue =
                                              selectedval!.replaceAll('%', '');
                                          var amt = (finalAmount -
                                              (finalAmount *
                                                  (100 /
                                                      (100 +
                                                          int.parse(
                                                              tmpValue)))));
                                          finalPrice = finalAmount - amt;
                                          setState(() {});
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
                                        finalPrice.toStringAsFixed(2),
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
                    // ElevatedButton.icon(
                    //   style: ButtonStyle(
                    //       backgroundColor:
                    //           MaterialStateProperty.all(darkPrimaryColor),
                    //       padding: MaterialStateProperty.all(
                    //           const EdgeInsets.symmetric(horizontal: 8))),
                    //   onPressed: () {
                    // },
                    //   label: const Text('Add Parts'),
                    //   icon: const Icon(Icons.add),
                    // ),

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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                                    fontSize:
                                                        size.width * 0.037),
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
                                                          color:
                                                              Colors.black87),
                                                      shape: BoxShape.circle),
                                                  child:
                                                      const Icon(Icons.close)),
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
                                                    inputType:
                                                        TextInputType.text,
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
                                              addPartsFunction(
                                                  fromAddParts: true,
                                                  partName: _ctlPname.text,
                                                  partPrice: '100',
                                                  partQuantity:
                                                      _ctlPquantity.text);
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                                    fontSize:
                                                        size.width * 0.037),
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
                                                          color:
                                                              Colors.black87),
                                                      shape: BoxShape.circle),
                                                  child:
                                                      const Icon(Icons.close)),
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
                                                    inputType:
                                                        TextInputType.text,
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
                                              addPartsFunction(
                                                  fromAddParts: false,
                                                  partName: _ctlPname.text,
                                                  partPrice: '100',
                                                  partQuantity:
                                                      _ctlPquantity.text);
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
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
                                          border:
                                              Border.all(color: primaryColor)),
                                      child: Row(
                                        children: [
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
                                                'Cheque Date',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize:
                                                        size.width * 0.028,
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 7),
                                              decoration: const BoxDecoration(
                                                  border: Border(
                                                      right: BorderSide(
                                                          color:
                                                              primaryColor))),
                                              child: Text(
                                                'Cheque Amt.',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize:
                                                        size.width * 0.028,
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
                                                color: primaryColor
                                                    .withOpacity(0.1),
                                                border: Border.all(
                                                    color: primaryColor)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
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
                                                          .symmetric(
                                                          vertical: 7),
                                                      decoration: const BoxDecoration(
                                                          border: Border(
                                                              right: BorderSide(
                                                                  color:
                                                                      primaryColor))),
                                                      child: Text(
                                                        chequeList[index]
                                                            .checkDate
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize:
                                                                size.width *
                                                                    0.028),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 7),
                                                      decoration: const BoxDecoration(
                                                          border: Border(
                                                              right: BorderSide(
                                                                  color:
                                                                      primaryColor))),
                                                      child: Text(
                                                        chequeList[index]
                                                            .checkNumber
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.center,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize:
                                                                size.width *
                                                                    0.028),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 7),
                                                      decoration: const BoxDecoration(
                                                          border: Border(
                                                              right: BorderSide(
                                                                  color:
                                                                      primaryColor))),
                                                      child: Text(
                                                        '${chequeList[index].checkAmount.toString()} \u{20B9}',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize:
                                                                size.width *
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
                                                        chequeList.removeWhere(
                                                            (element) =>
                                                                element
                                                                    .checkNumber ==
                                                                chequeList[
                                                                        index]
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
                                              side: BorderSide(
                                                  color: Colors.black87),
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                top: Radius.circular(8),
                                              ),
                                            ),
                                            builder: (_) => SizedBox(
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 15,
                                                        top: 15,
                                                        right: 15,
                                                        bottom: MediaQuery.of(
                                                                context)
                                                            .viewInsets
                                                            .bottom),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
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
                                                                    rOnly:
                                                                        false,
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
                                                                    rOnly:
                                                                        false,
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
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
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
            )));
  }
}
