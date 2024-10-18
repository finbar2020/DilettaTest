import 'package:dartz/dartz.dart';
import 'package:wishlist_app/core/erros/failures.dart';
import 'package:wishlist_app/features/product/domain/entities/product_entities.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProduct();
}
