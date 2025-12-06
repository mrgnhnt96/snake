part of '../snake_game_screen.dart';

enum Direction { up, down, left, right }

class _Game extends ChangeNotifier {
  _Game({required Difficulty difficulty}) : _difficulty = difficulty {
    _body = List.generate(2, (index) {
      return Place(head.x, head.y + index + 1);
    });

    _setMouse();

    _ticker = Timer.periodic(speed, (timer) {
      _move();
      _canChangeDirection = true;
    });
  }

  final Difficulty _difficulty;
  late final Timer _ticker;

  bool _canChangeDirection = true;

  @override
  void dispose() {
    _ticker.cancel();
    super.dispose();
  }

  Direction _direction = Direction.right;
  Direction get direction => _direction;

  set direction(Direction direction) {
    if (_direction == direction) return;
    if (!_canChangeDirection) return;
    _canChangeDirection = false;

    switch ((direction, _direction)) {
      // disable opposite directions
      case (Direction.up, Direction.down):
      case (Direction.down, Direction.up):
      case (Direction.left, Direction.right):
      case (Direction.right, Direction.left):
        return;
      default:
        break;
    }

    _direction = direction;
    notifyListeners();
  }

  /// The time required to move one tile
  Duration get speed => _difficulty.speed;

  int get length => _body.length + 1;

  Place _head = Place(0, 0);
  Place get head => _head;

  late List<Place> _body;
  List<Place> get body => List.unmodifiable(_body);

  bool get intercectsWithBody => _body.contains(_head);

  void _move() {
    var newHead = switch (_direction) {
      Direction.up => Place(_head.x, _head.y - 1),
      Direction.down => Place(_head.x, _head.y + 1),
      Direction.left => Place(_head.x - 1, _head.y),
      Direction.right => Place(_head.x + 1, _head.y),
    };

    switch (newHead) {
      case Place(:final x, :final y):
        if (x < 0) {
          newHead = Place(_difficulty.size - 1, y);
        } else if (x >= _difficulty.size) {
          newHead = Place(0, y);
        } else if (y < 0) {
          newHead = Place(x, _difficulty.size - 1);
        } else if (y >= _difficulty.size) {
          newHead = Place(x, 0);
        }
        break;
    }

    final [...body, _] = _body;

    _body = [head, ...body];
    _head = newHead;

    if (intercectsWithBody) {
      _ticker.cancel();
    }

    if (newHead == _mouse) {
      gotMouse();
      return;
    }

    notifyListeners();
  }

  late Place _mouse;
  Place get mouse => _mouse;

  void gotMouse() {
    _setMouse();
    final [...body, last] = _body;

    _body = [...body, last, last];

    notifyListeners();
  }

  void _setMouse() {
    final x = Random().nextInt(_difficulty.size - 1);
    final y = Random().nextInt(_difficulty.size);
    _mouse = Place(x, y);

    if (head == _mouse) {
      _setMouse();
      return;
    }

    if (body.contains(_mouse)) {
      _setMouse();
      return;
    }
  }
}
