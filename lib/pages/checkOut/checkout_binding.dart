import 'package:get/get.dart';
import '../../pages/checkOut/checkout_controller.dart';

class CheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CheckoutController>(CheckoutController());
  }
}