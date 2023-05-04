import 'package:get/get.dart';
import 'package:my_galf/pages/events_page/events_controller.dart';

class EventBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<EventController>(EventController());
  }
}
