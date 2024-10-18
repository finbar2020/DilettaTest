import 'package:dartz/dartz.dart';
import 'package:wishlist_app/core/erros/failures.dart';
import 'package:wishlist_app/core/erros/servers_failures.dart';
import 'package:wishlist_app/features/product/data/datasources/product_data_source.dart';
import 'package:wishlist_app/features/product/data/repositories/product_repository.dart';
import 'package:wishlist_app/features/product/domain/entities/product_entities.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource wishlistDataSource;

  ProductRepositoryImpl(this.wishlistDataSource);

  @override
  Future<Either<Failure, List<Product>>> getProduct() async {
    try {
      final productModels = await wishlistDataSource.fetchProduct();
      final product = productModels.map((model) => model.toEntity()).toList();
      return Right(product);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
