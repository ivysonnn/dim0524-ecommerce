import 'package:dim0524_ecommerce/shared/data/auth_preference.dart';
import 'package:dim0524_ecommerce/features/cart/data/cart_controller.dart'; 
import 'package:dim0524_ecommerce/shared/data/product_handler.dart';
import 'package:dim0524_ecommerce/shared/models/product.dart';
import 'package:dim0524_ecommerce/features/home/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List<Product> products = [];
  bool isLoading = true;
  String? error;

  @override 
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    try {
      final result = await Get.find<ProductHandler>().getProducts();
      setState(() {
        products = result;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        isLoading = false;
      });
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pagina inicial'),
          actions: [
            Obx(() {
              final count = Get.find<CartController>().totalItems;
              return Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.toNamed('/cart');
                    },
                    icon: const Icon(Icons.shopping_cart),
                    tooltip: 'Carrinho',
                  ),
                  if (count > 0)
                    Positioned(
                      right: 6,
                      top: 6,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '$count',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              );
            }),
            IconButton(
              onPressed: () async{
                Get.find<Preference>().logout();
                Get.find<CartController>().clearCart();
                await Get.find<Preference>().clearCart();
                Get.offAllNamed('/login');
              }, 
              icon: Icon(Icons.logout),
              tooltip: 'Sair da conta',
            )
          ],
        ),
        body: _buildBody(),
      );
  }

  Widget _buildBody() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (error != null) {
      return Center(child: Text("Erro: $error"));
    }

    return ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsetsGeometry.only(
                bottom: 16
              ),
              child: Center(
                child: SizedBox(
                  width: 325,
                  child: ProductCard(product: products[index]),
                ),
              ),
            );
          }
        );
  }
}