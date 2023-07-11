import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/widgets/right_management_switch.dart';

class RightManagementSales extends StatefulWidget {
  const RightManagementSales({super.key});

  @override
  State<RightManagementSales> createState() => _RightManagementSalesState();
}

class _RightManagementSalesState extends State<RightManagementSales> {
  final TextEditingController _ctlEmpName = TextEditingController();
  bool s1 = false, s2 = false, s3 = false;

  List idList = [
    'Sales Person One',
    'Sales Person Two',
    'Sales Person Three',
    'Sales Person Four'
  ];

  @override
  void initState() {
    super.initState();
    CommonFunctions().disableCapture();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Manage Sales Person'),
        ),
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
                  _ctlEmpName.text = val.toString();
                  // final empProvider = Provider.of<TechnicianCreationProvider>(
                  //     context,
                  //     listen: false);
                  // var edt = empProvider.findByEmpName(val.toString());
                },
                getImmediateSuggestions: true,
                hideSuggestionsOnKeyboardHide: true,
                hideOnEmpty: false,
                noItemsFoundBuilder: (context) => const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('No Sale Person found..'),
                ),
                textFieldConfiguration: TextFieldConfiguration(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Sale Person Name',
                    hintText: 'Select Sale Person Name ',
                  ),
                  controller: _ctlEmpName,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please select Sale Person Name ';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              RightManagementSwitch(
                val: s1,
                onChange: (r0) {
                  setState(() {
                    s1 = r0;
                  });
                },
                rightText: 'Sales Person Right One',
              ),
              const SizedBox(
                height: 10,
              ),
              RightManagementSwitch(
                val: s2,
                onChange: (r0) {
                  setState(() {
                    s2 = r0;
                  });
                },
                rightText: 'Sales Person Right Two',
              ),
              const SizedBox(
                height: 10,
              ),
              RightManagementSwitch(
                val: s3,
                onChange: (r0) {
                  setState(() {
                    s3 = r0;
                  });
                },
                rightText: 'Sales Person Right Three',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
