part of '../intro_screen.dart';

class _Option extends StatelessComponent {
  const _Option(this.difficulty);

  final Difficulty difficulty;

  @override
  Component build(BuildContext context) {
    final choice = context.watch<_Choice>();

    final isFocused = choice.focused == difficulty;
    final isSelected = choice.difficulty == difficulty;

    final style = TextStyle(
      color: switch ((isFocused, isSelected)) {
        (_, true) => Colors.green,
        _ => Colors.gray,
      },
    );

    return Text(
      difficulty.name.toUpperCase(),
      style: style.copyWith(
        decoration: isFocused ? TextDecoration.underline : null,
      ),
    );
  }
}
