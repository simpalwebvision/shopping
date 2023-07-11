import 'dart:io';
import 'dart:ui' as ui;

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/utils/constant.dart';
import 'package:shopping/widgets/complain_details_widget.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class TechComplaintProceed2 extends StatefulWidget {
  const TechComplaintProceed2({super.key});

  @override
  State<TechComplaintProceed2> createState() => _TechComplaintProceed2State();
}

class _TechComplaintProceed2State extends State<TechComplaintProceed2> {
  File? _afterImageFile;
  final _picker = ImagePicker();
  List<AddImageContainers> listAddForm = [];
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    CommonFunctions().disableCapture();
    addNewPartField();
  }

  addNewPartField() {
    listAddForm.add(const AddImageContainers());
    setState(() {});
  }

  removeImagePart(index) {
    listAddForm.removeAt(index);
    setState(() {});
  }

  void _handleClearButtonPressed() {
    signatureGlobalKey.currentState!.clear();
  }

  void _handleSaveButtonPressed() async {
    final data =
        await signatureGlobalKey.currentState!.toImage(pixelRatio: 3.0);
    final bytes = await data.toByteData(format: ui.ImageByteFormat.png);
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Container(
                color: Colors.grey[300],
                child: Image.memory(bytes!.buffer.asUint8List()),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                if (_afterImageFile == null)
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          enableDrag: false,
                          context: context,
                          builder: (BuildContext context) {
                            return Wrap(children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15.0),
                                    topRight: Radius.circular(15.0),
                                  ),
                                ),
                                child: SingleChildScrollView(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(15.0),
                                        topRight: Radius.circular(15.0),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            child: ColumnTextIcon(
                                                screenHeight: size.height,
                                                screenWidth: size.width,
                                                imagePath:
                                                    'assets/images/camera_image.png',
                                                helperText: 'By Camera',
                                                ontap: () {
                                                  _pickAfterImageFromCamera();
                                                })),
                                        const SizedBox(
                                            height: 3,
                                            child: VerticalDivider(
                                                color: Colors.black)),
                                        Expanded(
                                            child: ColumnTextIcon(
                                                screenHeight: size.height,
                                                screenWidth: size.width,
                                                imagePath:
                                                    'assets/images/galleryimage.png',
                                                helperText: 'From Gallery',
                                                ontap: () {
                                                  _pickAfterImageFromGallery();
                                                })),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ]);
                          });
                    },
                    child: DottedBorder(
                      dashPattern: const [8, 6],
                      color: const Color.fromARGB(255, 5, 49, 114),
                      child: SizedBox(
                          height: size.height * 0.2,
                          width: size.width * 0.4,
                          child: const Center(
                              child: Text(
                            'After Machine',
                            style: TextStyle(
                                color: Color.fromARGB(255, 5, 49, 114)),
                          ))),
                    ),
                  )
                else
                  SizedBox(
                    height: size.height * 0.2,
                    width: size.width * 0.4,
                    child: Image.file(
                      _afterImageFile!,
                      height: size.height * 0.2,
                      width: size.width * 0.4,
                    ),
                  ),
                const SizedBox(
                  height: 15,
                ),
                CommplaintDetailWidget(
                  headText: 'Used Parts',
                  listWidget: [
                    SizedBox(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: listAddForm.length,
                        itemBuilder: (_, index) => Card(
                            elevation: 0,
                            shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black87)),
                            margin: EdgeInsets.zero,
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 4,
                                    child: Column(
                                      children: [
                                        listAddForm.length == 1
                                            ? const SizedBox(height: 10)
                                            : Container(),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Part ${index + 1}',
                                                style: TextStyle(
                                                    fontSize:
                                                        size.width * 0.035,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              listAddForm.length == 1
                                                  ? Container()
                                                  : IconButton(
                                                      onPressed: () {
                                                        removeImagePart(index);
                                                      },
                                                      icon: const Icon(
                                                          Icons.close),
                                                    )
                                            ],
                                          ),
                                        ),
                                        listAddForm[index],
                                      ],
                                    )),
                              ],
                            )),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        addNewPartField();
                      },
                      icon: const Icon(Icons.add, color: primaryColor),
                      label: const Text(
                        'Add more Parts Images',
                        style: TextStyle(color: primaryColor),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                // CommplaintDetailWidget(
                //   headText: 'Customer Feedback',
                //   listWidget: [
                //     Column(
                //       children: [
                //         Row(
                //           children: [
                //             Expanded(
                //               child: RadioListTile(
                //                   value: Feedback.excellent,
                //                   groupValue: _feedback,
                //                   title: const Text(
                //                     'Excellent 😀',
                //                     style: TextStyle(
                //                         color: Colors.black,
                //                         fontWeight: FontWeight.w500),
                //                   ),
                //                   onChanged: (Feedback? val) {
                //                     setState(() {
                //                       // commonVal = "Pending";
                //                       _feedback = val!;
                //                     });
                //                   }),
                //             ),
                //             Expanded(
                //               child: RadioListTile(
                //                   value: Feedback.verygood,
                //                   groupValue: _feedback,
                //                   title: const Text(
                //                     'Very Good 😄',
                //                     style: TextStyle(
                //                         color: Colors.black,
                //                         fontWeight: FontWeight.w500),
                //                   ),
                //                   onChanged: (Feedback? val) {
                //                     setState(() {
                //                       // commonVal = "Pending";
                //                       _feedback = val!;
                //                     });
                //                   }),
                //             ),
                //           ],
                //         ),
                //         Row(
                //           children: [
                //             Expanded(
                //               child: RadioListTile(
                //                   value: Feedback.good,
                //                   groupValue: _feedback,
                //                   title: const Text(
                //                     'Good 🙂',
                //                     style: TextStyle(
                //                         color: Colors.black,
                //                         fontWeight: FontWeight.w500),
                //                   ),
                //                   onChanged: (Feedback? val) {
                //                     setState(() {
                //                       // commonVal = "Pending";
                //                       _feedback = val!;
                //                     });
                //                   }),
                //             ),
                //             Expanded(
                //               child: RadioListTile(
                //                   value: Feedback.poor,
                //                   groupValue: _feedback,
                //                   title: const Text(
                //                     'Poor 🙁',
                //                     style: TextStyle(
                //                         color: Colors.black,
                //                         fontWeight: FontWeight.w500),
                //                   ),
                //                   onChanged: (Feedback? val) {
                //                     setState(() {
                //                       // commonVal = "Pending";
                //                       _feedback = val!;
                //                     });
                //                   }),
                //             ),
                //           ],
                //         ),
                //       ],
                //     )
                //   ],
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                CommplaintDetailWidget(
                  headText: 'Upload Signature',
                  listWidget: [
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: SfSignaturePad(
                                key: signatureGlobalKey,
                                backgroundColor: Colors.white,
                                strokeColor: Colors.black,
                                minimumStrokeWidth: 1.0,
                                maximumStrokeWidth: 4.0))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: _handleSaveButtonPressed,
                          child: const Text(
                            'To Image',
                            style: TextStyle(color: primaryColor),
                          ),
                        ),
                        TextButton(
                          onPressed: _handleClearButtonPressed,
                          child: const Text('Clear',
                              style: TextStyle(color: primaryColor)),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }

  Future<void> _pickAfterImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() => _afterImageFile = File(pickedFile.path));
    }
  }

  Future<void> _pickAfterImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() => _afterImageFile = File(pickedFile.path));
    }
  }
}

class ColumnTextIcon extends StatelessWidget {
  final double? screenHeight;
  final double? screenWidth;
  final VoidCallback? ontap;
  final String? imagePath;
  final String? helperText;
  const ColumnTextIcon(
      {Key? key,
      this.ontap,
      this.imagePath,
      this.helperText,
      this.screenHeight,
      this.screenWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: InkWell(
        onTap: ontap,
        child: Column(
          children: [
            Image.asset(
              imagePath!,
              height: screenHeight! * 0.1,
              width: screenWidth! * 0.3,
            ),
            Text(helperText!)
          ],
        ),
      ),
    );
  }
}

class AddImageContainers extends StatefulWidget {
  const AddImageContainers({
    Key? key,
  }) : super(key: key);

  @override
  State<AddImageContainers> createState() => _AddImageContainersState();
}

class _AddImageContainersState extends State<AddImageContainers> {
  File? partImageFile;
  final partImagepicker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (partImageFile == null)
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  enableDrag: false,
                  context: context,
                  builder: (BuildContext context) {
                    return Wrap(children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                topRight: Radius.circular(15.0),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: ColumnTextIcon(
                                        screenHeight: size.height,
                                        screenWidth: size.width,
                                        imagePath:
                                            'assets/images/camera_image.png',
                                        helperText: 'By Camera',
                                        ontap: () {
                                          _pickPartImageFromCamera();
                                        })),
                                const SizedBox(
                                    height: 3,
                                    child:
                                        VerticalDivider(color: Colors.black)),
                                Expanded(
                                    child: ColumnTextIcon(
                                        screenHeight: size.height,
                                        screenWidth: size.width,
                                        imagePath:
                                            'assets/images/galleryimage.png',
                                        helperText: 'From Gallery',
                                        ontap: () {
                                          _pickPartImageFromGallery();
                                        })),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]);
                  });
            },
            child: DottedBorder(
              dashPattern: const [8, 6],
              color: const Color.fromARGB(255, 5, 49, 114),
              child: SizedBox(
                  height: size.height * 0.2,
                  width: size.width * 0.4,
                  child: const Center(
                      child: Text(
                    'After Machine',
                    style: TextStyle(color: Color.fromARGB(255, 5, 49, 114)),
                  ))),
            ),
          )
        else
          SizedBox(
            height: size.height * 0.2,
            width: size.width * 0.4,
            child: Image.file(
              partImageFile!,
              height: size.height * 0.2,
              width: size.width * 0.4,
            ),
          ),
      ]),
    );
  }

  Future<void> _pickPartImageFromGallery() async {
    final pickedFile =
        await partImagepicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() => partImageFile = File(pickedFile.path));
    }
  }

  Future<void> _pickPartImageFromCamera() async {
    final pickedFile =
        await partImagepicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() => partImageFile = File(pickedFile.path));
    }
  }
}
