import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shopping/screens/Technician/dashboard/complaint/tech_complain_proceed2.dart';
import 'package:shopping/utils/constant.dart';
import 'package:shopping/widgets/app_button.dart';
import 'package:shopping/widgets/input_field_widget.dart';

enum RemarkType { open, closed, inprogress, onhold, pending, forward }

class TechComplaintProceed extends StatefulWidget {
  const TechComplaintProceed({super.key});

  @override
  State<TechComplaintProceed> createState() => _TechComplaintProceedState();
}

class _TechComplaintProceedState extends State<TechComplaintProceed> {
  RemarkType remarkType = RemarkType.open;
  final _picker = ImagePicker();
  double contactHeight = 300;
  final _formAssignKey = GlobalKey<FormState>();
  List<PartsDetailsTextFields> listPartsDetailForm = [];
  final recorder = FlutterSoundRecorder();
  bool isRecorderReady = false, isPlaying = false;

  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  File? _beforeImageFile;

  @override
  Future initRecorder() async {
    final status = await Permission.microphone.request();

    if (status != PermissionStatus.granted) {
      throw 'Microphone permission not granted';
    }
    await recorder.openRecorder();
    isRecorderReady = true;
    recorder.setSubscriptionDuration(
      const Duration(milliseconds: 500),
    );
  }

  addNewPartField() {
    listPartsDetailForm.add(PartsDetailsTextFields());
    setState(() {});
  }

  removeCustomerField(index) {
    listPartsDetailForm.removeAt(index);
    setState(() {});
  }

  Future record() async {
    if (!isRecorderReady) return;
    await recorder.startRecorder(toFile: 'audio');
  }

  Future stop() async {
    // await recorder.stopRecorder();
    if (!isRecorderReady) return;
    final path = await recorder.stopRecorder();
    final audioFile = File(path!);

    print(audioFile);
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  @override
  void dispose() {
    recorder.closeRecorder();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todays Work'),
        actions: [
          IconButton(
              onPressed: () => showDialog(
                    context: context,
                    builder: (context) {
                      TextEditingController reasonAssign =
                          TextEditingController();
                      return StatefulBuilder(
                        builder: (context, setState) {
                          return AlertDialog(
                            title: const Text("Assign to Other",
                                style: TextStyle(fontSize: 16)),
                            content: Form(
                                key: _formAssignKey,
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      StepperTextField(
                                        rOnly: false,
                                        controllerValue: reasonAssign,
                                        labelValue: 'Reason',
                                        validateValue: 'Enter Reason',
                                      ),
                                    ],
                                  ),
                                )),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(color: primaryColor),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Submit",
                                  style: TextStyle(color: primaryColor),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
              icon: const Icon(Icons.assistant_direction))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Add Machine Photo',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: size.width * 0.035),
              ),
              const SizedBox(
                height: 10,
              ),
              if (_beforeImageFile == null)
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
                                                _pickBeforeImageFromCamera();
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
                                                _pickBeforeImageFromGallery();
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
                          'Before Machine',
                          style:
                              TextStyle(color: Color.fromARGB(255, 5, 49, 114)),
                        ))),
                  ),
                )
              else
                SizedBox(
                  height: size.height * 0.2,
                  width: size.width * 0.4,
                  child: Image.file(
                    _beforeImageFile!,
                    height: size.height * 0.2,
                    width: size.width * 0.4,
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
              // Card(
              //   elevation: 5,
              //   shape: const RoundedRectangleBorder(
              //       side: BorderSide(color: Colors.black87)),
              //   margin: EdgeInsets.zero,
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(vertical: 8.0),
              //     child: Column(children: [
              //       Text(
              //         'Service Details',
              //         style: TextStyle(
              //             fontWeight: FontWeight.bold,
              //             fontSize: size.width * 0.035),
              //       ),
              //       const Divider(
              //         color: Colors.black,
              //       ),
              //       const ComplainDetailHelper(
              //         head: 'Service Detail One',
              //         headDetail: '',
              //       ),
              //       const ComplainDetailHelper(
              //         head: 'Service Detail Two',
              //         headDetail: '',
              //       ),
              //       const ComplainDetailHelper(
              //         head: 'Service Detail Three',
              //         headDetail: '',
              //       ),
              //       const ComplainDetailHelper(
              //         head: 'Service Detail Four',
              //         headDetail: '',
              //       ),
              //     ]),
              //   ),
              // ),
              // const SizedBox(
              //   height: 20,
              // ),

              Card(
                elevation: 5,
                shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black87)),
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(children: [
                    Text(
                      'Parts Book - Select Action',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.035),
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: listPartsDetailForm.length,
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
                                        listPartsDetailForm.length == 1
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
                                              listPartsDetailForm.length == 1
                                                  ? Container()
                                                  : IconButton(
                                                      onPressed: () =>
                                                          removeCustomerField(
                                                              index),
                                                      icon: const Icon(
                                                          Icons.close),
                                                    )
                                            ],
                                          ),
                                        ),
                                        listPartsDetailForm[index],
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
                        'To Add more Parts',
                        style: TextStyle(color: primaryColor),
                      ),
                    ),
                  ]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                elevation: 5,
                shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black87)),
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(children: [
                    Text(
                      'Record',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.035),
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    StreamBuilder<RecordingDisposition>(
                        stream: recorder.onProgress,
                        builder: (context, snapshot) {
                          final duration = snapshot.hasData
                              ? snapshot.data!.duration
                              : Duration.zero;

                          String twoDigits(int n) =>
                              n.toString().padLeft(2, '0');

                          final twoDigitMinutes =
                              twoDigits(duration.inMinutes.remainder(60));

                          final twoDigitSeconds =
                              twoDigits(duration.inSeconds.remainder(60));

                          return Text(
                            '$twoDigitMinutes:$twoDigitSeconds',
                            style: const TextStyle(
                                fontSize: 50, fontWeight: FontWeight.bold),
                          );
                        }),
                    IconButton(
                        onPressed: () async {
                          if (recorder.isRecording) {
                            await stop();
                          } else {
                            await record();
                          }
                          setState(() {});
                        },
                        icon: Icon(
                            recorder.isRecording ? Icons.stop : Icons.mic)),
                    Slider(
                        min: 0,
                        max: duration.inSeconds.toDouble(),
                        value: position.inSeconds.toDouble(),
                        onChanged: (value) async {}),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(formatTime(position)),
                          Text(formatTime(duration - position))
                        ],
                      ),
                    ),
                    CircleAvatar(
                        radius: 25,
                        child: IconButton(
                          onPressed: () async {
                            if (isPlaying) {
                            } else {
                              String url =
                                  '/data/user/0/com.example.aquanerio/cache/audio';
                            }
                          },
                          icon: Icon(
                            isPlaying ? Icons.pause : Icons.play_arrow,
                          ),
                        )),
                  ]),
                ),
              ),

              // const CommplaintDetailWidget(
              //     headText: 'Service Details',
              //     listWidget: [
              //       ComplainDetailHelper(
              //         head: 'Service Detail One',
              //         headDetail: '',
              //       ),
              //       ComplainDetailHelper(
              //         head: 'Service Detail Two',
              //         headDetail: '',
              //       ),
              //       ComplainDetailHelper(
              //         head: 'Service Detail Three',
              //         headDetail: '',
              //       ),
              //       ComplainDetailHelper(
              //         head: 'Service Detail Four',
              //         headDetail: '',
              //       ),
              //     ]),
              // const SizedBox(
              //   height: 10,
              // ),
              // const CommplaintDetailWidget(
              //   headText: 'Service',
              //   listWidget: [
              //     ComplainDetailHelper(
              //       head: 'Contact Purchase Date',
              //       headDetail: '',
              //     ),
              //     ComplainDetailHelper(
              //       head: 'Contact Renewal Date',
              //       headDetail: '',
              //     ),
              //     ComplainDetailHelper(
              //       head: 'Office Staff',
              //       headDetail: '',
              //     ),
              //     ComplainDetailHelper(
              //       head: 'Technician',
              //       headDetail: '',
              //     ),
              //     ComplainDetailHelper(
              //       head: 'Types of Scheme',
              //       headDetail: '',
              //     ),
              //     ComplainDetailHelper(
              //       head: 'Contract Total',
              //       headDetail: '',
              //     ),
              //     ComplainDetailHelper(
              //       head: 'Cash / Cheque',
              //       headDetail: '',
              //     ),
              //     ComplainDetailHelper(
              //       head: 'Contract Purchase',
              //       headDetail: '',
              //     ),
              //     ComplainDetailHelper(
              //       head: 'Contract Pending',
              //       headDetail: '',
              //     ),
              //     ComplainDetailHelper(
              //       head: 'Remark',
              //       headDetail: '',
              //     ),
              //   ],
              // ),

              // const SizedBox(
              //   height: 10,
              // ),
              // CommplaintDetailWidget(
              //   headText: 'Parts Book - Select Action',
              //   listWidget: [
              //     SizedBox(
              //       child: ListView.builder(
              //         shrinkWrap: true,
              //         physics: const NeverScrollableScrollPhysics(),
              //         itemCount: listPartsDetailForm.length,
              //         itemBuilder: (_, index) => Card(
              //             elevation: 0,
              //             shape: const RoundedRectangleBorder(
              //                 side: BorderSide(color: Colors.black87)),
              //             margin: EdgeInsets.zero,
              //             child: Row(
              //               children: [
              //                 Expanded(
              //                     flex: 4,
              //                     child: Column(
              //                       children: [
              //                         listPartsDetailForm.length == 1
              //                             ? const SizedBox(height: 10)
              //                             : Container(),
              //                         Padding(
              //                           padding: const EdgeInsets.symmetric(
              //                               horizontal: 10),
              //                           child: Row(
              //                             mainAxisAlignment:
              //                                 MainAxisAlignment.spaceBetween,
              //                             children: [
              //                               Text(
              //                                 'Part ${index + 1}',
              //                                 style: TextStyle(
              //                                     fontSize: size.width * 0.035,
              //                                     fontWeight: FontWeight.w500),
              //                               ),
              //                               listPartsDetailForm.length == 1
              //                                   ? Container()
              //                                   : IconButton(
              //                                       onPressed: () =>
              //                                           removeCustomerField(
              //                                               index),
              //                                       icon:
              //                                           const Icon(Icons.close),
              //                                     )
              //                             ],
              //                           ),
              //                         ),
              //                         listPartsDetailForm[index],
              //                       ],
              //                     )),
              //               ],
              //             )),
              //       ),
              //     ),
              //     TextButton.icon(
              //       onPressed: () {
              //         addNewPartField();
              //       },
              //       icon: const Icon(Icons.add, color: primaryColor),
              //       label: const Text(
              //         'To Add more Parts',
              //         style: TextStyle(color: primaryColor),
              //       ),
              //     ),
              //     StreamBuilder<RecordingDisposition>(
              //         stream: recorder.onProgress,
              //         builder: (context, snapshot) {
              //           final duration = snapshot.hasData
              //               ? snapshot.data!.duration
              //               : Duration.zero;

              //           String twoDigits(int n) => n.toString().padLeft(2, '0');

              //           final twoDigitMinutes =
              //               twoDigits(duration.inMinutes.remainder(60));

              //           final twoDigitSeconds =
              //               twoDigits(duration.inSeconds.remainder(60));

              //           return Text(
              //             '$twoDigitMinutes:$twoDigitSeconds',
              //             style: const TextStyle(
              //                 fontSize: 50, fontWeight: FontWeight.bold),
              //           );
              //         }),
              //     IconButton(
              //         onPressed: () async {
              //           if (recorder.isRecording) {
              //             await stop();
              //           } else {
              //             await record();
              //           }
              //           setState(() {});
              //         },
              //         icon:
              //             Icon(recorder.isRecording ? Icons.stop : Icons.mic)),
              //     Slider(
              //         min: 0,
              //         max: duration.inSeconds.toDouble(),
              //         value: position.inSeconds.toDouble(),
              //         onChanged: (value) async {}),
              //     Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 10),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text(formatTime(position)),
              //           Text(formatTime(duration - position))
              //         ],
              //       ),
              //     ),
              //     CircleAvatar(
              //         radius: 25,
              //         child: IconButton(
              //           onPressed: () async {
              //             if (isPlaying) {
              //               await audioPlayer.pause();
              //             } else {
              //               String url =
              //                   '/data/user/0/com.example.aquanerio/cache/audio';
              //               await audioPlayer.play(UrlSource(url));
              //             }
              //           },
              //           icon: Icon(
              //             isPlaying ? Icons.pause : Icons.play_arrow,
              //           ),
              //         )),
              //   ],
              // ),
              const SizedBox(
                height: 20,
              ),

              Card(
                elevation: 5,
                shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black87)),
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(children: [
                    const ComplainDetailHelper(
                      head: 'Visit Date',
                      headDetail: '2-Apr-21',
                    ),
                    const ComplainDetailHelper(
                      head: 'Visit Status',
                      headDetail: 'PP Change',
                    ),
                    const ComplainDetailHelper(
                      head: 'Visit Technician',
                      headDetail: 'Karan',
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          border: Border.all(color: Colors.black87)),
                      child: const ComplainDetailHelper(
                        head: 'Office Approval',
                        headDetail: 'Anjali',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ]),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              AppButtonWidgetLogin(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const TechComplaintProceed2()));
                  },
                  buttonText: 'Proceed')
              // CommplaintDetailWidget(
              //   headText: 'Proceed',
              //   listWidget: [
              //     const ComplainDetailHelper(
              //       head: 'Visit Date',
              //       headDetail: '2-Apr-21',
              //     ),
              //     const ComplainDetailHelper(
              //       head: 'Visit Status',
              //       headDetail: 'PP Change',
              //     ),
              //     const ComplainDetailHelper(
              //       head: 'Visit Technician',
              //       headDetail: 'Karan',
              //     ),
              //     const Divider(
              //       color: Colors.black,
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
              //       child: Column(
              //         children: [
              //           Text(
              //             'Remark',
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold,
              //                 fontSize: size.width * 0.04),
              //           ),
              //           Row(
              //             children: [
              //               Expanded(
              //                 child: RadioListTile(
              //                     value: RemarkType.open,
              //                     groupValue: remarkType,
              //                     title: const Text(
              //                       'Open',
              //                       style: TextStyle(
              //                           color: Colors.black,
              //                           fontWeight: FontWeight.w500),
              //                     ),
              //                     onChanged: (RemarkType? val) {
              //                       setState(() {
              //                         // commonVal = "Pending";
              //                         remarkType = val!;
              //                       });
              //                     }),
              //               ),
              //               Expanded(
              //                 child: RadioListTile(
              //                     value: RemarkType.closed,
              //                     groupValue: remarkType,
              //                     title: const Text(
              //                       'Closed',
              //                       style: TextStyle(
              //                           color: Colors.black,
              //                           fontWeight: FontWeight.w500),
              //                     ),
              //                     onChanged: (RemarkType? val) {
              //                       setState(() {
              //                         // commonVal = "Pending";
              //                         remarkType = val!;
              //                       });
              //                     }),
              //               ),
              //             ],
              //           ),
              //           Row(
              //             children: [
              //               Expanded(
              //                 child: RadioListTile(
              //                     value: RemarkType.inprogress,
              //                     groupValue: remarkType,
              //                     title: const Text(
              //                       'In Progress',
              //                       style: TextStyle(
              //                           color: Colors.black,
              //                           fontWeight: FontWeight.w500),
              //                     ),
              //                     onChanged: (RemarkType? val) {
              //                       setState(() {
              //                         // commonVal = "Pending";
              //                         remarkType = val!;
              //                       });
              //                     }),
              //               ),
              //               Expanded(
              //                 child: RadioListTile(
              //                     value: RemarkType.onhold,
              //                     groupValue: remarkType,
              //                     title: const Text(
              //                       'On Hold',
              //                       style: TextStyle(
              //                           color: Colors.black,
              //                           fontWeight: FontWeight.w500),
              //                     ),
              //                     onChanged: (RemarkType? val) {
              //                       setState(() {
              //                         // commonVal = "Pending";
              //                         remarkType = val!;
              //                       });
              //                     }),
              //               ),
              //             ],
              //           ),
              //           Row(
              //             children: [
              //               Expanded(
              //                 child: RadioListTile(
              //                     value: RemarkType.pending,
              //                     groupValue: remarkType,
              //                     title: const Text(
              //                       'Pending',
              //                       style: TextStyle(
              //                           color: Colors.black,
              //                           fontWeight: FontWeight.w500),
              //                     ),
              //                     onChanged: (RemarkType? val) {
              //                       setState(() {
              //                         // commonVal = "Pending";
              //                         remarkType = val!;
              //                       });
              //                     }),
              //               ),
              //               Expanded(
              //                 child: RadioListTile(
              //                     value: RemarkType.forward,
              //                     groupValue: remarkType,
              //                     title: const Text(
              //                       'Forward',
              //                       style: TextStyle(
              //                           color: Colors.black,
              //                           fontWeight: FontWeight.w500),
              //                     ),
              //                     onChanged: (RemarkType? val) {
              //                       setState(() {
              //                         // commonVal = "Pending";
              //                         remarkType = val!;
              //                       });
              //                     }),
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //     Container(
              //       padding: const EdgeInsets.symmetric(vertical: 5),
              //       decoration: BoxDecoration(
              //           color: Colors.grey[300],
              //           border: Border.all(color: Colors.black87)),
              //       child: const ComplainDetailHelper(
              //         head: 'Office Approval',
              //         headDetail: 'Anjali',
              //       ),
              //     ),
              //     const SizedBox(
              //       height: 10,
              //     ),
              //     AppButtonWidget(
              //         onTap: () {
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) =>
              //                       const TechComplaintProceed2()));
              //         },
              //         buttonText: 'Proceed')
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickBeforeImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() => _beforeImageFile = File(pickedFile.path));
    }
  }

  Future<void> _pickBeforeImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() => _beforeImageFile = File(pickedFile.path));
    }
  }
}

class ComplainDetailHelper extends StatelessWidget {
  final String head, headDetail;
  const ComplainDetailHelper(
      {super.key, required this.head, required this.headDetail});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              head,
              style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.033),
            ),
          ),
          Expanded(
              flex: 5,
              child: Text(
                headDetail,
                style: TextStyle(fontSize: size.width * 0.03),
              ))
        ],
      ),
    );
  }
}

class ComplainDetailHelper2 extends StatelessWidget {
  final String head, headDetail;
  const ComplainDetailHelper2(
      {super.key, required this.head, required this.headDetail});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      child: Row(
        children: [
          Text(
            head,
            style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: size.width * 0.033),
          ),
          Text(
            headDetail,
            style: TextStyle(fontSize: size.width * 0.03),
          )
        ],
      ),
    );
  }
}

class PartsDetailsTextFields extends StatefulWidget {
  TextEditingController? partName;
  TextEditingController? partQty;
  TextEditingController? partDetails;

  PartsDetailsTextFields({
    Key? key,
    this.partName,
    this.partQty,
    this.partDetails,
  }) : super(key: key);

  @override
  State<PartsDetailsTextFields> createState() => _PartsDetailsTextFieldsState();
}

class _PartsDetailsTextFieldsState extends State<PartsDetailsTextFields> {
  int selectedValue = 0;
  DateTime? date;

  @override
  void initState() {
    widget.partName = TextEditingController();
    widget.partQty = TextEditingController();
    widget.partDetails = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final FocusScopeNode node = FocusScopeNode();
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: FocusScope(
        node: node,
        child: Form(
          key: formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            StepperTextField(
              rOnly: false,
              controllerValue: widget.partName,
              labelValue: 'Part Name',
              validateValue: 'Enter Part Name',
            ),
            const SizedBox(height: 20),
            StepperTextField(
              rOnly: false,
              controllerValue: widget.partName,
              labelValue: 'Ouantity',
              validateValue: 'Please Enter Ouantity',
            ),
            const SizedBox(height: 20),
            StepperTextField(
              rOnly: false,
              controllerValue: widget.partName,
              labelValue: 'Details',
              validateValue: 'Please Enter Details',
            ),
            const SizedBox(height: 20),
          ]),
        ),
      ),
    );
  }
}
