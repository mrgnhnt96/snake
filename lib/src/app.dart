import 'package:nocterm/nocterm.dart';
import 'package:nocterm_provider/provider.dart';
import 'package:snake/src/data/nav.dart';

class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavStack(initialRoute: IntroRoute()),
      child: Builder(
        builder: (context) {
          return context.watch<NavStack>().component;
        },
      ),
    );
  }
}
