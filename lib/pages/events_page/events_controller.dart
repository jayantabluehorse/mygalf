import 'package:get/get.dart';
import 'package:my_galf/pages/events_page/events_model.dart';
import 'package:my_galf/services/api.dart';

class EventController extends GetxController {
  var isLoading = false.obs;
  var eventList = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ApiService().fetchPostData(
          "https://mygalf.tezcommerce.com/api/v1/events/list",
          {"storeId": 1},
          "event");

      eventList.assignAll(products.map((ele) {
        return EventModel.fromJson(ele);
      }).toList());
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
      // print("from EventList $eventList");
    }
  }
}
