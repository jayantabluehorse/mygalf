import 'package:get/get.dart';
import 'package:my_galf/pages/product_page/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProductController>(ProductController());
  }
}
