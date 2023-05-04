import 'package:get/get.dart';
import 'package:my_galf/pages/product_details_page/product_details_controller.dart';

class ProductDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProductDetailsController>(ProductDetailsController());
  }
}
