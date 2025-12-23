import 'package:nocterm/nocterm.dart';
import 'package:nocterm_provider/provider.dart';
import 'package:snake/src/components/number.dart';
import 'package:snake/src/data/nav.dart';

part 'components/__try_again.dart';

class GameOverScreen extends StatelessComponent {
  const GameOverScreen({super.key, required this.score});

  final int score;

  @override
  Component build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('''
 ██████╗  █████╗ ███╗   ███╗███████╗     ██████╗ ██╗   ██╗███████╗██████╗ 
██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ██╔═══██╗██║   ██║██╔════╝██╔══██╗
██║  ███╗███████║██╔████╔██║█████╗      ██║   ██║██║   ██║█████╗  ██████╔╝
██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ██║   ██║██║   ██║██╔══╝  ██╔══██╗
╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ╚██████╔╝╚██████╔╝███████╗██║  ██║
 ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝     ╚═════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝
════════════════════════════════════════════════════════════════════════════
'''),
        SizedBox(height: 1),
        Center(child: Text('You lost!', textAlign: TextAlign.center)),
        SizedBox(height: 1),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                'Score',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.brightBlack,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Center(child: Number(score)),
          ],
        ),
        SizedBox(height: 2),
        const _TryAgain(),
      ],
    );
  }
}
