import 'package:flutter/material.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/widgets/app_button.dart';
import 'package:shopping/widgets/dropdown_widget.dart';
import 'package:shopping/widgets/input_field_widget.dart';

class NewCustComplainForm extends StatefulWidget {
  const NewCustComplainForm({super.key});

  @override
  State<NewCustComplainForm> createState() => _NewCustComplainFormState();
}

class _NewCustComplainFormState extends State<NewCustComplainForm> {
  final TextEditingController _ctlContact = TextEditingController();
  final TextEditingController _ctlFName = TextEditingController();
  final TextEditingController _ctlAddress = TextEditingController();
  final TextEditingController _ctlStation = TextEditingController();
  final TextEditingController _ctlState = TextEditingController();
  final TextEditingController _ctlCountry = TextEditingController();
  final TextEditingController _ctlProductName = TextEditingController();
  final TextEditingController _ctlOtherComplain = TextEditingController();

  @override
  void initState() {
    super.initState();
    CommonFunctions().disableCapture();
  }

  String? selectedval = '';
  List remark = [
    'Machine not working',
    'leakage',
    'Water test',
    'Not Storage',
    'Shifting',
    'Any other query',
  ];

  @override
  void dispose() {
    super.dispose();
    _ctlContact.dispose();
    _ctlFName.dispose();
    _ctlAddress.dispose();
    _ctlStation.dispose();
    _ctlState.dispose();
    _ctlCountry.dispose();
    _ctlProductName.dispose();
    _ctlOtherComplain.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Complain'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                'Fill the Deails Below :',
                style: TextStyle(
                    fontSize: size.width * 0.04, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              StepperTextField(
                rOnly: false,
                controllerValue: _ctlContact,
                labelValue: 'Contact No',
                validateValue: 'Enter Contact Number',
              ),
              const SizedBox(
                height: 10,
              ),
              StepperTextField(
                rOnly: false,
                controllerValue: _ctlFName,
                labelValue: 'Full Name',
                validateValue: 'Enter Full Name',
              ),
              const SizedBox(
                height: 10,
              ),
              StepperTextField(
                rOnly: false,
                controllerValue: _ctlAddress,
                labelValue: 'Address',
                validateValue: 'Enter Address',
              ),
              const SizedBox(
                height: 10,
              ),
              StepperTextField(
                rOnly: false,
                controllerValue: _ctlStation,
                labelValue: 'Station',
                validateValue: 'Enter Station',
              ),
              const SizedBox(
                height: 10,
              ),
              StepperTextField(
                rOnly: false,
                controllerValue: _ctlStation,
                labelValue: 'Distance',
                validateValue: 'Enter Distance',
              ),
              const SizedBox(
                height: 10,
              ),
              StepperTextField(
                rOnly: false,
                controllerValue: _ctlState,
                labelValue: 'State',
                validateValue: 'Enter State',
              ),
              const SizedBox(
                height: 10,
              ),
              StepperTextField(
                rOnly: false,
                controllerValue: _ctlCountry,
                labelValue: 'Country',
                validateValue: 'Enter Country',
              ),
              const SizedBox(
                height: 10,
              ),
              StepperTextField(
                rOnly: false,
                controllerValue: _ctlProductName,
                labelValue: 'Product Name / Litter',
                validateValue: 'Enter Product Name / Litter',
              ),
              const SizedBox(
                height: 15,
              ),
              DropDownWidget(
                  labelText: 'Problem',
                  hintText: 'Select Problem',
                  dropMenuList: remark,
                  selectedReturnValue: (value) {
                    setState(() => selectedval = value);
                  }),
              const SizedBox(
                height: 15,
              ),
              selectedval == 'Any other query'
                  ? StepperTextField(
                      rOnly: false,
                      controllerValue: _ctlOtherComplain,
                      labelValue: 'Enter your Problem here ..',
                      validateValue: 'Enter your Problem',
                    )
                  : Container(),
              selectedval == 'Any other query'
                  ? const SizedBox(
                      height: 15,
                    )
                  : Container(),
              AppButtonWidgetLogin(
                onTap: () {},
                buttonText: 'Submit',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
