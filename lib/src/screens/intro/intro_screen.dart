import 'package:nocterm/nocterm.dart';
import 'package:snake/src/data/nav.dart';
import 'package:snake/src/models/difficulty.dart';
import 'package:snake/src/provider/provider.dart';

part 'components/__difficulty.dart';
part 'components/__instructions.dart';
part 'components/__option.dart';
part 'data/__choice.dart';

class IntroScreen extends StatelessComponent {
  const IntroScreen({super.key});

  @override
  Component build(BuildContext context) {
    return Provider(
      create: (_) => _Choice(),
      child: Column(
        children: [
          SizedBox(height: 1),
          Text('''
  ░██████                         ░██
 ░██   ░██                        ░██
░██         ░████████   ░██████   ░██    ░██ ░███████
 ░████████  ░██    ░██       ░██  ░██   ░██ ░██    ░██
        ░██ ░██    ░██  ░███████  ░███████  ░█████████
 ░██   ░██  ░██    ░██ ░██   ░██  ░██   ░██ ░██
  ░██████   ░██    ░██  ░█████░██ ░██    ░██ ░███████
'''),

          SizedBox(height: 2),
          Text(
            'Choose your difficulty:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 1),
          const _Difficulty(),
          SizedBox(height: 1),
          const _Instructions(),
        ],
      ),
    );
  }
}
