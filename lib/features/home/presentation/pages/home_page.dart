import 'package:dim0524_ecommerce/features/auth/presentation/pages/login_page.dart';
import 'package:dim0524_ecommerce/shared/models/product.dart';
import 'package:dim0524_ecommerce/shared/widgets/product_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final List<Product> products = [
    Product(title: "Notebook i7", price: 3500.00, description: "15 polegadas", imageURL: ""),
    Product(title: "Mouse Gamer", price: 150.00, description: "RGB", imageURL: ""),
    Product(title: "Teclado Mecânico", price: 300.00, description: "Switch Azul", imageURL: ""),
    Product(title: "Monitor 24", price: 800.00, description: "Full HD", imageURL: ""),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pagina inicial'),
          actions: [
            IconButton(
              onPressed: () => {}, 
              icon: const Icon(Icons.shopping_cart),
              tooltip: 'Carrinho',
            ),
            IconButton(
              onPressed: () => {
                Navigator.pop(context),
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage())
                )  
              }, 
              icon: Icon(Icons.logout),
              tooltip: 'Sair da conta',
            )
          ],
        ),
        body: ListView.builder(
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
        )
      );
  }
}