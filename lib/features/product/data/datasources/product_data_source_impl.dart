import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wishlist_app/core/erros/servers_exception.dart';
import 'package:wishlist_app/features/product/data/datasources/product_data_source.dart';

import 'package:wishlist_app/features/product/data/models/product_model.dart';

class ProductDataSourceImpl implements ProductDataSource {
  final http.Client client;

  ProductDataSourceImpl(this.client);

  @override
  Future<List<ProductModel>> fetchProduct() async {
    try {
      final response = await client.get(Uri.parse(
          'https://671196e34eca2acdb5f52dc3.mockapi.io/api/v1/produto'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => ProductModel.fromJson(json)).toList();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
