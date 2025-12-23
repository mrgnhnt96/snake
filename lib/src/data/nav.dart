import 'package:nocterm/nocterm.dart';
import 'package:snake/src/models/difficulty.dart';
import 'package:snake/src/screens/game_over/game_over_screen.dart';
import 'package:snake/src/screens/intro/intro_screen.dart';
import 'package:snake/src/screens/snake_game/snake_game_screen.dart';
import 'package:snake/src/screens/winner/winner_screen.dart';

sealed class Route {
  const Route();

  Component get component;
}

class IntroRoute extends Route {
  const IntroRoute();

  @override
  Component get component => const IntroScreen();
}

class GameRoute extends Route {
  const GameRoute(this.difficulty);

  final Difficulty difficulty;

  @override
  Component get component => SnakeGameScreen(difficulty: difficulty);
}

class GameOverRoute extends Route {
  const GameOverRoute({required this.score});

  final int score;

  @override
  Component get component => GameOverScreen(score: score);
}

class WinnerRoute extends Route {
  const WinnerRoute();

  @override
  Component get component => const WinnerScreen();
}

final class NavStack extends ChangeNotifier {
  NavStack({required Route initialRoute}) : _current = initialRoute;

  Route _current;

  Component get component => _current.component;

  void push(Route route) {
    _current = route;
    notifyListeners();
  }
}
