import 'package:dim0524_ecommerce/features/cart/data/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({super.key});

  static const Color _primary = Color(0xFF0D9488);

  @override
  Widget build(BuildContext context) {
    final cart = Get.find<CartController>();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFE2E8F0))),
      ),
      child: Column(
        children: [
          const SizedBox(height: 6),
          const Divider(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Obx(() => Text(
                    'R\$ ${cart.totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  )),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  'Compra Finalizada! 🎉',
                  'Seu pedido foi realizado com sucesso.',
                  snackPosition: SnackPosition.BOTTOM, 
                  backgroundColor: _primary, 
                  colorText: Colors.white,  
                  margin: const EdgeInsets.all(16),
                  duration: const Duration(seconds: 3),
                  icon: const Icon(Icons.check_circle, color: Colors.white),
                );

                cart.clearCart();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _primary,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                'Finalizar compra',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}