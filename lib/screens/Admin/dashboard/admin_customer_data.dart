import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:shopping/screens/Technician/dashboard/complaint/tech_complain_proceed.dart';

class AdminCustomerData extends StatefulWidget {
  const AdminCustomerData({super.key});

  @override
  State<AdminCustomerData> createState() => _AdminCustomerDataState();
}

class _AdminCustomerDataState extends State<AdminCustomerData> {
  final TextEditingController _ctlIdNo = TextEditingController();

  List idList = ['13265', '74646', '54546', '85455'];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Customer Data')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TypeAheadFormField(
                suggestionsCallback: (pattern) => idList.where(
                  (item) => item.toUpperCase().contains(pattern.toUpperCase()),
                ),
                itemBuilder: (_, item) =>
                    ListTile(title: Text(item.toString())),
                onSuggestionSelected: (val) async {
                  _ctlIdNo.text = val.toString();
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
                  child: Text('No Customer Id found..'),
                ),
                textFieldConfiguration: TextFieldConfiguration(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Customer Id',
                    hintText: 'Select Customer Id. ',
                  ),
                  controller: _ctlIdNo,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please select Customer Id ';
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
                  shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black87)),
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      children: [
                        const ComplainDetailHelper(
                          head: 'ID No.',
                          headDetail: '123456',
                        ),
                        const ComplainDetailHelper(
                          head: 'Purchase Dt',
                          headDetail: '',
                        ),
                        const ComplainDetailHelper(
                          head: 'Renewal Dt',
                          headDetail: '',
                        ),
                        const ComplainDetailHelper(
                          head: 'Customer Name',
                          headDetail: '',
                        ),
                        const ComplainDetailHelper(
                          head: 'Contact 1',
                          headDetail: '',
                        ),
                        const ComplainDetailHelper(
                          head: 'Contact 2',
                          headDetail: '',
                        ),
                        const ComplainDetailHelper(
                          head: 'Address',
                          headDetail: '',
                        ),
                        const ComplainDetailHelper(
                          head: 'Station',
                          headDetail: '',
                        ),
                        const ComplainDetailHelper(
                          head: 'Product',
                          headDetail: '',
                        ),
                        const ComplainDetailHelper(
                          head: 'Model',
                          headDetail: '',
                        ),
                        Row(
                          children: const [
                            Expanded(
                              child: ComplainDetailHelper2(
                                head: 'Quantity',
                                headDetail: '',
                              ),
                            ),
                            Expanded(
                              child: ComplainDetailHelper2(
                                head: 'Litters',
                                headDetail: '',
                              ),
                            ),
                          ],
                        ),
                        const ComplainDetailHelper(
                          head: 'ID Purchase Amount',
                          headDetail: '',
                        ),
                        Row(
                          children: const [
                            Expanded(
                              child: ComplainDetailHelper2(
                                head: 'Cash',
                                headDetail: '',
                              ),
                            ),
                            Expanded(
                              child: ComplainDetailHelper2(
                                head: 'Cheque',
                                headDetail: '',
                              ),
                            ),
                          ],
                        ),
                        const ComplainDetailHelper(
                          head: 'NB ID Remark',
                          headDetail: '',
                        ),
                        const ComplainDetailHelper(
                          head: 'NB ID Pending',
                          headDetail: '',
                        ),
                        const ComplainDetailHelper(
                          head: 'Bounce Remark',
                          headDetail: '',
                        ),
                        const ComplainDetailHelper(
                          head: 'Bounce Pending',
                          headDetail: '',
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
