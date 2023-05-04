import 'package:get/get.dart';
import 'package:my_galf/pages/event_details_page/events_details_controller.dart';

class EventDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<EventDetailsController>(EventDetailsController());
  }
}
