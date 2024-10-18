import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wishlist_app/features/product/presentation/controller/product_controller.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ProductController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Desejos'),
      ),
      body: controller.selectedProducts.isEmpty
          ? const Center(child: Text('Lista de desejos vazia'))
          : ListView.builder(
              itemCount: controller.selectedProducts.length,
              itemBuilder: (context, index) {
                final product = controller.selectedProducts[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('R\$ ${product.preco}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      controller.removeFromSelected(product);
                    },
                  ),
                );
              },
            ),
    );
  }
}
