import 'package:dartz/dartz.dart';
import 'package:wishlist_app/core/erros/failures.dart';

abstract class UseCase<Type> {
  Future<Either<Failure, Type>> call();
}
