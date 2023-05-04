import 'package:get/get.dart';
import 'package:my_galf/pages/signup/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SignupController>(SignupController());
  }
}
