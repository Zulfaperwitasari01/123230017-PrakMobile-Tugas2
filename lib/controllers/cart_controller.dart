import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  void addToCart(Product product) {
    cartItems.add(product);
    Get.snackbar(
      "Berhasil",
      "Item ditambahkan",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blueGrey.withOpacity(0.9),
      colorText: Colors.white,
      duration: const Duration(seconds: 1),
      margin: const EdgeInsets.all(10),
    );
  }

  void removeFromCart(Product product) {
    cartItems.remove(product);
    Get.snackbar(
      "Dihapus",
      "${product.title} telah dihapus",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red.withOpacity(0.9),
      colorText: Colors.white,
      duration: const Duration(seconds: 1),
      margin: const EdgeInsets.all(10),
    );
  }

  double get totalPrice {
    return cartItems.fold(0, (sum, item) => sum + (item.price ?? 0));
  }
}