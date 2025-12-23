import 'package:nocterm/nocterm.dart';

class Number extends StatelessComponent {
  const Number(this.number);

  final int number;

  @override
  Component build(BuildContext context) {
    final parts = '$number'.split('');

    final lines = List.generate(4, (index) => '');
    for (final (index, part) in parts.indexed) {
      final number = _numbers[int.tryParse(part)];
      if (number == null) {
        assert(false, 'Expected number to be between 0 and 9');
        continue;
      }

      final partLines = number.split('\n');
      assert(partLines.length == 4, 'Expected number to have 4 lines');

      final space = index == parts.length - 1 ? '' : '  ';

      for (final (i, line) in partLines.indexed) {
        if (line.isEmpty) continue;

        lines[i] += '$line$space';
      }
    }

    return Text(lines.join('\n'));
  }
}

const _numbers = {
  1: '''
▄
█
█
█''',
  2: '''
▄▄▄▄
   █
█▀▀▀
█▄▄▄''',
  3: '''
▄▄▄▄
   █
 ▀▀█
▄▄▄█''',
  4: '''
▄  ▗▖
█  ▐▌
▀▀▀▜▌
   ▐▌''',
  5: '''
▄▄▄▄
█   
▀▀▀█
▄▄▄█''',
  6: '''
▄▄▄▄
█   
█▀▀█
█▄▄█''',
  7: '''
▗▄▄▄▖
   ▐▌
   ▐▌
   ▐▌''',
  8: '''
▄▄▄▄
█  █
█▀▀█
█▄▄█''',
  9: '''
▄▄▄▄
█  █
▀▀▀█
▄▄▄█''',
};
