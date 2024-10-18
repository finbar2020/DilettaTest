import 'package:wishlist_app/core/erros/failures.dart';

class ServerFailure extends Failure {
  final String message;

  ServerFailure({this.message = 'Server failure occurred'});

  @override
  List<Object?> get props => [message];
}
