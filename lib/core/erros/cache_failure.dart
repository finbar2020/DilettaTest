import 'package:wishlist_app/core/erros/failures.dart';

class CacheFailure extends Failure {
  final String message;

  CacheFailure({this.message = 'Cache failure occurred'});

  @override
  List<Object?> get props => [message];
}
