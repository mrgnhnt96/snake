part of '../snake_game_screen.dart';

class _Map extends StatelessComponent {
  const _Map();

  @override
  Component build(BuildContext context) {
    final difficulty = context.read<Difficulty>();

    final (width, height) = difficulty.mapSize;

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(border: BoxBorder.all(color: Colors.white)),
    );
  }
}
