import 'package:get/get.dart';
import '../services_page/service_page_controller.dart';

class ServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ServicePageController>(ServicePageController());
  }
}
