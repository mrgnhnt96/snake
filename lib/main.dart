import 'package:snake/src/app.dart';
import 'package:snake/src/deps/fs.dart';
import 'package:snake/src/deps/log.dart';
import 'package:nocterm/nocterm.dart' hide App;
import 'package:scoped_deps/scoped_deps.dart';

void main() {
  runScoped(values: {logProvider, fsProvider}, () => runApp(const App()));
}
