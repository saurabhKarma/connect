import 'package:logger/logger.dart';

abstract class SimpleLogger {
  static final _logger = Logger(
    printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: false,
        printTime: false // Should each log if(kDebugMode) print contain a timestamp
        ),
  );

  static debug(Type classs, dynamic log) {
    _logger.d('\n\n\nClass Name: $classs\n $log \n\n\n');
  }
}
