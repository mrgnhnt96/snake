part of '../snake_game_screen.dart';

class _Controls extends StatelessComponent {
  const _Controls({required this.child});

  final Component child;

  @override
  Component build(BuildContext context) {
    return Focusable(
      focused: true,
      onKeyEvent: (event) {
        switch (event.logicalKey) {
          case LogicalKey.arrowDown:
            context.read<_Game>().direction = Direction.down;
          case LogicalKey.arrowUp:
            context.read<_Game>().direction = Direction.up;
          case LogicalKey.arrowLeft:
            context.read<_Game>().direction = Direction.left;
          case LogicalKey.arrowRight:
            context.read<_Game>().direction = Direction.right;
          default:
            return false;
        }

        return true;
      },
      child: child,
    );
  }
}
