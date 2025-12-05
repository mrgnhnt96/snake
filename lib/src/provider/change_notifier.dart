part of 'provider.dart';

// base class ChangeNotifier {
//   ChangeNotifier();

//   final Set<BuildContext> _contexts = {};
//   final List<void Function()> _listeners = [];

//   void _addContext(BuildContext context) {
//     if (_contexts.add(context)) {
//       log('Added new context to ChangeNotifier');
//     }
//   }

//   void addListener(void Function(ChangeNotifier) fn) {
//     _listeners.add(() => fn(this));
//   }

//   void removeListener(void Function() fn) {
//     _listeners.remove(fn);
//   }

//   void notifyListeners() {
//     log('Notifying listeners: ${_contexts.length}');
//     for (final context in _contexts) {
//       if (context case Element()) {
//         context.markNeedsBuild();
//       }
//     }

//     for (final listener in _listeners) {
//       try {
//         listener();
//       } catch (_) {}
//     }
//   }
// }
