// import 'package:aquanerio/models/cmc_part_model.dart';
// import 'package:aquanerio/screens/Technician/dashboard/complaint/scheme_bloc/scheme_bloc.dart';
// import 'package:aquanerio/screens/Technician/dashboard/complaint/scheme_bloc/scheme_event.dart';
// import 'package:aquanerio/screens/Technician/dashboard/complaint/scheme_bloc/scheme_state.dart';
// import 'package:aquanerio/utils/common_function.dart';
// import 'package:aquanerio/utils/constant.dart';
// import 'package:aquanerio/widgets/add_remove_rate_button.dart';
// import 'package:aquanerio/widgets/background_decoration.dart';
// import 'package:aquanerio/widgets/common_card_design.dart';
// import 'package:aquanerio/widgets/common_signature_pad.dart';
// import 'package:aquanerio/widgets/detail_widget.dart';
// import 'package:aquanerio/widgets/dropdown_widget.dart';
// import 'package:aquanerio/widgets/input_field_widget.dart';
// import 'package:aquanerio/widgets/login_button.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';

// class TechComplaintProceed1 extends StatefulWidget {
//   const TechComplaintProceed1({super.key});

//   @override
//   State<TechComplaintProceed1> createState() => _TechComplaintProceed1State();
// }

// class _TechComplaintProceed1State extends State<TechComplaintProceed1> {
//   int? sliding = 0;
//   List idList = ['12345', '56151', '56565', '45481', '85641'];
//   String? selectedval = '';
//   var bytes;
//   double totalAmount = 0.0, totalExternalAmount = 0.0, allTotalAmount = 0.0;

//   final TextEditingController _ctlPname = TextEditingController();
//   final TextEditingController _ctlPquantity = TextEditingController();
//   final TextEditingController _ctlCashAmount = TextEditingController();
//   final TextEditingController _ctlChequeNo = TextEditingController();
//   final TextEditingController _ctlChequeAmount = TextEditingController();
//   final TextEditingController _ctlOnlineAmount = TextEditingController();
//   final TextEditingController _ctlPendingReason = TextEditingController();
//   final TextEditingController _ctlMachineExchangeRemark =
//       TextEditingController();
//   final ScrollController _scrollController = ScrollController();
//   List<AddPartModel> list = [], externalList = [], finallist = [];
//   final TextEditingController _ctlIdNo = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     CommonFunctions().disableCapture();
//   }

//   Future<void> _navigateToSignaturePad(BuildContext context) async {
//     var result = await Navigator.push(context,
//         MaterialPageRoute(builder: (context) => const CommonSignaturePad()));
//     if (!mounted) return;

//     setState(() {
//       bytes = result;
//     });
//   }

//   @override
//   void dispose() {
//     _ctlPname.dispose();
//     _ctlPquantity.dispose();
//     _ctlCashAmount.dispose();
//     _ctlChequeNo.dispose();
//     _ctlChequeAmount.dispose();
//     _ctlPendingReason.dispose();
//     _scrollController.dispose();
//     _ctlIdNo.dispose();
//     _ctlMachineExchangeRemark.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
//       child: Scaffold(
//           appBar: PreferredSize(
//               preferredSize: const Size.fromHeight(56),
//               child: BlocBuilder<SchemeBloc, SchemeState>(
//                 builder: (context, state) {
//                   if (state is SchemeInitialState) {
//                     return AppBar(
//                       automaticallyImplyLeading: false,
//                       leading: IconButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           icon: const Icon(
//                             Icons.arrow_back_rounded,
//                           )),
//                       title: const Text('Select Schemes'),
//                     );
//                   } else if (state is SchemeMachineExchangeState) {
//                     return CommonAppBar(
//                       appTitle: 'Machine Exchange',
//                       onTap: () {
//                         setState(() {
//                           _ctlIdNo.clear();
//                           sliding = 0;
//                           selectedval = '';
//                           _ctlCashAmount.clear();
//                           _ctlOnlineAmount.clear();
//                           _ctlChequeNo.clear();
//                           _ctlChequeAmount.clear();
//                           _ctlPendingReason.clear();
//                           _ctlMachineExchangeRemark.clear();
//                           bytes = null;
//                         });
//                         BlocProvider.of<SchemeBloc>(context)
//                             .add(SchemeInitialEvent());
//                       },
//                     );
//                   } else if (state is SchemeCMCState) {
//                     return CommonAppBar(
//                       appTitle: 'CMC',
//                       onTap: () {
//                         BlocProvider.of<SchemeBloc>(context)
//                             .add(SchemeInitialEvent());
//                       },
//                     );
//                   } else if (state is SchemeAMCState) {
//                     return CommonAppBar(
//                       appTitle: 'AMC',
//                       onTap: () {
//                         BlocProvider.of<SchemeBloc>(context)
//                             .add(SchemeInitialEvent());
//                       },
//                     );
//                   } else if (state is SchemePartsState) {
//                     return CommonAppBar(
//                       appTitle: 'Parts',
//                       onTap: () {
//                         BlocProvider.of<SchemeBloc>(context)
//                             .add(SchemeInitialEvent());
//                       },
//                     );
//                   } else if (state is SchemeBounceChargeState) {
//                     return CommonAppBar(
//                       appTitle: 'Bounce Charge',
//                       onTap: () {
//                         BlocProvider.of<SchemeBloc>(context)
//                             .add(SchemeInitialEvent());
//                       },
//                     );
//                   } else if (state is SchemePendingState) {
//                     return CommonAppBar(
//                       appTitle: 'Pending',
//                       onTap: () {
//                         BlocProvider.of<SchemeBloc>(context)
//                             .add(SchemeInitialEvent());
//                       },
//                     );
//                   } else if (state is SchemeInWarrantyState) {
//                     return CommonAppBar(
//                       appTitle: 'In Warranty',
//                       onTap: () {
//                         BlocProvider.of<SchemeBloc>(context)
//                             .add(SchemeInitialEvent());
//                       },
//                     );
//                   } else if (state is SchemeDescriptionState) {
//                     return CommonAppBar(
//                       appTitle: 'Description',
//                       onTap: () {
//                         BlocProvider.of<SchemeBloc>(context)
//                             .add(SchemeInitialEvent());
//                       },
//                     );
//                   } else {
//                     return const Text('Loading');
//                   }
//                 },
//               )),
//           body: Stack(
//             children: [
//               Container(
//                 decoration: BackgroundDecoration().boxD(),
//               ),
//               BlocBuilder<SchemeBloc, SchemeState>(builder: (context, state) {
//                 if (state is SchemeInitialState) {
//                   return _buildInitialWidget();
//                 } else if (state is SchemeMachineExchangeState) {
//                   return _buildMachineExchangeWidget(size);
//                 } else if (state is SchemeCMCState) {
//                   return _buildCMCWidget(size);
//                 } else if (state is SchemeAMCState) {
//                   return const Text('AMC');
//                 } else if (state is SchemePartsState) {
//                   return const Text('Parts');
//                 } else if (state is SchemeBounceChargeState) {
//                   return const Text('Bounce Charge');
//                 } else if (state is SchemePendingState) {
//                   return const Text('Pending');
//                 } else if (state is SchemeInWarrantyState) {
//                   return const Text('In Warranty');
//                 } else if (state is SchemeDescriptionState) {
//                   return const Text('Description');
//                 } else {
//                   return const Text('Loading');
//                 }
//               })
//             ],
//           )),
//     );
//   }

//   Widget _buildInitialWidget() {
//     return SingleChildScrollView(
//         child: Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
//       child: Column(
//         children: [
//           SchemeListTile(
//             titleString: 'Machine Exchange',
//             onClicked: () {
//               BlocProvider.of<SchemeBloc>(context)
//                   .add(SchemeMachineExchangeEvent());
//             },
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           SchemeListTile(
//             titleString: 'CMC',
//             onClicked: () {
//               BlocProvider.of<SchemeBloc>(context).add(SchemeCMCEvent());
//             },
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           SchemeListTile(
//             titleString: 'AMC',
//             onClicked: () {
//               BlocProvider.of<SchemeBloc>(context).add(SchemeAMCEvent());
//             },
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           SchemeListTile(
//             titleString: 'Parts',
//             onClicked: () {
//               BlocProvider.of<SchemeBloc>(context).add(SchemePartsEvent());
//             },
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           SchemeListTile(
//             titleString: 'Bounce Charge',
//             onClicked: () {
//               BlocProvider.of<SchemeBloc>(context)
//                   .add(SchemeBounceChargeEvent());
//             },
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           SchemeListTile(
//             titleString: 'Pending',
//             onClicked: () {
//               BlocProvider.of<SchemeBloc>(context).add(SchemePendingEvent());
//             },
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           SchemeListTile(
//             titleString: 'In Warranty',
//             onClicked: () {
//               BlocProvider.of<SchemeBloc>(context).add(SchemeInWarrantyEvent());
//             },
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           SchemeListTile(
//             titleString: 'Description',
//             onClicked: () {
//               BlocProvider.of<SchemeBloc>(context)
//                   .add(SchemeDescriptionEvent());
//             },
//           ),
//         ],
//       ),
//     ));
//   }

//   Widget _buildMachineExchangeWidget(Size size) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
//         child: Column(
//           children: [
//             TypeAheadFormField(
//               suggestionsCallback: (pattern) => idList.where(
//                 (item) => item.toUpperCase().contains(pattern.toUpperCase()),
//               ),
//               itemBuilder: (_, item) => ListTile(title: Text(item.toString())),
//               onSuggestionSelected: (val) async {
//                 _ctlIdNo.text = val.toString();
//               },
//               getImmediateSuggestions: true,
//               hideSuggestionsOnKeyboardHide: true,
//               hideOnEmpty: false,
//               noItemsFoundBuilder: (context) => const Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Text('No Customer Id found..'),
//               ),
//               textFieldConfiguration: TextFieldConfiguration(
//                 decoration: InputDecoration(
//                     filled: true,
//                     labelText: 'Customer id',
//                     hintText: 'Select Customer id. ',
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: const BorderSide(color: borderColor),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: const BorderSide(color: borderColor)),
//                     focusedErrorBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: const BorderSide(color: borderColor)),
//                     errorBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: const BorderSide(color: Colors.red)),
//                     labelStyle: const TextStyle(color: Colors.black87)),
//                 controller: _ctlIdNo,
//               ),
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'Please select Customer Id ';
//                 } else {
//                   return null;
//                 }
//               },
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             CommonCardDesign(
//               listOfWidget: [
//                 Row(
//                   children: const [
//                     DetailWidget(
//                       label: 'ID No.',
//                       data: '123456',
//                     ),
//                     Spacer(),
//                     DetailWidget(
//                       label: 'Office Ex.',
//                       data: '',
//                     )
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 const DetailInfoWidget(
//                   label: 'Product',
//                   data: '',
//                 ),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 const DetailInfoWidget(
//                   label: 'Product Model',
//                   data: '',
//                 ),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 Row(
//                   children: const [
//                     DetailWidget(
//                       label: 'Quantity',
//                       data: '',
//                     ),
//                     Spacer(),
//                     DetailWidget(
//                       label: 'Litters',
//                       data: '',
//                     )
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 const DetailInfoWidget(
//                   label: 'Company Price',
//                   data: '',
//                 ),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 const DetailInfoWidget(
//                   label: 'Free Accessories',
//                   data: '',
//                 ),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 const DetailInfoWidget(
//                   label: 'Description',
//                   data: '',
//                 ),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 Row(
//                   children: const [
//                     DetailWidget(
//                       label: 'Old Machine Disc.',
//                       data: '',
//                     ),
//                     Spacer(),
//                     DetailWidget(
//                       label: 'Discount',
//                       data: '',
//                     )
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 const DetailInfoWidget(
//                   label: 'Purchase amount ',
//                   data: '',
//                 ),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 const DetailInfoWidget(
//                   label: 'Product Price ',
//                   data: '',
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 const Divider(
//                   color: Colors.black,
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 Row(
//                   children: [
//                     Flexible(
//                       child: DropDownWidget(
//                           labelText: 'Gst Rate',
//                           hintText: 'Select Gst Rate',
//                           dropMenuList: CommonFunctions.gstRates,
//                           selectedReturnValue: (value) {
//                             setState(() => selectedval = value);
//                           }),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     AddRemoveRateButtons(
//                       onAddButtonClick: () {},
//                       onSubtractButtonClick: () {},
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 25,
//                 ),
//                 Container(
//                   width: size.width,
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       color: primaryColor.withOpacity(0.1),
//                       border: Border.all(color: Colors.black54)),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Text(
//                             'GST Amount',
//                             style: TextStyle(
//                                 fontSize: size.width * 0.034,
//                                 color: Colors.black87,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           const Spacer(),
//                           Text('100',
//                               style: TextStyle(
//                                   fontSize: size.width * 0.034,
//                                   color: Colors.black87,
//                                   fontWeight: FontWeight.bold)),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             'Net Amount',
//                             style: TextStyle(
//                                 fontSize: size.width * 0.034,
//                                 color: Colors.black87,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           const Spacer(),
//                           Text('+',
//                               style: TextStyle(
//                                   fontSize: size.width * 0.034,
//                                   color: Colors.black87,
//                                   fontWeight: FontWeight.bold)),
//                           SizedBox(
//                             width: size.width * 0.1,
//                           ),
//                           Text('100',
//                               style: TextStyle(
//                                   fontSize: size.width * 0.034,
//                                   color: Colors.black87,
//                                   fontWeight: FontWeight.bold)),
//                         ],
//                       ),
//                       const Divider(
//                         color: Colors.black,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             'Total Amount',
//                             style: TextStyle(
//                                 fontSize: size.width * 0.034,
//                                 color: Colors.green,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           const Spacer(),
//                           Text('200',
//                               style: TextStyle(
//                                   fontSize: size.width * 0.034,
//                                   color: Colors.green,
//                                   fontWeight: FontWeight.bold)),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 const Divider(
//                   color: Colors.black,
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 SizedBox(
//                   width: double.infinity,
//                   child: CupertinoSlidingSegmentedControl(
//                     thumbColor: primaryColor,
//                     children: {
//                       0: Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 10),
//                         child: Text(
//                           "Cash",
//                           style: TextStyle(
//                               fontSize: 15.0,
//                               fontWeight: FontWeight.bold,
//                               color:
//                                   sliding == 0 ? Colors.white : Colors.black87),
//                         ),
//                       ),
//                       1: Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 10),
//                         child: Text(
//                           "Online",
//                           style: TextStyle(
//                               fontSize: 15.0,
//                               fontWeight: FontWeight.bold,
//                               color:
//                                   sliding == 1 ? Colors.white : Colors.black87),
//                         ),
//                       ),
//                       2: Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 10),
//                         child: Text(
//                           "Cheque",
//                           style: TextStyle(
//                               fontSize: 15.0,
//                               fontWeight: FontWeight.bold,
//                               color:
//                                   sliding == 2 ? Colors.white : Colors.black87),
//                         ),
//                       ),
//                       3: Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 10),
//                         child: Text(
//                           "Pending",
//                           style: TextStyle(
//                               fontSize: 15.0,
//                               fontWeight: FontWeight.bold,
//                               color:
//                                   sliding == 3 ? Colors.white : Colors.black87),
//                         ),
//                       )
//                     },
//                     groupValue: sliding,
//                     onValueChanged: (int? newValue) {
//                       CommonFunctions.hideKeyboard(context);
//                       setState(() {
//                         sliding = newValue;
//                       });
//                     },
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 if (sliding == 0)
//                   StepperTextField(
//                     rOnly: false,
//                     controllerValue: _ctlCashAmount,
//                     labelValue: 'Cash Amount',
//                     validateValue: 'Enter Amount',
//                   )
//                 else if (sliding == 1)
//                   StepperTextField(
//                     rOnly: false,
//                     controllerValue: _ctlOnlineAmount,
//                     labelValue: 'Online Amount',
//                     validateValue: 'Enter Amount',
//                   )
//                 else if (sliding == 2)
//                   Column(
//                     children: [
//                       StepperTextField(
//                         rOnly: false,
//                         controllerValue: _ctlChequeNo,
//                         labelValue: 'Cheque Number',
//                         validateValue: 'Enter Cheque Number',
//                       ),
//                       const SizedBox(
//                         height: 8,
//                       ),
//                       StepperTextField(
//                         rOnly: false,
//                         controllerValue: _ctlChequeAmount,
//                         labelValue: 'Cheque',
//                         validateValue: 'Enter Cheque Amount',
//                       )
//                     ],
//                   )
//                 else if (sliding == 3)
//                   StepperTextField(
//                     rOnly: false,
//                     controllerValue: _ctlPendingReason,
//                     labelValue: 'Reason',
//                     validateValue: 'Enter Pending Reason',
//                   ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 const Divider(
//                   color: Colors.black,
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 StepperTextField(
//                   rOnly: false,
//                   controllerValue: _ctlMachineExchangeRemark,
//                   labelValue: 'Remark',
//                   validateValue: 'Enter Remark',
//                 )
//               ],
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Card(
//               margin: EdgeInsets.zero,
//               elevation: 5,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   side: const BorderSide(color: Colors.grey)),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         _navigateToSignaturePad(context);
//                       },
//                       child: Container(
//                         height: size.height * 0.3,
//                         width: size.width,
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                             border: Border.all(color: Colors.grey)),
//                         child: bytes == null
//                             ? Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Icon(
//                                     Icons.add,
//                                     color: Colors.blue.shade900,
//                                     size: 18,
//                                   ),
//                                   const SizedBox(
//                                     width: 10,
//                                   ),
//                                   Text(
//                                     'Add Signature',
//                                     style: TextStyle(
//                                         color: Colors.blue.shade900,
//                                         letterSpacing: 1,
//                                         fontSize: size.width * 0.035),
//                                   ),
//                                 ],
//                               )
//                             : Image.memory(bytes!.buffer.asUint8List()),
//                       ),
//                     )
//                     // Row(
//                     //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     //   children: [
//                     //     TextButton(
//                     //       onPressed: _handleSaveButtonPressed,
//                     //       child: const Text(
//                     //         'To Image',
//                     //         style: TextStyle(color: primaryColor),
//                     //       ),
//                     //     ),
//                     //     TextButton(
//                     //       onPressed: _handleClearButtonPressed,
//                     //       child: const Text('Clear',
//                     //           style: TextStyle(color: primaryColor)),
//                     //     )
//                     //   ],
//                     // )
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             AppButtonWidget(
//               onTap: () {},
//               btnText: 'Submit',
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildCMCWidget(Size size) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
//         child: Column(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                   color: darkPrimaryColor.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(5),
//                   border: Border.all(color: Colors.black54)),
//               padding: const EdgeInsets.all(8),
//               child: Column(
//                 children: [
//                   ListView.builder(
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemCount: list.length,
//                       controller: _scrollController,
//                       shrinkWrap: true,
//                       itemBuilder: (context, index) {
//                         var quan =
//                             double.parse(list[index].quantity.toString());
//                         var price = double.parse(list[index].price.toString());
//                         var total = quan * price;

//                         return Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 6.0),
//                           child: Row(
//                             children: [
//                               Text(
//                                 '${index + 1})   ${list[index].pname.toString()}',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: size.width * 0.034),
//                               ),
//                               const Spacer(),
//                               Text(
//                                 '${list[index].price.toString()}  x  ${list[index].quantity.toString()}',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: size.width * 0.034),
//                               ),
//                               const SizedBox(
//                                 width: 15,
//                               ),
//                               Text(
//                                 '=',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: size.width * 0.034),
//                               ),
//                               const SizedBox(
//                                 width: 15,
//                               ),
//                               Text(
//                                 total.toString(),
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: size.width * 0.034),
//                               ),
//                               const SizedBox(
//                                 width: 15,
//                               ),
//                               InkWell(
//                                 onTap: () {
//                                   list.removeWhere((element) =>
//                                       element.pname == list[index].pname);
//                                   totalAmount = 0.0;
//                                   for (var val in list) {
//                                     var parTotal = double.parse(val.price!) *
//                                         double.parse(val.quantity!);
//                                     totalAmount += parTotal;
//                                   }
//                                   setState(() {});
//                                 },
//                                 child: const Icon(
//                                   Icons.cancel_presentation_outlined,
//                                   color: Colors.red,
//                                 ),
//                               )
//                             ],
//                           ),
//                         );
//                       }),
//                   const SizedBox(
//                     height: 7,
//                   ),
//                   Container(
//                     height: 1.5,
//                     color: Colors.black54,
//                   ),
//                   const SizedBox(
//                     height: 7,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Text(
//                         'Total  :',
//                         style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: size.width * 0.034),
//                       ),
//                       const SizedBox(
//                         width: 15,
//                       ),
//                       Text(
//                         totalAmount.toString(),
//                         style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: size.width * 0.034),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 showModalBottomSheet(
//                     context: context,
//                     isScrollControlled: true,
//                     shape: const RoundedRectangleBorder(
//                       borderRadius: BorderRadius.vertical(
//                         top: Radius.circular(0),
//                       ),
//                     ),
//                     builder: (_) => SizedBox(
//                           height: size.height * 0.3,
//                           child: Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 StepperTextField(
//                                   rOnly: false,
//                                   controllerValue: _ctlPname,
//                                   labelValue: 'Part Name',
//                                   validateValue: 'Enter Part Name',
//                                 ),
//                                 const SizedBox(
//                                   height: 20,
//                                 ),
//                                 StepperTextField(
//                                   rOnly: false,
//                                   controllerValue: _ctlPquantity,
//                                   labelValue: 'Part Quantity',
//                                   validateValue: 'Enter Part Quantity',
//                                 ),
//                                 const Spacer(),
//                                 AppButtonWidget(
//                                     onTap: () {
//                                       list.add(AddPartModel(
//                                           pname: _ctlPname.text,
//                                           price: '100',
//                                           quantity: _ctlPquantity.text));
//                                       totalAmount = 0.0;
//                                       for (var val in list) {
//                                         var parTotal =
//                                             double.parse(val.price!) *
//                                                 double.parse(val.quantity!);
//                                         totalAmount += parTotal;
//                                       }
//                                       setState(() {});
//                                       Navigator.pop(context);
//                                     },
//                                     btnText: 'Add Part')
//                               ],
//                             ),
//                           ),
//                         ));
//               },
//               child: Text(
//                 'Add Parts',
//                 style: TextStyle(
//                     color: primaryColor, fontSize: size.width * 0.033),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                   color: darkPrimaryColor.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(5),
//                   border: Border.all(color: Colors.black54)),
//               padding: const EdgeInsets.all(8),
//               child: Column(
//                 children: [
//                   ListView.builder(
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemCount: externalList.length,
//                       controller: _scrollController,
//                       shrinkWrap: true,
//                       itemBuilder: (context, index) {
//                         var quan = double.parse(
//                             externalList[index].quantity.toString());
//                         var price =
//                             double.parse(externalList[index].price.toString());
//                         var total = quan * price;

//                         return Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 6.0),
//                           child: Row(
//                             children: [
//                               Text(
//                                 '${index + 1})   ${externalList[index].pname.toString()}',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: size.width * 0.034),
//                               ),
//                               const Spacer(),
//                               Text(
//                                 '${externalList[index].price.toString()}  x  ${externalList[index].quantity.toString()}',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: size.width * 0.034),
//                               ),
//                               const SizedBox(
//                                 width: 15,
//                               ),
//                               Text(
//                                 '=',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: size.width * 0.034),
//                               ),
//                               const SizedBox(
//                                 width: 15,
//                               ),
//                               const SizedBox(
//                                 width: 15,
//                               ),
//                               Text(
//                                 totalExternalAmount.toString(),
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: size.width * 0.034),
//                               ),
//                               const SizedBox(
//                                 width: 15,
//                               ),
//                               InkWell(
//                                 onTap: () {
//                                   externalList.removeWhere((element) =>
//                                       element.pname ==
//                                       externalList[index].pname);
//                                   totalExternalAmount = 0.0;
//                                   for (var val in externalList) {
//                                     var parTotal = double.parse(val.price!) *
//                                         double.parse(val.quantity!);
//                                     totalExternalAmount += parTotal;
//                                   }
//                                   setState(() {});
//                                 },
//                                 child: const Icon(
//                                   Icons.cancel_presentation_outlined,
//                                   color: Colors.red,
//                                 ),
//                               )
//                             ],
//                           ),
//                         );
//                       }),
//                   const SizedBox(
//                     height: 7,
//                   ),
//                   Container(
//                     height: 1.5,
//                     color: Colors.black54,
//                   ),
//                   const SizedBox(
//                     height: 7,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Text(
//                         'Total  :',
//                         style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: size.width * 0.034),
//                       ),
//                       const SizedBox(
//                         width: 15,
//                       ),
//                       Text(
//                         totalExternalAmount.toString(),
//                         style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: size.width * 0.034),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 showModalBottomSheet(
//                     context: context,
//                     isScrollControlled: true,
//                     shape: const RoundedRectangleBorder(
//                       borderRadius: BorderRadius.vertical(
//                         top: Radius.circular(0),
//                       ),
//                     ),
//                     builder: (_) => SizedBox(
//                           height: size.height * 0.3,
//                           child: Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 StepperTextField(
//                                   rOnly: false,
//                                   controllerValue: _ctlPname,
//                                   labelValue: 'Part Name',
//                                   validateValue: 'Enter Part Name',
//                                 ),
//                                 const SizedBox(
//                                   height: 20,
//                                 ),
//                                 StepperTextField(
//                                   rOnly: false,
//                                   controllerValue: _ctlPquantity,
//                                   labelValue: 'Part Quantity',
//                                   validateValue: 'Enter Part Quantity',
//                                 ),
//                                 const Spacer(),
//                                 AppButtonWidget(
//                                     onTap: () {
//                                       externalList.add(AddPartModel(
//                                           pname: _ctlPname.text,
//                                           price: '100',
//                                           quantity: _ctlPquantity.text));
//                                       totalExternalAmount = 0.0;
//                                       for (var val in externalList) {
//                                         var parTotal =
//                                             double.parse(val.price!) *
//                                                 double.parse(val.quantity!);
//                                         totalExternalAmount += parTotal;
//                                       }
//                                       setState(() {});
//                                       Navigator.pop(context);
//                                     },
//                                     btnText: 'Add Part')
//                               ],
//                             ),
//                           ),
//                         ));
//               },
//               child: Text(
//                 'Add External Parts',
//                 style: TextStyle(
//                     color: primaryColor, fontSize: size.width * 0.033),
//               ),
//             ),
//             AppButtonWidget(
//                 onTap: () {
//                   finallist = [...list, ...externalList];
//                   setState(() {
//                     for (var val in finallist) {
//                       var parTotal = double.parse(val.price!) *
//                           double.parse(val.quantity!);
//                       allTotalAmount += parTotal;
//                     }
//                   });
//                   // If you want to merge two lists and remove duplicates could do:
//                   // var newList = [...list1, ...list2].toSet().toList();
//                 },
//                 btnText: 'Done'),
//             const SizedBox(
//               height: 20,
//             ),
//             ListView.builder(
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: finallist.length,
//                 controller: _scrollController,
//                 shrinkWrap: true,
//                 itemBuilder: (context, index) {
//                   var quan = double.parse(finallist[index].quantity.toString());
//                   var price = double.parse(finallist[index].price.toString());
//                   var total = quan * price;

//                   return Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 6.0),
//                     child: Row(
//                       children: [
//                         Text(
//                           '${index + 1})   ${finallist[index].pname.toString()}',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w500,
//                               fontSize: size.width * 0.034),
//                         ),
//                         const Spacer(),
//                         Text(
//                           '${finallist[index].price.toString()}  x  ${finallist[index].quantity.toString()}',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w500,
//                               fontSize: size.width * 0.034),
//                         ),
//                         const SizedBox(
//                           width: 15,
//                         ),
//                         Text(
//                           '=',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w500,
//                               fontSize: size.width * 0.034),
//                         ),

//                         const SizedBox(
//                           width: 15,
//                         ),
//                         Text(
//                           allTotalAmount.toString(),
//                           style: TextStyle(
//                               fontWeight: FontWeight.w500,
//                               fontSize: size.width * 0.034),
//                         ),
//                         const SizedBox(
//                           width: 15,
//                         ),
//                         // InkWell(
//                         //   onTap: () {
//                         //     externalList.removeWhere((element) =>
//                         //         element.pname == externalList[index].pname);
//                         //     totalExternalAmount = 0.0;
//                         //     for (var val in externalList) {
//                         //       var parTotal = double.parse(val.price!) *
//                         //           double.parse(val.quantity!);
//                         //       totalExternalAmount += parTotal;
//                         //     }
//                         //     setState(() {});
//                         //   },
//                         //   child: const Icon(
//                         //     Icons.cancel_presentation_outlined,
//                         //     color: Colors.red,
//                         //   ),
//                         // )
//                       ],
//                     ),
//                   );
//                 }),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CommonAppBar extends StatelessWidget {
//   final String appTitle;
//   final VoidCallback onTap;
//   const CommonAppBar({super.key, required this.appTitle, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       automaticallyImplyLeading: false,
//       leading: IconButton(
//           // onPressed: () {
//           //   BlocProvider.of<SchemeBloc>(context).add(SchemeInitialEvent());
//           // },
//           onPressed: onTap,
//           icon: const Icon(
//             Icons.arrow_back_rounded,
//           )),
//       title: Text(appTitle),
//     );
//   }
// }

// class SchemeListTile extends StatelessWidget {
//   final String titleString;
//   final VoidCallback onClicked;
//   const SchemeListTile(
//       {super.key, required this.titleString, required this.onClicked});

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       tileColor: primaryColor,
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//           side: const BorderSide(color: Colors.black, width: 2)),
//       onTap: onClicked,
//       title: Text(
//         titleString,
//         style: const TextStyle(letterSpacing: 1),
//       ),
//       trailing: const Icon(
//         Icons.arrow_forward_ios_rounded,
//         color: Colors.black,
//         size: 12,
//       ),
//     );
//   }
// }


// // itemData[index].ShouldVisible?
// //                              Center(
// //                                  child: Container(
// //                                    height: 30,
// //                                    width: 70,
// //                                    decoration: BoxDecoration(
// //                                        borderRadius: BorderRadius.circular(4),
// //                                        border: Border.all(color: Colors.white70)
// //                                    ),
// //                                    child: Row(
// //                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                                      children: <Widget>[
// //                                        InkWell(
// //                                        onTap: (){
// //                                         setState(() {
// //                                           if(itemData[index].Counter <2)
// //                                             {
// //                                               itemData[index].ShouldVisible = !itemData[index].ShouldVisible;
// //                                             }else{
// //                                            itemData[index].Counter--;
// //                                           }

// //                                         });
// //                                        }
// //                                        ,child: Icon(Icons.remove,color: Colors.green,size: 18,)),
// //                                        Text('${itemData[index].Counter}',style: TextStyle(
// //                                          color: Colors.white70
// //                                        ),
// //                                        ),
// //                                        InkWell(
// //                                        onTap: (){
// //                                          setState(() {
// //                                            itemData[index].Counter++;
// //                                          });
// //                                        }
// //                                        ,child: Icon(Icons.add,color: Colors.green,size: 18,)),

// //                                      ],
// //                                    ),

// //                                  )
// //                              ) : Center(
// //                                 child: Container(
// //                                   padding: EdgeInsets.all(5),
// //                                   height: 30,
// //                                   width: 70,
// //                                   decoration: BoxDecoration(
// //                                   borderRadius: BorderRadius.circular(4),
// //                                     border: Border.all(color: Colors.white70)
// //                                   ),
// //                                   child: Row(
// //                                     crossAxisAlignment: CrossAxisAlignment.center,
// //                                     mainAxisAlignment: MainAxisAlignment.center,
// //                                     children: <Widget>[
// //                                       Text('ADD',style: TextStyle(color: Colors.white70),
// //                                       ),
// //                                       InkWell(
// //                                         onTap: (){

// //                                           setState(() {
// //                                             itemData[index].ShouldVisible = ! itemData[index].ShouldVisible;
// // //                                          

// //                                           });
// //                                         }
// //                                           ,child: Center(child: Icon(Icons.add,color: Colors.green,size: 18,)))

// //                                     ],
// //                                   ),

// //                                 ),
// //                               )