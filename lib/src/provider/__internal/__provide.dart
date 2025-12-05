part of '../provider.dart';

class _Provide<T> extends InheritedComponent {
  _Provide({required super.child, this.value, this.create});

  final T? value;
  final T? Function()? create;

  @override
  bool updateShouldNotify(covariant InheritedComponent oldComponent) {
    return true;
  }
}
