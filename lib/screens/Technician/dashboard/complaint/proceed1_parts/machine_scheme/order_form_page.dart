import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shopping/models/tech_m_exchange_model.dart';
import 'package:shopping/screens/Technician/dashboard/complaint/proceed1_parts/machine_scheme/tech_m_exchange_pdf.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/utils/generate_pdf/pdf_viewer.dart';
import 'package:shopping/utils/order_form_helper.dart';
import 'package:shopping/widgets/common_loader.dart';
import 'package:shopping/widgets/login_button.dart';
import 'package:shopping/widgets/signature_helper.dart';

class MachineOrderFormScreen extends StatefulWidget {
  final ByteData byteList;
  const MachineOrderFormScreen({super.key, required this.byteList});

  @override
  State<MachineOrderFormScreen> createState() => _MachineOrderFormScreenState();
}

class _MachineOrderFormScreenState extends State<MachineOrderFormScreen> {
  String todayDate = "";
  bool isLoading = false;
  TechMachineExchangeModel? bill;

  final TextEditingController _ctlCustName = TextEditingController();
  final TextEditingController _ctlAddress = TextEditingController();
  final TextEditingController _ctlEmailId = TextEditingController();
  final TextEditingController _ctlMobileNo = TextEditingController();
  final TextEditingController _ctlAlternateNo = TextEditingController();

  final TextEditingController _ctlFreeAccessories = TextEditingController();
  final TextEditingController _ctlCashDetail = TextEditingController();
  final TextEditingController _ctlChequeDetail = TextEditingController();
  final TextEditingController _ctlDeliveryDate = TextEditingController();
  final TextEditingController _ctlOnlineDetail = TextEditingController();

  @override
  void initState() {
    super.initState();
    // initData();
    todayDate = CommonFunctions().getCurrentDate();
  }

  void redirect(final pdfFile) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => PFDViewerPage(file: pdfFile)));
  }

  @override
  void dispose() {
    _ctlCustName.dispose();
    _ctlAddress.dispose();
    _ctlEmailId.dispose();
    _ctlMobileNo.dispose();
    _ctlAlternateNo.dispose();
    _ctlFreeAccessories.dispose();
    _ctlCashDetail.dispose();
    _ctlChequeDetail.dispose();
    _ctlDeliveryDate.dispose();
    _ctlOnlineDetail.dispose();
    super.dispose();
  }

  SizedBox commonHeight(Size size) => SizedBox(height: size.height * 0.02);

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
                    // color: Colors.amber[100],
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
                            title: 'ORDER FORM',
                          ),
                          SizedBox(height: size.height * 0.005),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 13.0, vertical: 8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    OrderFormDetailHelper(
                                      title: 'Order ID : ',
                                      sSize: size,
                                      detail: "1",
                                    ),
                                    OrderFormDetailHelper(
                                      title: 'Date : ',
                                      sSize: size,
                                      detail: todayDate,
                                    ),
                                  ],
                                ),
                                commonHeight(size),
                                OrderFormDetailHelper(
                                  title: 'Exchange ID : ',
                                  sSize: size,
                                  detail: '1',
                                ),
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
                                OrderFormDetailTextFormHelper(
                                  ctl: _ctlEmailId,
                                  title: "Email ID : ",
                                  sSize: size,
                                  detail: '',
                                ),
                                commonHeight(size),
                                Row(
                                    // mainAxisAlignment: MainAxisAlignment.center,
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
                                      )),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Alternate No. : ',
                                        style: TextStyle(
                                          fontSize: size.width * 0.033,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Flexible(
                                          child: TextFormField(
                                        controller: _ctlAlternateNo,
                                        maxLength: 10,
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                          counterText: '',
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 3.0),
                                          isDense: true,
                                        ),
                                        minLines: 1,
                                        maxLines: 1,
                                      ))
                                    ]),
                                commonHeight(size),
                                const Divider(
                                  color: Colors.black,
                                ),
                                SizedBox(height: size.height * 0.005),
                                OrderFormTitle(
                                  sSize: size,
                                  title: 'Details of Order Book',
                                ),
                                commonHeight(size),
                                OrderFormDetailHelper(
                                  title: 'Product : ',
                                  sSize: size,
                                  detail: '',
                                ),
                                commonHeight(size),
                                OrderFormDetailHelper(
                                  title: 'Product Model : ',
                                  sSize: size,
                                  detail: '',
                                ),
                                commonHeight(size),
                                OrderFormDetailHelper(
                                  title: 'Quantity : ',
                                  sSize: size,
                                  detail: '',
                                ),
                                commonHeight(size),
                                OrderFormDetailHelper(
                                  title: 'Littres : ',
                                  sSize: size,
                                  detail: '',
                                ),
                                commonHeight(size),
                                OrderFormDetailHelper(
                                  title: 'TDS : ',
                                  sSize: size,
                                  detail: '',
                                ),
                                commonHeight(size),
                                OrderFormDetailHelper(
                                  title: 'Price : ',
                                  sSize: size,
                                  detail: '',
                                ),
                                commonHeight(size),
                                OrderFormDetailHelper(
                                  title: 'Advance : ',
                                  sSize: size,
                                  detail: '',
                                ),
                                commonHeight(size),
                                OrderFormDetailHelper(
                                  title: 'Balance : ',
                                  sSize: size,
                                  detail: '',
                                ),
                                commonHeight(size),
                                OrderFormDetailTextFormHelper(
                                  ctl: _ctlFreeAccessories,
                                  title: "Free Accessories : ",
                                  sSize: size,
                                  detail: '',
                                ),
                                commonHeight(size),
                                OrderFormDetailTextFormHelper(
                                  ctl: _ctlCashDetail,
                                  title: "Cash Detail : ",
                                  sSize: size,
                                  detail: '',
                                ),
                                commonHeight(size),
                                OrderFormDetailTextFormHelper(
                                  ctl: _ctlOnlineDetail,
                                  title: "Online Detail : ",
                                  sSize: size,
                                  detail: '',
                                ),
                                commonHeight(size),
                                OrderFormDetailTextFormHelper(
                                  ctl: _ctlChequeDetail,
                                  title: "Cheque Detail : ",
                                  sSize: size,
                                  detail: '',
                                ),
                                commonHeight(size),
                                OrderFormDetailTextFormHelper(
                                  rOnly: true,
                                  ctl: _ctlDeliveryDate,
                                  title: "Date of Delivery : ",
                                  sSize: size,
                                  detail: '',
                                  onTap: () async {
                                    String pDate = await CommonFunctions()
                                        .pickDate(context);
                                    if (pDate == "null") {
                                      pDate = "";
                                    }
                                    _ctlDeliveryDate.text = pDate;
                                  },
                                ),
                                SizedBox(height: size.height * 0.05),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'For SHAHIL ENTERPRISES',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * 0.035,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SignatureHelperScreen(
                                      sSize: size,
                                      underTitle: "Customer's Signature",
                                      data: widget.byteList,
                                    ),
                                    SignatureHelperScreen(
                                      sSize: size,
                                      underTitle:
                                          'Signature of \n Sales Executive',
                                      data: widget.byteList,
                                    ),
                                  ],
                                ),
                                commonHeight(size),
                                OrderFormFooter(
                                  sSize: size,
                                  data: widget.byteList,
                                )
                              ],
                            ),
                          ),
                          commonHeight(size),
                          AppButtonWidget(
                            onTap: () async {
                              final pdfFile =
                                  await TechMExchangePDF().generate(bill);
                              // TechPdfApi.openFile(pdfFile);
                              redirect(pdfFile);
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
