import 'package:get/get.dart';
import 'package:my_galf/components/request_callback/request_callback_controller.dart';

class RequestCallbackBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RequestCallBackController>(RequestCallBackController());
  }
}
