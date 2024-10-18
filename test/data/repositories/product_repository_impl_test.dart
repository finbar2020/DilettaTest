import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:wishlist_app/core/erros/servers_exception.dart';
import 'package:wishlist_app/core/erros/servers_failures.dart';

import 'package:wishlist_app/features/product/data/datasources/product_data_source.dart';
import 'package:wishlist_app/features/product/data/models/product_model.dart';
import 'package:wishlist_app/features/product/data/repositories/product_repository_impl.dart';

import 'product_repository_impl_test.mocks.dart';

@GenerateMocks([ProductDataSource])
void main() {
  late ProductRepositoryImpl repository;
  late MockProductDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockProductDataSource();
    repository = ProductRepositoryImpl(mockDataSource);
  });

  group('getWishlist', () {
    final tProductList = [
      ProductModel(id: '4', name: 'Fish', preco: "921.00"),
      ProductModel(id: '5', name: 'Mouse', preco: "948.00"),
      ProductModel(id: '6', name: 'Towels', preco: "957.00"),
    ];

    test('should return a list of Product when the data source is successful',
        () async {
      // Arrange
      when(mockDataSource.fetchProduct())
          .thenAnswer((_) async => Future.value(tProductList));

      // Act
      final result = await repository.getProduct();

      // Assert
      expect(result, equals(Right(tProductList)));
    });

    test('should return a ServerFailure when the data source fails', () async {
      // Arrange
      when(mockDataSource.fetchProduct()).thenThrow(ServerException());

      // Act
      final result = await repository.getProduct();

      // Assert
      expect(result, equals(Left(ServerFailure())));
    });
  });
}
