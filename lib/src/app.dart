import 'package:nocterm/nocterm.dart';
import 'package:snake/src/data/nav.dart';
import 'package:snake/src/provider/provider.dart';

class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return Provider(
      create: (_) => NavStack(initialRoute: IntroRoute()),
      builder: (context) {
        return context.watch<NavStack>().component;
      },
    );
  }
}
