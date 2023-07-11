import 'package:flutter/material.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/widgets/app_button.dart';
import 'package:shopping/widgets/input_field_widget.dart';

enum EmpType { technician, sales }

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({super.key});

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController _ctlFName = TextEditingController();
  final TextEditingController _ctlAddress = TextEditingController();
  final TextEditingController _ctlLocation = TextEditingController();
  final TextEditingController _ctlCity = TextEditingController();
  final TextEditingController _ctlPin = TextEditingController();
  final TextEditingController _ctlState = TextEditingController();
  final TextEditingController _ctlNationality = TextEditingController();
  final TextEditingController _ctlEmail = TextEditingController();
  final TextEditingController _ctlMobile = TextEditingController();

  EmpType empType = EmpType.technician;

  @override
  void initState() {
    super.initState();
    CommonFunctions().disableCapture();
  }

  @override
  void dispose() {
    super.dispose();
    _ctlFName.dispose();
    _ctlAddress.dispose();
    _ctlLocation.dispose();
    _ctlCity.dispose();
    _ctlPin.dispose();
    _ctlState.dispose();
    _ctlNationality.dispose();
    _ctlEmail.dispose();
    _ctlMobile.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Employee',
        ),
        actions: [
          IconButton(
            onPressed: () {
              final isValid = _formKey.currentState!.validate();

              if (!isValid) {
                return;
              }
            },
            icon: const Icon(
              Icons.check,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                        value: EmpType.technician,
                        groupValue: empType,
                        onChanged: (EmpType? val) {
                          setState(() {
                            // commonVal = "Pending";
                            empType = val!;
                          });
                        }),
                    const Text(
                      'Technician',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Radio(
                        value: EmpType.sales,
                        groupValue: empType,
                        onChanged: (EmpType? val) {
                          setState(() {
                            // commonVal = "Pending";
                            empType = val!;
                          });
                        }),
                    const Text(
                      'Sales',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                  ],
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
                  controllerValue: _ctlLocation,
                  labelValue: 'Location',
                  validateValue: 'Enter Location',
                ),
                const SizedBox(
                  height: 10,
                ),
                StepperTextField(
                  rOnly: false,
                  controllerValue: _ctlCity,
                  labelValue: 'City',
                  validateValue: 'Enter City',
                ),
                const SizedBox(
                  height: 10,
                ),
                StepperTextField(
                  rOnly: false,
                  controllerValue: _ctlPin,
                  labelValue: 'Pin',
                  validateValue: 'Enter Pin',
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
                  controllerValue: _ctlNationality,
                  labelValue: 'Nationality',
                  validateValue: 'Enter Nationality',
                ),
                const SizedBox(
                  height: 10,
                ),
                StepperTextField(
                  rOnly: false,
                  controllerValue: _ctlEmail,
                  labelValue: 'Email ID ',
                  validateValue: 'Enter Email ID',
                ),
                const SizedBox(
                  height: 10,
                ),
                StepperTextField(
                  rOnly: false,
                  controllerValue: _ctlMobile,
                  labelValue: 'Mobile',
                  validateValue: 'Mobile',
                ),
                const SizedBox(
                  height: 10,
                ),
                AppButtonWidgetLogin(
                  onTap: () {
                    final isValid = _formKey.currentState!.validate();

                    if (!isValid) {
                      return;
                    }
                  },
                  buttonText: 'Submit',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
