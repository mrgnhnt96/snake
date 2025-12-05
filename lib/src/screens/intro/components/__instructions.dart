part of '../intro_screen.dart';

class _Instructions extends StatelessComponent {
  const _Instructions();

  @override
  Component build(BuildContext context) {
    final style = TextStyle(color: Colors.brightBlack);

    return Column(
      children: [
        Text('Press Space to select', style: style),
        Text('Arrow Up/Down to navigate', style: style),
        Text('Enter to continue', style: style),
      ],
    );
  }
}
