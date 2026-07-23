import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  void start() => state = true;
  void stop() => state = false;
}

final globalLoadingProvider = NotifierProvider<LoadingNotifier, bool>(() {
  return LoadingNotifier();
});