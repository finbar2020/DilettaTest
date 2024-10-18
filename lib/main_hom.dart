import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:wishlist_app/app.dart';
import 'package:wishlist_app/features/product/data/datasources/product_data_source_impl.dart';
import 'package:wishlist_app/features/product/data/repositories/product_repository_impl.dart';
import 'package:wishlist_app/features/product/domain/usecases/get_product_use_cases.dart';
import 'package:wishlist_app/features/product/presentation/controller/product_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  FlavorConfig(
    name: "hom",
    color: Colors.green,
    location: BannerLocation.bottomEnd,
    variables: {
      "baseUrl": "https://671196e34eca2acdb5f52dc3.mockapi.io/api/",
    },
  );
  final client = http.Client();

  //DataSource

  final productDataSource = ProductDataSourceImpl(client);

  //Repository

  final productRepository = ProductRepositoryImpl(productDataSource);

  //Usecase
  final getProducts = GetProducts(productRepository);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductController(getProducts),
        ),
      ],
      child: const App(),
    ),
  );
}
