import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/models/add_check_model.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/utils/constant.dart';
import 'package:shopping/widgets/add_remove_rate_button.dart';
import 'package:shopping/widgets/background_decoration.dart';
import 'package:shopping/widgets/common_signature_pad.dart';
import 'package:shopping/widgets/detail_widget.dart';
import 'package:shopping/widgets/dropdown_widget.dart';
import 'package:shopping/widgets/input_field_widget.dart';
import 'package:shopping/widgets/login_button.dart';

class NewOrderFormTab extends StatefulWidget {
  final BuildContext ctx;
  const NewOrderFormTab({super.key, required this.ctx});

  @override
  State<NewOrderFormTab> createState() => _NewOrderFormTabState();
}

class _NewOrderFormTabState extends State<NewOrderFormTab> {
  final TextEditingController _ctlPDateController = TextEditingController();
  final TextEditingController _ctlRDateController = TextEditingController();
  final TextEditingController _ctlInstallDateController =
      TextEditingController();
  final TextEditingController _ctlRefOrExcIDController =
      TextEditingController();
  final TextEditingController _ctlCustNameController = TextEditingController();
  final TextEditingController _ctlDOBController = TextEditingController();
  final TextEditingController _ctlAddressController = TextEditingController();
  final TextEditingController _ctlStationController = TextEditingController();

  final TextEditingController _ctlOrderDateController = TextEditingController();

  final TextEditingController _ctlPinController = TextEditingController();
  final TextEditingController _ctlStateController = TextEditingController();
  final TextEditingController _ctlContactNumController =
      TextEditingController();
  final TextEditingController _ctlEmailController = TextEditingController();

  final TextEditingController _ctlProductController = TextEditingController();
  final TextEditingController _ctlModelController = TextEditingController();
  final TextEditingController _ctlLitterController = TextEditingController();
  final TextEditingController _ctlQuantityController = TextEditingController();
  final TextEditingController _ctlPriceController = TextEditingController();
  final TextEditingController _ctlFreeAccessoriesController =
      TextEditingController();

  final TextEditingController _ctlCashAmount = TextEditingController();
  final TextEditingController _ctlOnlineAmount = TextEditingController();
  final TextEditingController _ctlChequeNo = TextEditingController();
  final TextEditingController _ctlChequeAmount = TextEditingController();
  final TextEditingController _ctlPendingReason = TextEditingController();
  final TextEditingController _ctlIdNum = TextEditingController();
  final TextEditingController _ctlDiscount = TextEditingController();
  final TextEditingController _ctlChequeDate = TextEditingController();
  final TextEditingController _ctlTotalAmount = TextEditingController();
  final TextEditingController _ctlGSTTotalAmount = TextEditingController();
  final TextEditingController _ctlDescription = TextEditingController();
  final TextEditingController _ctlTDS = TextEditingController();
  final TextEditingController _ctlAlternateContactNumController =
      TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<FormState> _formKey3 = GlobalKey();
  List<AddCheckModel> chequeList = [];
  String? selectedval = '';
  int? sliding = 0, orderTypesliding = 0;
  List remark = ['Paid', 'Pending', 'Hold', 'Cancel', 'Defaulter'];
  var bytes;
  int currentStep = 0;
  @override
  void initState() {
    super.initState();
    CommonFunctions().disableCapture();
  }

  Future<void> _navigateToSignaturePad(BuildContext context) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const CommonSignaturePad()));
    if (!mounted) return;

    setState(() {
      bytes = result;
    });
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
  void dispose() {
    super.dispose();
    _ctlPDateController.dispose();
    _ctlRDateController.dispose();
    _ctlInstallDateController.dispose();
    _ctlRefOrExcIDController.dispose();
    _ctlTotalAmount.dispose();
    _ctlDOBController.dispose();
    _ctlAddressController.dispose();
    _ctlStationController.dispose();
    _ctlGSTTotalAmount.dispose();
    _ctlPinController.dispose();
    _ctlStateController.dispose();
    _ctlTDS.dispose();
    _ctlEmailController.dispose();

    _ctlProductController.dispose();
    _ctlModelController.dispose();
    _ctlLitterController.dispose();
    _ctlQuantityController.dispose();
    _ctlPriceController.dispose();
    _ctlFreeAccessoriesController.dispose();
    _ctlDescription.dispose();

    _ctlCashAmount.dispose();
    _ctlOnlineAmount.dispose();
    _ctlChequeNo.dispose();
    _ctlChequeAmount.dispose();
    _ctlPendingReason.dispose();
    _ctlIdNum.dispose();
    _ctlCustNameController.dispose();
    _ctlAlternateContactNumController.dispose();
    _ctlDiscount.dispose();
    _scrollController.dispose();
    _ctlChequeDate.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BackgroundDecoration().boxD(),
        ),
        SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // const SizedBox(
              //   height: 20,
              // ),
              // StepperTextField(
              //   rOnly: false,
              //   controllerValue: _ctlIdNum,
              //   validateValue: 'Id No.',
              //   labelValue: 'ID No.',
              // ),
              SizedBox(
                height: size.height * 0.02,
              ),
              StepperTextField(
                rOnly: false,
                controllerValue: _ctlChequeAmount,
                inputType: TextInputType.number,
                labelValue: 'Order ID',
                validateValue: 'Enter Order ID',
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              StepperTextField(
                rOnly: false,
                controllerValue: _ctlCustNameController,
                validateValue: 'Enter Customer Name',
                labelValue: 'Customer Name',
              ),
              SizedBox(
                height: size.height * 0.02,
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
                      inputType: TextInputType.number,
                      labelValue: 'Alternate Contact Number',
                      mLength: 10,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              StepperTextField(
                rOnly: false,
                controllerValue: _ctlEmailController,
                validateValue: 'Enter Email',
                labelValue: 'Email',
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              StepperTextField(
                rOnly: false,
                controllerValue: _ctlAddressController,
                validateValue: 'Enter Address',
                labelValue: 'Address',
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              StepperTextField(
                rOnly: false,
                controllerValue: _ctlStationController,
                validateValue: 'Enter Station',
                labelValue: 'Station',
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              StepperTextField(
                rOnly: false,
                controllerValue: _ctlPinController,
                validateValue: 'Enter Pin Code',
                labelValue: 'Pin Code',
                inputType: TextInputType.number,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                'Select Order type',
                style: TextStyle(
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: double.infinity,
                child: CupertinoSlidingSegmentedControl(
                  thumbColor: primaryColor,
                  children: {
                    0: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Reference",
                        style: TextStyle(
                            fontSize: size.width * 0.033,
                            fontWeight: FontWeight.bold,
                            color: orderTypesliding == 0
                                ? Colors.white
                                : Colors.black87),
                      ),
                    ),
                    1: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Exchange",
                        style: TextStyle(
                            fontSize: size.width * 0.033,
                            fontWeight: FontWeight.bold,
                            color: orderTypesliding == 1
                                ? Colors.white
                                : Colors.black87),
                      ),
                    ),
                    2: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "New",
                        style: TextStyle(
                            fontSize: size.width * 0.033,
                            fontWeight: FontWeight.bold,
                            color: orderTypesliding == 2
                                ? Colors.white
                                : Colors.black87),
                      ),
                    ),
                  },
                  groupValue: orderTypesliding,
                  onValueChanged: (int? newValue) {
                    setState(() {
                      orderTypesliding = newValue;
                    });
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Column(
                children: [
                  if (orderTypesliding == 0)
                    Column(
                      children: [
                        StepperTextField(
                          rOnly: false,
                          controllerValue: _ctlChequeNo,
                          labelValue: 'Reference ID',
                          validateValue: 'Enter Reference ID',
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        StepperTextField(
                          rOnly: true,
                          controllerValue: _ctlOrderDateController,
                          labelValue: 'Order Date',
                          validateValue: 'Enter Order Date',
                          onTap: () async {
                            String pDate =
                                await CommonFunctions().pickDate(context);
                            if (pDate == "null") {
                              pDate = "";
                            }
                            _ctlOrderDateController.text = pDate;
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                      ],
                    )
                  else if (orderTypesliding == 1)
                    Column(
                      children: [
                        StepperTextField(
                          rOnly: true,
                          controllerValue: _ctlOrderDateController,
                          labelValue: 'Order Date',
                          validateValue: 'Enter Order Date',
                          onTap: () async {
                            String pDate =
                                await CommonFunctions().pickDate(context);
                            if (pDate == "null") {
                              pDate = "";
                            }
                            _ctlOrderDateController.text = pDate;
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                      ],
                    )
                  else if (orderTypesliding == 2)
                    Column(
                      children: [
                        StepperTextField(
                          rOnly: true,
                          controllerValue: _ctlOrderDateController,
                          labelValue: 'Order Date',
                          validateValue: 'Enter Order Date',
                          onTap: () async {
                            String pDate =
                                await CommonFunctions().pickDate(context);
                            if (pDate == "null") {
                              pDate = "";
                            }
                            _ctlOrderDateController.text = pDate;
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                      ],
                    )
                ],
              ),

              StepperTextField(
                rOnly: false,
                controllerValue: _ctlProductController,
                validateValue: 'Enter Product',
                labelValue: 'Product Name',
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              StepperTextField(
                rOnly: false,
                controllerValue: _ctlModelController,
                validateValue: 'Enter Model',
                labelValue: 'Model',
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                children: [
                  Flexible(
                    child: StepperTextField(
                      rOnly: false,
                      controllerValue: _ctlLitterController,
                      validateValue: 'Enter Litter',
                      inputType: TextInputType.number,
                      labelValue: 'Litter',
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: StepperTextField(
                      rOnly: false,
                      controllerValue: _ctlQuantityController,
                      validateValue: 'Enter Quantity',
                      inputType: TextInputType.number,
                      labelValue: 'Quantity',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                children: [
                  Flexible(
                    child: StepperTextField(
                      rOnly: false,
                      controllerValue: _ctlPriceController,
                      validateValue: 'Enter Price',
                      inputType: TextInputType.number,
                      labelValue: 'Price',
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: StepperTextField(
                      rOnly: false,
                      controllerValue: _ctlDiscount,
                      validateValue: 'Enter Discount',
                      inputType: TextInputType.number,
                      labelValue: 'Discount',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                children: [
                  Flexible(
                    child: StepperTextField(
                      rOnly: false,
                      controllerValue: _ctlTotalAmount,
                      validateValue: '',
                      inputType: TextInputType.number,
                      labelValue: 'Final Amount',
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: StepperTextField(
                      rOnly: false,
                      controllerValue: _ctlTDS,
                      validateValue: '',
                      inputType: TextInputType.number,
                      labelValue: 'TDS',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              StepperTextField(
                rOnly: false,
                controllerValue: _ctlFreeAccessoriesController,
                validateValue: 'Enter Free Accessories',
                labelValue: 'Free Accessories',
              ),

              SizedBox(
                height: size.height * 0.02,
              ),
              StepperTextField(
                rOnly: false,
                controllerValue: _ctlDescription,
                validateValue: 'Enter Description',
                labelValue: 'Description',
              ),

              SizedBox(
                height: size.height * 0.02,
              ),
              const Text(
                'Select Payment type',
                style: TextStyle(
                    fontSize: 19.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87),
              ),
              SizedBox(
                height: size.height * 0.01,
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
                            fontSize: size.width * 0.033,
                            fontWeight: FontWeight.bold,
                            color:
                                sliding == 0 ? Colors.white : Colors.black87),
                      ),
                    ),
                    1: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Online",
                        style: TextStyle(
                            fontSize: size.width * 0.033,
                            fontWeight: FontWeight.bold,
                            color:
                                sliding == 1 ? Colors.white : Colors.black87),
                      ),
                    ),
                    2: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Cheque",
                        style: TextStyle(
                            fontSize: size.width * 0.033,
                            fontWeight: FontWeight.bold,
                            color:
                                sliding == 2 ? Colors.white : Colors.black87),
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
              SizedBox(
                height: size.height * 0.01,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: BoldHedDetailInfoWidget(
                  label: 'Pending Amt :',
                  data: '1200',
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
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
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 7),
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
                                          right:
                                              BorderSide(color: primaryColor))),
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
                                        const EdgeInsets.symmetric(vertical: 7),
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
                              itemCount: chequeList.length,
                              controller: _scrollController,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 4),
                                  decoration: BoxDecoration(
                                      color: primaryColor.withOpacity(0.1),
                                      border: Border.all(color: primaryColor)),
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
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 7),
                                            decoration: const BoxDecoration(
                                                border: Border(
                                                    right: BorderSide(
                                                        color: primaryColor))),
                                            child: Text(
                                              chequeList[index]
                                                  .checkDate
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: size.width * 0.028),
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
                                              chequeList[index]
                                                  .checkNumber
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: size.width * 0.028),
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
                                              '${chequeList[index].checkAmount.toString()} \u{20B9}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: size.width * 0.028),
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
                                                      element.checkNumber ==
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
                                  context: widget.ctx,
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
                                              bottom: MediaQuery.of(widget.ctx)
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
                                                      _ctlChequeNo.clear();
                                                      _ctlChequeAmount.clear();
                                                      _ctlChequeDate.clear();
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
                                                            _ctlChequeDate
                                                                .text = pDate;
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
                                                        _formKey3.currentState!
                                                            .save();
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
              SizedBox(
                height: size.height * 0.02,
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
                    width: 10,
                  ),
                  AddRemoveRateButtons(
                    onAddButtonClick: () {},
                    onSubtractButtonClick: () {},
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                      'GST Total Amount :',
                      style: TextStyle(
                          color: darkPrimaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: size.width * 0.034),
                    ),
                  ),
                  Text(
                    '',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: size.width * 0.034),
                  )
                ],
              ),

              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Remark : ',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: size.width * 0.034),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Pending',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                        fontSize: size.width * 0.034),
                  )
                ],
              ),
              // ExpandedDropDownWidget(
              //     labelText: 'Remark',
              //     hintText: 'Select Remark',
              //     dropMenuList: remark,
              //     selectedReturnValue: (value) {
              //       setState(() => selectedval = value);
              //     }),

              SizedBox(
                height: size.height * 0.02,
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
                      height: size.height * 0.2,
                      width: size.width * 0.7,
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

              SizedBox(
                height: size.height * 0.02,
              ),
              AppButtonWidget(
                onTap: () {},
                btnText: 'Submit',
              )
            ],
          ),
        ))
      ],
    ));
  }
}
