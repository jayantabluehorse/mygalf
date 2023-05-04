import 'package:get/get.dart';
import '../../pages/contact_page/contact_controller.dart';

class ContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ContactController>(ContactController());
  }
}