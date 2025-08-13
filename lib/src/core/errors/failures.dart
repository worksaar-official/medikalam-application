// Package imports:
import 'package:equatable/equatable.dart';

abstract class CustomFailure extends Equatable {
  const CustomFailure() : super();
}

class ServerFailure extends CustomFailure with EquatableMixin {
  ServerFailure({this.message = 'Some unexpected server failure occured!'})
      : super();
  final String message;

  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return message;
  }
}
