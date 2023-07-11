import 'dart:async';

class MainController {
  static final MainController _singleton = MainController._internal();

  factory MainController() {
    return _singleton;
  }

  MainController._internal();

  final navListener = StreamController<int>.broadcast();
}
