import 'package:wishlist_app/features/product/data/models/product_model.dart';

abstract class ProductDataSource {
  Future<List<ProductModel>> fetchProduct();
}
