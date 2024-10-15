import 'dart:async';
import 'dart:ui';

class DebounceCustom {
  int? milliseconds = 1000;
  VoidCallback? action;
  Timer? timer;

  DebounceCustom({this.milliseconds});

  run(VoidCallback action) {
    timer?.cancel();
    timer = Timer(Duration(milliseconds: milliseconds ?? 1000), action);
  }
}