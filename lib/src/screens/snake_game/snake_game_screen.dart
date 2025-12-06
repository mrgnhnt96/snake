import 'dart:async';
import 'dart:math';

import 'package:nocterm/nocterm.dart';
import 'package:nocterm_provider/provider.dart';
import 'package:snake/src/models/difficulty.dart';
import 'package:snake/src/models/place.dart';

part 'components/__controls.dart';
part 'components/__map.dart';
part 'components/__tile.dart';
part 'data/__game.dart';

class SnakeGameScreen extends StatelessComponent {
  const SnakeGameScreen({super.key, required this.difficulty});

  final Difficulty difficulty;

  @override
  Component build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: difficulty),
        ChangeNotifierProvider(create: (_) => _Game(difficulty: difficulty)),
      ],
      child: _Controls(child: const _Map()),
    );
  }
}
