  // shared/data/cart_controller.dart
  import 'package:dim0524_ecommerce/shared/data/auth_preference.dart';
  import 'package:dim0524_ecommerce/shared/models/cart_item.dart';
  import 'package:dim0524_ecommerce/shared/models/product.dart';
  import 'package:get/get.dart';

  class CartController extends GetxController {
    final RxList<CartItem> items = <CartItem>[].obs;

    int get totalItems => items.fold(0, (sum, item) => sum + item.quantity);
    double get totalPrice => items.fold(0.0, (sum, item) => sum + (item.quantity * item.product.price));

    @override
    void onInit() {
      super.onInit();
      _loadCart();
    }

    Future<void> _loadCart() async {
      final savedItems = await Get.find<Preference>().getCart();
      items.assignAll(savedItems); 
      
    }

    void _saveCart() {
      Get.find<Preference>().saveCart(items.toList());
    }

    void addProduct(Product product) {
      final index = items.indexWhere((e) => e.product.id == product.id);
      if (index >= 0) {
        items[index].quantity++;
        items.refresh();
      } else {
        items.add(CartItem(product: product));
      }

      _saveCart();
    }

    void removeProduct(Product product) {
      items.removeWhere((e) => e.product.id == product.id);
      _saveCart();
    }

    void decrementProduct(Product product) {
      final index = items.indexWhere((e) => e.product.id == product.id);
      if (index >= 0) {
        if (items[index].quantity > 1) {
          items[index].quantity--;
          items.refresh();
        } else {
          items.removeAt(index);
        }
      }
      _saveCart();
    }

    void clearCart() {
      items.removeRange(0, items.length);
      _saveCart();
    }
  }