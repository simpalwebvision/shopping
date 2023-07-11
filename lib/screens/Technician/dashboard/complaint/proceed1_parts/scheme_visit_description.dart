import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/utils/constant.dart';
import 'package:shopping/widgets/app_button.dart';
import 'package:shopping/widgets/background_decoration.dart';

class SchemeVisitDescrptionScreen extends StatefulWidget {
  const SchemeVisitDescrptionScreen({super.key});

  @override
  State<SchemeVisitDescrptionScreen> createState() =>
      _SchemeVisitDescrptionScreenState();
}

class _SchemeVisitDescrptionScreenState
    extends State<SchemeVisitDescrptionScreen> {
  final TextEditingController _ctlDescrption = TextEditingController();

  bool isRecorderReady = false, isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  var audioFile;
  final recorder = FlutterSoundRecorder();
  @override
  void initState() {
    super.initState();
    CommonFunctions().disableCapture();
    initRecorder();
  }

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

  Future record() async {
    if (!isRecorderReady) return;
    await recorder.startRecorder(toFile: 'audio');
  }

  Future stop() async {
    // await recorder.stopRecorder();
    if (!isRecorderReady) return;
    final path = await recorder.stopRecorder();
    audioFile = File(path!);
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
      appBar: AppBar(title: const Text('Visit Description')),
      body: Stack(children: [
        Container(
          decoration: BackgroundDecoration().boxD(),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Record',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.035),
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
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              );
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                await record();
                                setState(() {});
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.black87)),
                                child: const Icon(
                                  Icons.mic,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            InkWell(
                              onTap: () async {
                                if (recorder.isRecording) {
                                  await stop();
                                }

                                setState(() {});
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.black87)),
                                child: const Icon(
                                  Icons.stop,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          color: Colors.black87,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Slider(
                                      min: 0,
                                      max: duration.inSeconds.toDouble(),
                                      value: position.inSeconds.toDouble(),
                                      onChanged: (value) async {}),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(formatTime(position)),
                                        Text(formatTime(duration - position))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                                radius: 25,
                                child: IconButton(
                                  onPressed: () async {},
                                  icon: Icon(
                                    isPlaying ? Icons.pause : Icons.play_arrow,
                                  ),
                                )),
                          ],
                        )
                      ],
                    ),
                  )
                ]),
              ),
              const Divider(
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 10,
                  controller: _ctlDescrption,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blueGrey[50],
                      label: const Text(
                        'Descrption',
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: borderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: borderColor)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: borderColor)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.red)),
                      labelStyle: const TextStyle(
                        color: Colors.green,
                      )),
                ),
              ),
              BlackAppButtonWidgetLogin(onTap: () {}, buttonText: 'Submit')
            ],
          ),
        ),
      ]),
    );
  }
}
