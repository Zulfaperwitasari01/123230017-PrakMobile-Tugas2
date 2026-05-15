import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/cart_controller.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Keranjang Belanja"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(() {
        if (controller.cartItems.isEmpty) {
          return const Center(
            child: Text(
              "Keranjang masih kosong",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
        }

        return ListView.builder(
          itemCount: controller.cartItems.length,
          itemBuilder: (context, index) {
            final product = controller.cartItems[index];
            return ListTile(
              leading: const Icon(Icons.shopping_bag_outlined),
              title: Text(product.title ?? 'No Name'),
              subtitle: Text('\$${product.price}'),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.red),
                onPressed: () {
                  Get.defaultDialog(
                    title: "Hapus Item",
                    middleText: "Yakin ingin menghapus ${product.title} dari keranjang?",
                    textConfirm: "Ya, Hapus",
                    textCancel: "Batal",
                    confirmTextColor: Colors.white,
                    buttonColor: Colors.red,
                    onConfirm: () {
                      String productName = product.title ?? 'Produk';
                      
                      // 1. TUTUP DIALOG DULU (Penting!)
                      if (Get.isDialogOpen!) {
                        Get.back();
                      }

                      // 2. Hapus item dari controller
                      controller.removeFromCart(product);

                      // 3. BARU MUNCULKAN SNACKBAR
                      Get.snackbar(
                        "Dihapus",
                        "$productName telah dihapus dari keranjang",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red[50],
                        colorText: Colors.red[900],
                        icon: const Icon(Icons.delete_sweep, color: Colors.red),
                        margin: const EdgeInsets.all(10),
                        duration: const Duration(seconds: 2),
                      );
                    },
                  );
                },
              ),
            );
          },
        );
      }),
      bottomNavigationBar: Obx(() => Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, -2),
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total Harga:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  "\$${controller.totalPrice.toStringAsFixed(2)}",
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}