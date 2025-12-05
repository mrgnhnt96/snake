import 'package:nocterm/nocterm.dart';
import 'package:nocterm_provider/provider.dart';
import 'package:snake/src/data/nav.dart';

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
