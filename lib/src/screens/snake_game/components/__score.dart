part of '../snake_game_screen.dart';

class _Score extends StatelessComponent {
  const _Score();

  @override
  Component build(BuildContext context) {
    final score = context.select((_Game game) => game.score);

    return Text('Score: $score');
  }
}
