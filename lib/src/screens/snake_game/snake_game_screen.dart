import 'package:nocterm/nocterm.dart';
import 'package:nocterm_provider/provider.dart';
import 'package:snake/src/models/difficulty.dart';

part 'components/__map.dart';

class SnakeGameScreen extends StatelessComponent {
  const SnakeGameScreen({super.key, required this.difficulty});

  final Difficulty difficulty;

  @override
  Component build(BuildContext context) {
    return Provider.value(value: difficulty, child: const _Map());
  }
}
