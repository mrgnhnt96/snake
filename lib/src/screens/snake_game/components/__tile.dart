part of '../snake_game_screen.dart';

class _Tile extends StatelessComponent {
  const _Tile(this.place);

  final Place place;

  @override
  Component build(BuildContext context) {
    final isHead = context.select((_Game game) => game.head == place);
    final isBody = context.select((_Game game) => game.body.contains(place));
    final isMouse = context.select((_Game game) => game.mouse == place);

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
          _TileType.head => Colors.brightCyan,
          _TileType.body => Colors.cyan,
          _TileType.mouse => Colors.yellow,
          _ => null,
        },
      ),
    );
  }
}

enum _TileType { head, body, mouse }
