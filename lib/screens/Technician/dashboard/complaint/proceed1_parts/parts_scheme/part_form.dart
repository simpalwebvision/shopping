import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:number_to_words_english/number_to_words_english.dart';
import 'package:shopping/models/cmc_part_model.dart';
import 'package:shopping/screens/Technician/dashboard/complaint/proceed1_parts/amc_scheme/amc_gst_form.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/utils/constant.dart';
import 'package:shopping/utils/order_form_helper.dart';
import 'package:shopping/widgets/common_loader.dart';
import 'package:shopping/widgets/login_button.dart';
import 'package:shopping/widgets/signature_helper.dart';

class PartFormPage extends StatefulWidget {
  final ByteData byteList;

  final List<AddPartModel> finallist;
  const PartFormPage(
      {super.key, required this.byteList, required this.finallist});

  @override
  State<PartFormPage> createState() => _CMCFormPageState();
}

class _CMCFormPageState extends State<PartFormPage> {
  bool isLoading = false;
  String todayDate = "", totalPriceWords = '';
  double totalPrice = 0.0;
  final TextEditingController _ctlCustName = TextEditingController();
  final TextEditingController _ctlAddress = TextEditingController();
  final TextEditingController _ctlMobileNo = TextEditingController();
  final TextEditingController _ctlAltenateNo = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  SizedBox commonHeight(Size size) => SizedBox(height: size.height * 0.02);

  @override
  void initState() {
    super.initState();
    // initData();
    todayDate = CommonFunctions().getCurrentDate();

    for (var element in widget.finallist) {
      var total =
          double.parse(element.quantity!) * double.parse(element.price!);
      totalPrice += total;
      totalPriceWords = NumberToWordsEnglish.convert(totalPrice.toInt());
    }
  }

  @override
  void dispose() {
    _ctlCustName.dispose();
    _ctlAddress.dispose();
    _ctlMobileNo.dispose();
    _scrollController.dispose();
    _ctlAltenateNo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: isLoading
              ? const CommonLoaderScreen()
              : SingleChildScrollView(
                  child: Card(
                    elevation: 5,
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black45)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        children: [
                          OrderFormHead(
                            sSize: size,
                            headName: 'SHAHIL ENTERPRISES',
                          ),
                          const Divider(
                            color: Colors.black,
                          ),
                          SizedBox(height: size.height * 0.005),
                          OrderFormTitle(
                            sSize: size,
                            title: 'Parts',
                          ),
                          SizedBox(height: size.height * 0.02),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 13.0, vertical: 8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: OrderFormDetailHelper(
                                        title: 'Bill No. : ',
                                        sSize: size,
                                        detail: "1",
                                      ),
                                    ),
                                  ],
                                ),

                                commonHeight(size),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          OrderFormDetailHelper(
                                            title: 'Ex Name 1 : ',
                                            sSize: size,
                                            detail: "",
                                          ),
                                          commonHeight(size),
                                          OrderFormDetailHelper(
                                            title: 'Ex Name 2 : ',
                                            sSize: size,
                                            detail: '',
                                          ),
                                          commonHeight(size),
                                          OrderFormDetailHelper(
                                            title: 'Reference by : ',
                                            sSize: size,
                                            detail: '',
                                          ),
                                          commonHeight(size),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        OrderFormDetailHelper(
                                          title: 'St. Date : ',
                                          sSize: size,
                                          detail: todayDate,
                                        ),
                                        commonHeight(size),
                                        OrderFormDetailHelper(
                                          title: 'End Date : ',
                                          sSize: size,
                                          detail: todayDate,
                                        ),
                                        commonHeight(size),
                                        OrderFormDetailHelper(
                                          title: 'Invoice ID : ',
                                          sSize: size,
                                          detail: "1",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                // OrderFormDetailHelper(
                                //   title: 'Customer ID : ',
                                //   sSize: size,
                                //   detail: "1",
                                // ),
                                commonHeight(size),
                                OrderFormDetailTextFormHelper(
                                  ctl: _ctlCustName,
                                  title: "Customer's Name : ",
                                  sSize: size,
                                  detail: 'name',
                                ),
                                commonHeight(size),
                                OrderFormDetailTextFormHelper(
                                  ctl: _ctlAddress,
                                  title: "Address : ",
                                  sSize: size,
                                  detail: '',
                                ),
                                commonHeight(size),
                                Row(
                                  children: [
                                    Text(
                                      'Mobile No. : ',
                                      style: TextStyle(
                                        fontSize: size.width * 0.033,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Flexible(
                                      child: TextFormField(
                                        controller: _ctlMobileNo,
                                        decoration: const InputDecoration(
                                          counterText: '',
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 3.0),
                                          isDense: true,
                                        ),
                                        minLines: 1,
                                        maxLines: 1,
                                        maxLength: 10,
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.02,
                                    ),
                                    Text(
                                      'Alternate No. : ',
                                      style: TextStyle(
                                        fontSize: size.width * 0.03,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Flexible(
                                      child: TextFormField(
                                        controller: _ctlAltenateNo,
                                        decoration: const InputDecoration(
                                          counterText: '',
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 3.0),
                                          isDense: true,
                                        ),
                                        minLines: 1,
                                        maxLines: 1,
                                        maxLength: 10,
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: size.height * 0.05),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.02),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 0),
                                  decoration: BoxDecoration(
                                      color: primaryColor.withOpacity(0.1),
                                      border: Border.all(color: primaryColor)),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: size.width * 0.13,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 7, horizontal: 6),
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                right: BorderSide(
                                                    color: primaryColor))),
                                        child: Text(
                                          'Sr. No',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: size.width * 0.028,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87),
                                        ),
                                      ),
                                      Expanded(
                                          child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 7, horizontal: 5),
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                right: BorderSide(
                                                    color: primaryColor))),
                                        child: Text(
                                          'Parts Name',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: size.width * 0.028,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87),
                                        ),
                                      )),
                                      Container(
                                        width: size.width * 0.13,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 7),
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                right: BorderSide(
                                                    color: primaryColor))),
                                        child: Text(
                                          'Quantity',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: size.width * 0.028,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 7),
                                        width: size.width * 0.2,
                                        child: Text(
                                          'Amount',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: size.width * 0.028,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: widget.finallist.length,
                                    controller: _scrollController,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      int ind = index + 1;
                                      var quan = double.parse(widget
                                          .finallist[index].quantity
                                          .toString());
                                      var price = double.parse(widget
                                          .finallist[index].price
                                          .toString());

                                      var total = quan * price;

                                      return Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 0),
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                top: BorderSide(
                                                    color: Colors.black12,
                                                    width: 0.2),
                                                bottom: BorderSide(
                                                    color: Colors.black12,
                                                    width: 0.2),
                                                right: BorderSide(
                                                  color: Colors.black12,
                                                ),
                                                left: BorderSide(
                                                  color: Colors.black12,
                                                ))),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 0),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: size.width * 0.13,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 7,
                                                        horizontal: 6),
                                                decoration: const BoxDecoration(
                                                    border: Border(
                                                        right: BorderSide(
                                                            color: Colors
                                                                .black12))),
                                                child: Text(
                                                  ind.toString(),
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize:
                                                          size.width * 0.028,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black87),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 7,
                                                      horizontal: 5),
                                                  decoration: const BoxDecoration(
                                                      border: Border(
                                                          right: BorderSide(
                                                              color: Colors
                                                                  .black12))),
                                                  child: Text(
                                                    widget
                                                        .finallist[index].pname
                                                        .toString(),
                                                    textAlign: TextAlign.start,
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
                                              Container(
                                                width: size.width * 0.13,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 7),
                                                decoration: const BoxDecoration(
                                                    border: Border(
                                                        right: BorderSide(
                                                            color: Colors
                                                                .black12))),
                                                child: Text(
                                                  '${widget.finallist[index].quantity.toString()} ',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize:
                                                          size.width * 0.028),
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 7),
                                                width: size.width * 0.2,
                                                child: Text(
                                                  '$total',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize:
                                                          size.width * 0.028,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black87),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 0),
                                  decoration: BoxDecoration(
                                      color: primaryColor.withOpacity(0.1),
                                      border: Border.all(color: primaryColor)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 7, horizontal: 5),
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                right: BorderSide(
                                                    color: primaryColor))),
                                        child: Text(
                                          'In Words : $totalPriceWords',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: size.width * 0.028,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87),
                                        ),
                                      )),
                                      Container(
                                        width: size.width * 0.13,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 7),
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                right: BorderSide(
                                                    color: primaryColor))),
                                        child: Text(
                                          'Total',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: size.width * 0.028,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 7),
                                        width: size.width * 0.2,
                                        child: Text(
                                          '${totalPrice.toString()}/-',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: size.width * 0.028,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          const Divider(
                            color: Colors.black,
                          ),
                          SizedBox(height: size.height * 0.01),
                          OrderFormTitle(
                            sSize: size,
                            title: 'Terms & Conditions',
                          ),
                          SizedBox(height: size.height * 0.01),
                          const SmallTermsAndConditionWidget(
                              initialText: '1.',
                              iconColor: Colors.black,
                              text: 'Service Charge = 350/-'),
                          SizedBox(height: size.height * 0.005),
                          const SmallTermsAndConditionWidget(
                              initialText: '2.',
                              iconColor: Colors.black,
                              text:
                                  'Only three Months warranty on new spare parts.'),
                          const SmallTermsAndConditionWidget(
                              initialText: '3.',
                              iconColor: Colors.black,
                              text:
                                  'Goods once sold will not be taken back,expected manufacturer defect.'),
                          SizedBox(height: size.height * 0.01),
                          const SmallTermsAndConditionWidget(
                              initialText: '4.',
                              iconColor: Colors.black,
                              text:
                                  'Goods once order can not be cancelled & the Amt. will not be Refundable.'),
                          SizedBox(height: size.height * 0.01),
                          const BigTermsAndConditionWidget(
                              initialText: '5.',
                              iconColor: Colors.black,
                              text:
                                  'Rs. 500/- will be charge of Cheque Bouncing.'),
                          SizedBox(height: size.height * 0.01),
                          const BigTermsAndConditionWidget(
                              initialText: '6.',
                              iconColor: Colors.black,
                              text:
                                  'Cheque Payment in favour of "SHAHIL ENTERPRISES".'),
                          SizedBox(height: size.height * 0.01),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.02),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: Colors.black87,
                                  size: size.width * 0.025,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Card(
                                  color: Colors.amber,
                                  shape: const RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.black87)),
                                  elevation: 3,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.02,
                                        vertical: size.width * 0.01),
                                    child: Text(
                                      'I Have Read This Bill And Agree to the Terms & Conditions.',
                                      style: TextStyle(
                                          fontSize: size.width * 0.028,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            color: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SignatureHelperScreen(
                                  sSize: size,
                                  underTitle: "Customer's Signature",
                                  data: widget.byteList,
                                ),
                                SignatureHelperScreen(
                                  sSize: size,
                                  underTitle: 'Technician Signature',
                                  data: widget.byteList,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          const LocationHelplineWidget(),
                          SizedBox(height: size.height * 0.01),
                          Text(
                            'Thank You for your Business.',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 10,
                          ),
                          commonHeight(size),
                          AppButtonWidget(
                            onTap: () async {
                              // final pdfFile =
                              //     await TechMExchangePDF().generate(bill);
                              // // TechPdfApi.openFile(pdfFile);
                              // redirect(pdfFile);
                            },
                            btnText: 'Done',
                          )
                        ],
                      ),
                    ),
                  ),
                )),
    );
  }
}

class TermsAndConditionWidget extends StatelessWidget {
  final String text, initialText;
  final Color? iconColor;
  const TermsAndConditionWidget(
      {Key? key,
      required this.text,
      required this.iconColor,
      required this.initialText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.02, vertical: 5),
      child: Row(
        children: [
          Text(
            initialText,
          ),
          const SizedBox(
            width: 15,
          ),
          Flexible(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              maxLines: 10,
            ),
          ),
        ],
      ),
    );
  }
}
