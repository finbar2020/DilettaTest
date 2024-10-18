import 'package:flutter/material.dart';
import 'package:wishlist_app/features/product/domain/entities/product_entities.dart';
import 'package:wishlist_app/features/product/domain/usecases/get_product_use_cases.dart';

class ProductController extends ChangeNotifier {
  final GetProducts getProducts;

  ProductController(
    this.getProducts,
  );

  List<Product> _products = [];
  List<Product> selectedProducts = [];

  bool _isLoading = false;

  String _error = '';
  String get error => _error;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  void fetchWishlist() async {
    _isLoading = true;
    _error = '';
    _products = [];
    notifyListeners();

    final result = await getProducts();

    result.fold(
      (failure) {
        _error = 'Error ao carregar a lista de produtos';
        _isLoading = false;
        notifyListeners();
      },
      (result) {
        _products = result;
        _isLoading = false;
        notifyListeners();
      },
    );
  }

  void addToSelected(Product product) {
    if (!selectedProducts.contains(product)) {
      selectedProducts.add(product);
      notifyListeners();
    }
  }

  void removeFromSelected(Product product) {
    selectedProducts.remove(product);
    notifyListeners();
  }
}
