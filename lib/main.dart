import 'package:belajar_getx/bindings/product_binding.dart';
import 'package:belajar_getx/bindings/cart_binding.dart'; 
import 'package:belajar_getx/views/pages/product_detail_page.dart';
import 'package:belajar_getx/views/pages/product_page.dart';
import 'package:belajar_getx/views/pages/cart_page.dart'; 
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/product",
      // initialBinding supaya CartController langsung aktif sejak awal
      initialBinding: CartBinding(), 
      getPages: [
        // 1. Halaman List Produk
        GetPage(
          name: "/product",
          page: () => const ProductPage(),
          binding: ProductBinding(),
        ),

        // 2. Halaman Detail Produk
        GetPage(
          name: "/detail", 
          page: () => ProductDetailPage(), // const sudah dihapus agar tidak error
        ),

        // 3. Halaman Keranjang Belanja
        GetPage(
          name: "/cart", 
          page: () => const CartPage(),
          binding: CartBinding(),
        ),
      ],
    );
  }
}