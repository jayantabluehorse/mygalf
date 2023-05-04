import 'package:get/get.dart';
import 'package:my_galf/pages/service_details_page/service_details_controller.dart';

class ServiceDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ServiceDetailsController());
  }
}
