import 'package:flutter/material.dart';
import 'package:shopping/utils/common_function.dart';

class TechNotificationsScreen extends StatefulWidget {
  const TechNotificationsScreen({super.key});

  @override
  State<TechNotificationsScreen> createState() =>
      _TechNotificationsScreenState();
}

class _TechNotificationsScreenState extends State<TechNotificationsScreen> {
  @override
  void initState() {
    super.initState();
    CommonFunctions().disableCapture();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notifications'),
          centerTitle: true,
        ),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
              child: Card(
                elevation: 5,
                margin: EdgeInsets.zero,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  alignment: Alignment.centerLeft,
                  height: 50,
                  child: Text('Notification ${index + 1}'),
                ),
              ),
            );
          },
        ));
  }
}
