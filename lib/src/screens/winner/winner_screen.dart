import 'package:nocterm/nocterm.dart';
import 'package:snake/src/data/nav.dart';
import 'package:snake/src/provider/provider.dart';

part 'components/__try_again.dart';

class WinnerScreen extends StatelessComponent {
  const WinnerScreen({super.key});

  @override
  Component build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('''
██╗   ██╗ ██████╗ ██╗   ██╗    ██╗    ██╗ ██████╗ ███╗   ██╗   ██╗
██║   ██║██╔═══██╗██║   ██║    ██║    ██║██╔═══██╗████╗  ██║   ██║
██║   ██║██║   ██║██║   ██║    ██║ █╗ ██║██║   ██║██╔██╗ ██║   ██║
╚██╗ ██╔╝██║   ██║██║   ██║    ██║███╗██║██║   ██║██║╚██╗██║   ╚═╝
 ╚████╔╝ ╚██████╔╝╚██████╔╝    ╚███╔███╔╝╚██████╔╝██║ ╚████║   ██╗
  ╚═══╝   ╚═════╝  ╚═════╝      ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═══╝   ╚═╝
══════════════════════════════════════════════════════════════════
'''),
        Text('You won!'),
        SizedBox(height: 1),
        const _TryAgain(),
      ],
    );
  }
}
