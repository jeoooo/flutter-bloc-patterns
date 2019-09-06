import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

/// Base class for states.
@immutable
abstract class State extends Equatable {
  State([List props = const []]) : super(props);
}

/// State indicating that data is being loaded.
class Loading extends State {
  @override
  String toString() => 'Loading';
}

/// State indicating that data is being refreshed. It can occur only after
/// initial loading ends with [Success] or [Empty] result. It may contain
/// the data that has already been loaded.
class Refreshing<T> extends State {
  final T data;

  Refreshing(this.data) : super([data]);

  @override
  String toString() => 'Refreshing: $data';
}

/// State indicating that data was loaded successfully, but was null or empty.
class Empty extends State {
  @override
  String toString() => 'Empty';
}

/// State indicating that data was loaded successfully and is not null nor empty.
/// [T] - list element type.
class Success<T> extends State {
  final T data;

  Success(this.data)
      : assert(data != null),
        super([data]);

  @override
  String toString() => 'Success: $data';
}

/// State indicating that loading or refreshing has failed. It contains an
/// exact [error] that has occurred.
class Failure extends State {
  final dynamic error;

  Failure(this.error)
      : assert(error != null),
        super([error]);

  @override
  String toString() => 'Failure: $error';
}