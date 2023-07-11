import 'package:flutter/material.dart';
import 'package:shopping/utils/common_function.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _ctlFullName = TextEditingController();

  @override
  void initState() {
    CommonFunctions().disableCapture();
    super.initState();
  }

  @override
  void dispose() {
    _ctlFullName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.01,
            ),
            _circleCard(size),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      ProfileTextFormField(
                        ctl: _ctlFullName,
                        textAction: TextInputAction.next,
                        textInput: TextInputType.text,
                        size: size,
                        hintText: 'Full Name',
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            hintText: 'Address',
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15)),
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            hintText: 'Location',
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15)),
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            hintText: 'City',
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15)),
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            hintText: 'Pin',
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15)),
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            hintText: 'State',
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15)),
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            hintText: 'Nationality',
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15)),
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            hintText: 'Email ID',
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15)),
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                            hintText: 'Mobile No',
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15)),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Material(
                        shadowColor: Colors.grey.withOpacity(0.3),
                        child: InkWell(
                          onTap: () {},
                          child: Ink(
                            width: size.width,
                            height: 50,
                            color: Colors.red[400],
                            child: const Center(
                                child: Text(
                              'Update',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget _circleCard(Size size) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: size.width * 0.15,
                backgroundColor: Colors.grey.shade200,
                child: CircleAvatar(
                  radius: size.width * 0.145,
                  backgroundImage: const NetworkImage(
                      'https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=612x612&w=0&k=20&c=yBeyba0hUkh14_jgv1OKqIH0CCSWU_4ckRkAoy2p73o='),
                ),
              ),
              Positioned(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 3,
                        color: Colors.white,
                      ),
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(2, 4),
                          color: Colors.black.withOpacity(
                            0.3,
                          ),
                          blurRadius: 3,
                        ),
                      ]),
                  child: const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Icon(Icons.add_a_photo, color: Colors.black),
                  ),
                ),
              ),
            ],
          )
          // Text(name)
        ],
      ),
    );
  }
}

class ProfileTextFormField extends StatelessWidget {
  final Size size;
  final TextInputAction textAction;
  final TextInputType textInput;
  final String hintText;
  final TextEditingController ctl;
  const ProfileTextFormField(
      {super.key,
      required this.textAction,
      required this.textInput,
      required this.hintText,
      required this.ctl,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ctl,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: size.width * 0.02)),
    );
  }
}
