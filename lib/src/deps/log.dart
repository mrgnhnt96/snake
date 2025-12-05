import 'package:file/file.dart';
import 'package:scoped_deps/scoped_deps.dart';
import 'package:snake/src/deps/fs.dart';

final logProvider = create(() => Log.instance);

Log get log => read(logProvider);

class Log {
  Log._() : _write = fs.file('dev_log.txt').openWrite();

  static final Log instance = Log._();

  final IOSink _write;

  void call(Object message) {
    final now = DateTime.now();
    final hour = now.hour.toString().padLeft(2, '0');
    final minute = now.minute.toString().padLeft(2, '0');
    final second = now.second.toString().padLeft(2, '0');
    final time = '$hour:$minute:$second';

    _write.write('[$time] $message\n');
  }
}
