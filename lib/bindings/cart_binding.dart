import 'package:get/get.dart';
import '../controllers/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    // Inisialisasi CartController saat route dipanggil [cite: 166]
    Get.lazyPut<CartController>(() => CartController());
  }
}