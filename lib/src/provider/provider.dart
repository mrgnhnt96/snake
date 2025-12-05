import 'package:nocterm/nocterm.dart';

part '__internal/__provide.dart';
part 'build_context_extensions.dart';
part 'change_notifier.dart';
part 'listener.dart';

class Provider<T> extends StatefulComponent {
  const Provider({
    super.key,
    required T Function(BuildContext) this.create,
    this.child,
    this.builder,
  }) : value = null;

  const Provider.value({
    super.key,
    required T this.value,
    this.child,
    this.builder,
  }) : create = null;

  /// Obtains the nearest [Provider<T>] up its widget tree and returns its
  /// value.
  ///
  /// If [listen] is `true`, later value changes will trigger a new
  /// [State.build] to widgets, and [State.didChangeDependencies] for
  /// [StatefulWidget].
  ///
  /// `listen: false` is necessary to be able to call `Provider.of` inside
  /// [State.initState] or the `create` method of providers like so:
  ///
  /// ```dart
  /// Provider(
  ///   create: (context) {
  ///     return Model(Provider.of<Something>(context, listen: false)),
  ///   },
  /// )
  /// ```
  static T of<T>(BuildContext context, {bool listen = true}) {
    final inheritedElement = _inheritedElementOf<T>(context);

    if (listen) {
      // bind context with the element
      // We have to use this method instead of dependOnInheritedElement, because
      // dependOnInheritedElement does not support relocating using GlobalKey
      // if no provider were found previously.
      context.dependOnInheritedComponentOfExactType<_Provide<T>>();
    }

    final value = switch (inheritedElement) {
      null => null,
      _Provide<T>(:final value?) => value,
      _Provide<T>(:final create?) => create(),
      _ => throw Exception(
        'Unexpected type: ${inheritedElement.runtimeType}, expected: _Provide<T>',
      ),
    };

    if (value case final T value) {
      // if (value case final ChangeNotifier notifier) {
      //   notifier._addContext(context);
      // }

      return value;
    }

    if (null case final T nullValue) {
      return nullValue;
    }

    throw Exception('Could not find Provider ($T) in context');
  }

  static _Provide<T>? _inheritedElementOf<T>(BuildContext context) {
    // ignore: unnecessary_null_comparison, can happen if the application depends on a non-migrated code
    assert(context != null, '''
Tried to call context.read/watch/select or similar on a `context` that is null.

This can happen if you used the context of a StatefulWidget and that
StatefulWidget was disposed.
''');
    assert(T != dynamic, '''
Tried to call Provider.of<dynamic>. This is likely a mistake and is therefore
unsupported.

If you want to expose a variable that can be anything, consider changing
`dynamic` to `Object` instead.
''');
    final inheritedElement = context
        .getElementForInheritedComponentOfExactType<_Provide<T>>();

    if (inheritedElement == null && null is! T) {
      throw Exception('Could not find Provider ($T) in context');
    }

    if (inheritedElement?.component case final _Provide<T> value) {
      return value;
    }

    throw Exception('Could not find Provider ($T) in context');
  }

  final T Function(BuildContext)? create;
  final T? value;
  final Component? child;
  final Component Function(BuildContext)? builder;

  @override
  State<StatefulComponent> createState() => _ProviderState<T>();
}

class _ProviderState<T> extends State<Provider<T>> {
  T? value;

  @override
  Component build(BuildContext context) {
    return _Provide<T>(
      value: value,
      create: () => component.create?.call(context),
      child: Builder(
        builder: (context) {
          return component.child ??
              component.builder?.call(context) ??
              const SizedBox();
        },
      ),
    );
  }
}
