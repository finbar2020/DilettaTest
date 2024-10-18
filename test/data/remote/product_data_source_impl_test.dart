import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:wishlist_app/core/erros/servers_exception.dart';
import 'package:wishlist_app/features/product/data/datasources/product_data_source_impl.dart';
import 'package:wishlist_app/features/product/domain/entities/product_entities.dart';

void main() {
  late ProductDataSourceImpl dataSource;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient((request) async {
      final uri = request.url.toString();
      if (uri.contains('product')) {
        return http.Response(
          json.encode({
            'results': [
              {"name": "Fish", "preco": 921.00, "id": "4"},
              {"name": "Mouse", "preco": 948.00, "id": "5"},
              {"name": "Towels", "preco": 957.00, "id": "6"},
            ],
          }),
          200,
        );
      }
      return http.Response('Not Found', 404);
    });
    dataSource = ProductDataSourceImpl(mockClient);
  });

  group('fetchProducts', () {
    final tProductList = [
      Product(id: '4', name: 'Fish', preco: "921.00"),
      Product(id: '5', name: 'Mouse', preco: "948.00"),
      Product(id: '6', name: 'Towels', preco: "957.00"),
    ];

    test('should return a list of Product when the response code is 200',
        () async {
      // Act
      final result = await dataSource.fetchProduct();

      // Assert
      expect(result, equals(tProductList));
    });

    test('should throw a ServerException when the response code is not 200',
        () async {
      // Arrange
      final mockErrorClient = MockClient((request) async {
        return http.Response('Something went wrong', 500);
      });
      dataSource = ProductDataSourceImpl(mockErrorClient);

      // Act
      final call = dataSource.fetchProduct();

      // Assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
}
