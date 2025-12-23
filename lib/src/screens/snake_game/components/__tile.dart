part of '../snake_game_screen.dart';

class _Tile extends StatelessComponent {
  const _Tile(this.place);

  final Place place;

  @override
  Component build(BuildContext context) {
    final isHead = context.select((_Game game) => game.head == place);
    final isBody = context.select((_Game game) => game.body.contains(place));
    final isMouse = context.select((_Game game) => game.mouse == place);
    final isDead = context.select((_Game game) => game.isDead(place));

    final tileType = switch ((isHead, isBody, isMouse)) {
      (true, _, _) => _TileType.head,
      (_, true, _) => _TileType.body,
      (_, _, true) => _TileType.mouse,
      _ => null,
    };

    return Container(
      width: 3,
      height: 1,
      decoration: BoxDecoration(
        color: switch (tileType) {
          _ when isDead => Colors.red,
          _TileType.head => Colors.brightCyan,
          _TileType.body => Colors.cyan,
          _TileType.mouse => Colors.yellow,
          _ => null,
        },
      ),
      child: Center(
        child: switch (isDead) {
          false => Text(''),
          true => switch (tileType) {
            _TileType.head => Text('X'),
            _TileType.body => Text('•'),
            _TileType.mouse => Text(''),
            _ => Text(''),
          },
        },
      ),
    );
  }
}

enum _TileType { head, body, mouse }
