import 'package:get/get.dart';
import 'package:my_galf/pages/lounge_page/lounge_controller.dart';

class LoungeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoungeController>(LoungeController());
  }
}
