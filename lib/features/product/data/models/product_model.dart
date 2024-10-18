import 'package:wishlist_app/features/product/domain/entities/product_entities.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.name,
    required super.preco,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      preco: json['preco'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'preco': preco,
    };
  }

  Product toEntity() {
    return Product(id: id, name: name, preco: preco);
  }
}
