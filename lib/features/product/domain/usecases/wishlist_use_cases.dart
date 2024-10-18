import 'package:dartz/dartz.dart';
import 'package:wishlist_app/core/erros/failures.dart';
import 'package:wishlist_app/core/usecase/use_case.dart';
import 'package:wishlist_app/features/product/data/repositories/product_repository.dart';
import 'package:wishlist_app/features/product/domain/entities/product_entities.dart';

class GetProducts extends UseCase<List<Product>> {
  final ProductRepository repository;

  GetProducts(this.repository);

  @override
  Future<Either<Failure, List<Product>>> call() async {
    final result = await repository.getProduct();
    return result;
  }
}
