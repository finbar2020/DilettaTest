

import 'package:wishlist_app/core/erros/failures.dart';

class NetworkFailure extends Failure {
  final String message;

  NetworkFailure({this.message = 'Network connection failed'});

  @override
  List<Object?> get props => [message];
}
