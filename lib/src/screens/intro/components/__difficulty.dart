part of '../intro_screen.dart';

class _Difficulty extends StatelessComponent {
  const _Difficulty();

  @override
  Component build(BuildContext context) {
    return Focusable(
      focused: true,
      onKeyEvent: (event) {
        switch (event.logicalKey) {
          case LogicalKey.arrowDown:
            context.read<_Choice>().next();
          case LogicalKey.arrowUp:
            context.read<_Choice>().previous();
          case LogicalKey.space:
            context.read<_Choice>().select();
          case LogicalKey.enter:
            final choice = context.read<_Choice>().focused;
            context.read<NavStack>().push(GameRoute(choice));
          default:
            return false;
        }

        return true;
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final difficulty in Difficulty.values) _Option(difficulty),
        ],
      ),
    );
  }
}
