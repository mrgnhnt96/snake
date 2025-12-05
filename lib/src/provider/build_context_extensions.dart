part of 'provider.dart';

extension BuildContextX on BuildContext {
  T read<T>() {
    return Provider.of<T>(this, listen: false);
  }

  T watch<T>() {
    return Provider.of<T>(this, listen: true);
  }

  R select<R, T>(R Function(T) selector) {
    final value = watch<T>();

    return selector(value);
  }
}
