import 'package:flutter/material.dart';
import 'package:shopping/models/cmc_part_model.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/widgets/app_button.dart';
import 'package:shopping/widgets/input_field_widget.dart';
import 'package:shopping/widgets/login_button.dart';

class TechReqSparePartScreen extends StatefulWidget {
  final BuildContext baseContext;
  const TechReqSparePartScreen({super.key, required this.baseContext});

  @override
  State<TechReqSparePartScreen> createState() => _TechReqSparePartScreenState();
}

class _TechReqSparePartScreenState extends State<TechReqSparePartScreen> {
  List<AddPartModel> selectedPartList = [];

  final TextEditingController _modalSparePartController =
      TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _ctlPname = TextEditingController();
  final TextEditingController _ctlPquantity = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    CommonFunctions().disableCapture();
  }

  void addPartsFunction(
      {required bool fromAddParts,
      required String partName,
      required String partPrice,
      required String partQuantity}) {
    selectedPartList.add(AddPartModel(
        pname: partName,
        price: partPrice,
        quantity: partQuantity,
        fromAddPARTS: fromAddParts));

    _ctlPname.clear();
    _ctlPquantity.clear();
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _modalSparePartController.dispose();
    _ctlPname.dispose();
    _ctlPquantity.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            selectedPartList.isEmpty
                ? Container()
                : Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.black54),
                        borderRadius: BorderRadius.circular(8)),
                    margin: EdgeInsets.zero,
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        width: size.width,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Part Name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * 0.034),
                                ),
                                Expanded(child: Container()),
                                Text(
                                  'Ouantity',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * 0.034),
                                ),
                              ],
                            ),
                            const Divider(
                              color: Colors.black,
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: selectedPartList.length,
                                itemBuilder: (context, index) {
                                  if (selectedPartList.isEmpty) {
                                    return const SizedBox();
                                  } else {
                                    return Row(
                                      children: [
                                        Text(selectedPartList[index].pname ??
                                            ''),
                                        Expanded(child: Container()),
                                        Text(selectedPartList[index].quantity ??
                                            ''),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            selectedPartList.removeWhere(
                                                (element) =>
                                                    element.pname ==
                                                    selectedPartList[index]
                                                        .pname);

                                            setState(() {});
                                          },
                                          child: const Icon(
                                            Icons.cancel_presentation_outlined,
                                            color: Colors.red,
                                          ),
                                        )
                                      ],
                                    );
                                  }
                                }),
                          ],
                        )),
                  ),
            const SizedBox(
              height: 15,
            ),
            AppAddIconButtonWidget(
              onTap: () {
                showModalBottomSheet(
                    barrierColor: Colors.transparent,
                    context: widget.baseContext,
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
                                bottom: MediaQuery.of(widget.baseContext)
                                    .viewInsets
                                    .bottom),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                            validateValue: 'Enter Part Name',
                                          )),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: ModelTextField(
                                            controllerValue: _ctlPquantity,
                                            hintValue: 'Quantity',
                                            inputType: TextInputType.number,
                                            validateValue: 'Enter Quantity',
                                          )),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                AppAddPartButtonWidget(
                                    onTap: () {
                                      final isValid =
                                          _formKey.currentState!.validate();

                                      if (!isValid) {
                                        return;
                                      }
                                      addPartsFunction(
                                          fromAddParts: true,
                                          partName: _ctlPname.text,
                                          partPrice: '100',
                                          partQuantity: _ctlPquantity.text);
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
            const SizedBox(
              height: 10,
            ),
            selectedPartList.isEmpty
                ? Container()
                : AppButtonWidgetLogin(onTap: () {}, buttonText: 'Submit')
          ],
        ),
      ),
    );
  }
}
