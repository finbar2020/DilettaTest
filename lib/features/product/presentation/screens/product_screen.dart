import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wishlist_app/features/product/presentation/controller/product_controller.dart';
import 'package:wishlist_app/features/product/presentation/screens/wishlist_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductController>(context, listen: false).fetchWishlist();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ProductController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
      ),
      body: controller.isLoading
          ? const Center(child: CircularProgressIndicator())
          : controller.products.isEmpty
              ? const Center(child: Text('Sua lista está vazia.'))
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.products.length,
                        itemBuilder: (context, index) {
                          final product = controller.products[index];
                          final isSelected =
                              controller.selectedProducts.contains(product);
                          return ListTile(
                            title: Text(product.name),
                            subtitle: Text('R\$ ${product.preco}'),
                            trailing: IconButton(
                              icon: Icon(isSelected ? Icons.check : Icons.add),
                              onPressed: () {
                                isSelected
                                    ? controller.removeFromSelected(product)
                                    : controller.addToSelected(product);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    )
                  ],
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WishlistScreen(),
            ),
          );
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
