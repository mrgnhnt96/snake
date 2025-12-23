part of '../snake_game_screen.dart';

enum Direction { up, down, left, right }

class _Game extends ChangeNotifier {
  _Game({required Difficulty difficulty})
    : _difficulty = difficulty,
      _movingController = StreamController<void>() {
    _body = List.generate(2, (index) {
      return Place(head.x, head.y + index + 1);
    });

    _setMouse();
    _startMoving();
    _movingController.add(null);
  }

  final Difficulty _difficulty;
  final StreamController<void> _movingController;

  @override
  void dispose() {
    _movingController.close();
    super.dispose();
  }

  void _die() {
    _movingController.close();
    notifyListeners();
  }

  bool _isMoving = false;
  void _startMoving() async {
    if (_isMoving) return;
    _isMoving = true;

    var count = 0;
    final completers = <int, Completer<void>?>{};
    completers[count] = Completer()
      ..future.then((_) => _movingController.add(null));

    void Function() complete(int index) {
      return () {
        final completer = completers.remove(index);
        completer?.complete();
      };
    }

    await for (final _ in _movingController.stream) {
      completers[count] = null;
      count++;

      _move();
      _canChangeDirection = true;

      completers[count] = Completer()
        ..future.then((_) => _movingController.add(null));
      Future.delayed(speed, complete(count));
    }
  }

  bool _canChangeDirection = true;

  Direction _direction = Direction.right;
  Direction get direction => _direction;

  set direction(Direction direction) {
    if (_direction == direction) {
      _updateScore(plus: 1);
      _movingController.add(null);
      return;
    }
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
    _movingController.add(null);
    notifyListeners();
  }

  int _score = 0;
  int get score => _score;
  void _updateScore({required int plus}) {
    _score += plus;
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
      _die();
      return;
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
    _updateScore(plus: 100);
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
