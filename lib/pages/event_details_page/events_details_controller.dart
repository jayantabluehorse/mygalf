import 'package:get/get.dart';

import 'package:my_galf/pages/events_page/events_model.dart';
import 'package:my_galf/services/api.dart';

class EventDetailsController extends GetxController {
  var isLoading = false.obs;
  List<EventModel> eventData = <EventModel>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  void fetchProducts(id) async {
    try {
      isLoading(true);
      var products = await ApiService().fetchPostData(
          "https://mygalf.tezcommerce.com/api/v1/events/view",
          {"id": id, "storeId": 1},
          "eventdetails");

      eventData.assignAll([EventModel.fromJson(products)]);
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
      // print("from EventList $eventData");
    }
  }
}
