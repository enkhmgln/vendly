import 'dart:async';

import 'package:flutter/foundation.dart';

class AppOtpTimerModel extends ChangeNotifier {
  AppOtpTimerModel({this.durationSeconds = 180}) {
    _remaining = durationSeconds;
  }

  final int durationSeconds;
  int _remaining = 0;
  Timer? _timer;

  int get remainingSeconds => _remaining;
  String get minute => (_remaining ~/ 60).toString().padLeft(2, '0');
  String get second => (_remaining % 60).toString().padLeft(2, '0');
  bool get isTimerEnded => _remaining <= 0;

  void start() {
    stop();
    _remaining = durationSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_remaining > 0) {
        _remaining--;
        notifyListeners();
      } else {
        stop();
      }
    });
    notifyListeners();
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
    notifyListeners();
  }

  @override
  void dispose() {
    stop();
    super.dispose();
  }
}
