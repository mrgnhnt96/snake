part of '../snake_game_screen.dart';

class _Map extends StatelessComponent {
  const _Map();

  @override
  Component build(BuildContext context) {
    final difficulty = context.read<Difficulty>();

    final size = difficulty.size;

    return Center(
      child: Container(
        decoration: BoxDecoration(border: BoxBorder.all(color: Colors.white)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(size, (r) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(size, (c) => _Tile(Place(c, r))),
            );
          }),
        ),
      ),
    );
  }
}
