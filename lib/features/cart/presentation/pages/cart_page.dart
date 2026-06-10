import 'package:dim0524_ecommerce/features/cart/data/cart_controller.dart';
import 'package:dim0524_ecommerce/features/cart/presentation/widgets/cart_empty.dart';
import 'package:dim0524_ecommerce/features/cart/presentation/widgets/cart_item_card.dart';
import 'package:dim0524_ecommerce/features/cart/presentation/widgets/cart_summary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
        actions: [
          Obx(() => cart.items.isEmpty
              ? const SizedBox()
              : TextButton(
                  onPressed: () => cart.clearCart(),
                  child: const Text('Limpar', style: TextStyle(color: Colors.red)),
                )),
        ],
      ),
      body: Obx(() {
        if (cart.items.isEmpty) return const CartEmpty();
        return Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: cart.items.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) =>
                    CartItemCard(item: cart.items[index]),
              ),
            ),
            const CartSummary(),
          ],
        );
      }),
    );
  }
}