import 'dart:async';

class TDebouncer {
  static Timer? _timer;

  // Run timer
  void run(Future<void> Function() action, int milliseconds) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), () async => action());
  }

  // Run timer with async
  static Future<void> runAsync(Future<void> Function() action, int milliseconds) {
    final completer = Completer<void>();

    _timer?.cancel();

    _timer = Timer(Duration(milliseconds: milliseconds), () async {
      try {
        await action();
        completer.complete();
      } catch (e) {
        completer.completeError(e);
      }
    });

    return completer.future;
  }

  // Clear timer
  void cancelTimer() {
    _timer?.cancel();
  }
}
