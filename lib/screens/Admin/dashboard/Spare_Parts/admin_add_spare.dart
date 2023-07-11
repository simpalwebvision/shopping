import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/utils/constant.dart';
import 'package:shopping/widgets/app_button.dart';

class AddSparePartScreen extends StatefulWidget {
  const AddSparePartScreen({super.key});

  @override
  State<AddSparePartScreen> createState() => _AddSparePartScreenState();
}

class _AddSparePartScreenState extends State<AddSparePartScreen> {
  final TextEditingController _ctlTechnician = TextEditingController();
  final TextEditingController _modalSparePartController =
      TextEditingController();
  List technicianList = [
    'Techinician One',
    'Techinician Two',
    'Techinician Three',
    'Techinician Four'
  ];

  List selectedPartList = ['Part One', 'Part Two', 'Part Three', 'Part Four'];
  String todate = "";

  DateTime now = DateTime.now();
  @override
  void initState() {
    super.initState();
    CommonFunctions().disableCapture();

    todate = DateFormat('dd/MM/yyyy').format(now);
  }

  @override
  void dispose() {
    _ctlTechnician.dispose();
    _modalSparePartController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Spare Parts to Technician',
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  todate,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.035),
                ),
                const SizedBox(
                  height: 10,
                ),
                TypeAheadFormField(
                  suggestionsCallback: (pattern) => technicianList.where(
                    (item) =>
                        item.toUpperCase().contains(pattern.toUpperCase()),
                  ),
                  itemBuilder: (_, item) =>
                      ListTile(title: Text(item.toString())),
                  onSuggestionSelected: (val) async {
                    _ctlTechnician.text = val.toString();
                    // final empProvider = Provider.of<EmployeeCreationProvider>(
                    //     context,
                    //     listen: false);
                    // var edt = empProvider.findByEmpName(val.toString());
                  },
                  getImmediateSuggestions: true,
                  hideSuggestionsOnKeyboardHide: true,
                  hideOnEmpty: false,
                  noItemsFoundBuilder: (context) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('No Technician found..'),
                  ),
                  textFieldConfiguration: TextFieldConfiguration(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Technician',
                      hintText: 'Select Technician. ',
                    ),
                    controller: _ctlTechnician,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please select Technician ';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
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
                                return Row(
                                  children: [
                                    Text(selectedPartList[index]),
                                    Expanded(child: Container()),
                                    const Text('15'),
                                  ],
                                );
                              }),
                        ],
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                ListTile(
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(8)),
                  leading: const Icon(Icons.search),
                  title: const Text('Search for Spare part ..'),
                  onTap: () {
                    currentDestinationSearch(context, size);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                AppButtonWidgetLogin(onTap: () {}, buttonText: 'Submit')
              ],
            ),
          ),
        ),
      ),
    );
  }

  currentDestinationSearch(BuildContext context, Size size) {
    double sheetHeight = size.height * 0.95;

    showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (BuildContext context, setStater) {
            return SizedBox(
              height: sheetHeight,
              child: Scaffold(
                backgroundColor: Colors.white,
                body: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                            child: Icon(Icons.horizontal_rule_rounded,
                                color: Colors.teal)),
                        Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.black54),
                              borderRadius: BorderRadius.circular(8)),
                          child: TextFormField(
                              autofocus: true,
                              onChanged: (value) {
                                if (value != "") {
                                  setStater(() {
                                    // findFindPlaceName(value);
                                  });
                                } else {
                                  setStater(() {
                                    selectedPartList.clear();
                                  });
                                }
                              },
                              controller: _modalSparePartController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                      const EdgeInsets.only(top: 15),
                                  hintText: 'Search for Spare Part ...',
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    size: 17,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: const Icon(
                                      FontAwesomeIcons.circleXmark,
                                      size: 17,
                                    ),
                                    onPressed: () {
                                      setStater(() {
                                        selectedPartList.clear();
                                      });
                                    },
                                  ))),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: selectedPartList.length,
                              itemBuilder: ((context, index) {
                                if (selectedPartList.isNotEmpty) {
                                  return Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            color: Colors.black54),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Colors.black87)),
                                            height: size.height * 0.10,
                                            width: size.width * 0.2,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Part $index',
                                                  style: TextStyle(
                                                      fontSize:
                                                          size.width * 0.032,
                                                      color: primaryColor,
                                                      letterSpacing: 0.5,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text('Best Price : ',
                                                    style: TextStyle(
                                                      fontSize:
                                                          size.width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black87,
                                                    )),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text('Date',
                                                    style: TextStyle(
                                                      fontSize:
                                                          size.width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black87,
                                                    )),
                                                Row(
                                                  children: [
                                                    Text('Quantity : ',
                                                        style: TextStyle(
                                                          fontSize:
                                                              size.width * 0.03,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black87,
                                                        )),
                                                    const SizedBox(
                                                      width: 15,
                                                    ),
                                                    SizedBox(
                                                      width: size.width * 0.17,
                                                      child: const TextField(
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLength: 2,
                                                        decoration: InputDecoration(
                                                            counterText: '',
                                                            border:
                                                                OutlineInputBorder()),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                ElevatedButton(
                                                    onPressed: () {},
                                                    child: const Text('Add'))
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              })),
                        ),
                      ]),
                ),
              ),
            );
          });
        });
  }
}
