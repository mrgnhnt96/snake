part of 'provider.dart';

class Listener<T extends ChangeNotifier> extends StatefulComponent {
  const Listener({super.key, required this.onEvent, required this.child});

  final void Function(T) onEvent;
  final Component child;

  @override
  State<StatefulComponent> createState() => _ListenerState<T>();
}

class _ListenerState<T extends ChangeNotifier> extends State<Listener<T>> {
  T? _notifier;
  set notifier(T value) {
    if (_notifier != null) return;

    _notifier = value;
    _notifier?.addListener(() {
      if (_notifier case final T value) {
        component.onEvent(value);
      } else {
        assert(false, 'Notifier is not of type $T');
      }
    });
  }

  @override
  Component build(BuildContext context) {
    notifier = context.watch<T>();

    return component.child;
  }
}
