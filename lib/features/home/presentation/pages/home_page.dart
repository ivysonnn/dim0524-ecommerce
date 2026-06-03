import 'package:dim0524_ecommerce/features/auth/data/auth_handler.dart';
import 'package:dim0524_ecommerce/shared/data/product_hadler.dart';
import 'package:dim0524_ecommerce/shared/models/product.dart';
import 'package:dim0524_ecommerce/shared/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  final AuthHandler authHandler;
  final ProductHandler productHandler;
  const HomePage({super.key, required this.authHandler, required this.productHandler});

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
      final result = await widget.productHandler.getProducts();
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
            IconButton(
              onPressed: () {}, 
              icon: const Icon(Icons.shopping_cart),
              tooltip: 'Carrinho',
            ),
            IconButton(
              onPressed: () {
                widget.authHandler.logout();
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