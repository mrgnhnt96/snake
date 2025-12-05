part of '../winner_screen.dart';

class _TryAgain extends StatelessComponent {
  const _TryAgain();

  @override
  Component build(BuildContext context) {
    return Focusable(
      focused: true,
      onKeyEvent: (event) {
        context.read<NavStack>().push(const IntroRoute());

        return true;
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Try Again?', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 1),
          Text(
            'Press any key to continue',
            style: TextStyle(color: Colors.brightBlack),
          ),
        ],
      ),
    );
  }
}
